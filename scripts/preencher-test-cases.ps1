param(
    [Parameter(Mandatory = $true)][string]$Arquivo,
    [string]$Organizacao = "valence-gs2026",
    [string]$Projeto = "Valence-QA",
    [string]$Somente = "",
    [switch]$Simular
)

$ErrorActionPreference = "Stop"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
[Net.ServicePointManager]::Expect100Continue = $false

# Autenticacao
$tokenSeguro = Read-Host "Cole o Personal Access Token (Work Items: Read & write)" -AsSecureString
$ptr = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($tokenSeguro)
$pat = ([Runtime.InteropServices.Marshal]::PtrToStringBSTR($ptr)).Trim()
[Runtime.InteropServices.Marshal]::ZeroFreeBSTR($ptr)
$basico = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$pat"))
$cabecalho = @{ Authorization = "Basic $basico" }
$base = "https://dev.azure.com/$Organizacao/$([Uri]::EscapeDataString($Projeto))/_apis"

# Funcoes de apoio
function Enviar($metodo, $url, $corpo, $tipo) {
    $bytes = [Text.Encoding]::UTF8.GetBytes($corpo)
    for ($tentativa = 1; $tentativa -le 8; $tentativa++) {
        try {
            return Invoke-RestMethod -Method $metodo -Uri $url -Headers $cabecalho -ContentType $tipo -Body $bytes -DisableKeepAlive -TimeoutSec 60
        } catch {
            $codigo = $null
            if ($_.Exception.Response) { $codigo = [int]$_.Exception.Response.StatusCode }
            if ($codigo -eq 401 -or $codigo -eq 403) { throw "Token recusado (HTTP $codigo). Confira o token e o escopo Work Items: Read & write." }
            if ($tentativa -eq 8) { throw }
            Write-Host "Falha de conexao, tentando de novo ($tentativa de 7)..." -ForegroundColor DarkYellow
            Start-Sleep -Seconds (3 * $tentativa)
        }
    }
}

function Buscar-Id($titulo) {
    $tituloWiql = $titulo.Replace("'", "''")
    $wiql = @{ query = "SELECT [System.Id] FROM WorkItems WHERE [System.TeamProject] = '$Projeto' AND [System.WorkItemType] = 'Test Case' AND [System.Title] = '$tituloWiql'" } | ConvertTo-Json
    $resposta = Enviar "Post" "$base/wit/wiql?api-version=7.1" $wiql "application/json; charset=utf-8"
    return @($resposta.workItems | ForEach-Object { $_.id })
}

function Montar-Parametros($parametros) {
    $nomes = @($parametros.PSObject.Properties.Name)
    if ($nomes.Count -eq 0) { return $null }
    $colunas = ($nomes | ForEach-Object { "<xs:element name=`"$_`" type=`"xs:string`" minOccurs=`"0`" />" }) -join ""
    $valores = ($nomes | ForEach-Object {
        $texto = ([string]$parametros.$_).Replace("&", "&amp;").Replace("<", "&lt;").Replace(">", "&gt;")
        "<$_>$texto</$_>"
    }) -join ""
    return "<NewDataSet><xs:schema id=`"NewDataSet`" xmlns:xs=`"http://www.w3.org/2001/XMLSchema`" xmlns:msdata=`"urn:schemas-microsoft-com:xml-msdata`"><xs:element name=`"NewDataSet`" msdata:IsDataSet=`"true`" msdata:Locale=`"`"><xs:complexType><xs:choice minOccurs=`"0`" maxOccurs=`"unbounded`"><xs:element name=`"Table1`"><xs:complexType><xs:sequence>$colunas</xs:sequence></xs:complexType></xs:element></xs:choice></xs:complexType></xs:element></xs:schema><Table1>$valores</Table1></NewDataSet>"
}

# Processamento
$casos = Get-Content -Raw -Encoding UTF8 $Arquivo | ConvertFrom-Json
if ($Somente) { $casos = @($casos | Where-Object { $_.titulo -eq $Somente }) }
$ok = 0; $erros = 0

foreach ($caso in $casos) {
    $tituloBusca = $caso.titulo
    if ($caso.tituloAtual) { $tituloBusca = $caso.tituloAtual }
    $ids = Buscar-Id $tituloBusca
    if ($ids.Count -eq 0 -and $tituloBusca -ne $caso.titulo) { $ids = Buscar-Id $caso.titulo }
    if ($ids.Count -ne 1) {
        Write-Host "PULADO ($($ids.Count) encontrados): $tituloBusca" -ForegroundColor Yellow
        $erros++
        continue
    }
    $id = $ids[0]
    $operacoes = @(@{ op = "add"; path = "/fields/System.Description"; value = $caso.descricaoHtml })
    $xml = Montar-Parametros $caso.parametros
    if ($xml) { $operacoes += @{ op = "add"; path = "/fields/Microsoft.VSTS.TCM.LocalDataSource"; value = $xml } }
    if ($caso.tituloAtual -and $caso.tituloAtual -ne $caso.titulo) { $operacoes += @{ op = "add"; path = "/fields/System.Title"; value = $caso.titulo } }
    if ($caso.passosXml) { $operacoes += @{ op = "add"; path = "/fields/Microsoft.VSTS.TCM.Steps"; value = $caso.passosXml } }
    if ($caso.parametrosXml) { $operacoes += @{ op = "add"; path = "/fields/Microsoft.VSTS.TCM.Parameters"; value = $caso.parametrosXml } }
    if ($caso.tags) { $operacoes += @{ op = "add"; path = "/fields/System.Tags"; value = $caso.tags } }

    if ($Simular) {
        Write-Host "SIMULADO #$id $($caso.titulo)" -ForegroundColor Cyan
        $ok++
        continue
    }
    try {
        $corpo = ConvertTo-Json -InputObject $operacoes -Depth 5
        Enviar "Patch" "$base/wit/workitems/$($id)?api-version=7.1" $corpo "application/json-patch+json; charset=utf-8" | Out-Null
        Write-Host "OK #$id $($caso.titulo)" -ForegroundColor Green
        $ok++
    } catch {
        Write-Host "ERRO #$id $($caso.titulo): $($_.Exception.Message)" -ForegroundColor Red
        $erros++
    }
}

Write-Host ""
Write-Host "Concluido: $ok atualizados, $erros com problema."
