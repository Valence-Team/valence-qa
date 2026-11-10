# Valence QA

Plano de projeto Scrum e plano de testes do **Valence**, rede pública e colaborativa de vigilância fitossanitária para pequenos produtores de milho, tomate e batata. Global Solution FIAP 2026/2, tema CitizenTech, disciplina Compliance, Quality Assurance & Tests.

## Equipe

| Nome | RM |
| --- | --- |
| Henrique Martins | 563620 |
| Guilherme Macedo | 562396 |
| Pedro Henrique | 563405 |

## Azure DevOps

- Organização: `valence-gs2026`
- Projeto: [Valence-QA](https://dev.azure.com/valence-gs2026/Valence-QA), processo Scrum
- Backlog: 7 Epics, 17 Features e 45 Product Backlog Items, na Release GS 2026-2 (Sprints 1, 2 e 3)
- Test Plans: um plano por Sprint, uma suíte por Feature e uma suíte por PBI (requirement-based)
- Test Cases: 250 casos funcionais de caixa-preta, positivos e negativos, com Summary (ISO 29119-3), Steps e Parameter values

## Estrutura

```
scripts/
  preencher-test-cases.ps1   Preenche Summary, Parameter values e, quando houver, título, passos e tags
  prints-test-cases.py       Captura as telas de Summary e Steps de cada Test Case
test-cases/
  epic-1 ... epic-7/         CSVs de importação, JSON do Summary e conferência em Markdown
```

| Epic | Casos |
| --- | --- |
| 1 Acesso e cadastro | 38 |
| 2 Registro de ocorrências | 34 |
| 3 Triagem inteligente | 26 |
| 4 Alertas fitossanitários | 24 |
| 5 Validação agronômica | 29 |
| 6 Mural da região | 45 |
| 7 Observatório público | 54 |

## Como usar

### 1. Importar os Test Cases

No Azure Test Plans, abrir a suíte do PBI, escolher **Import test cases from CSV** e selecionar o `importar-pbi-X-Y-Z.csv` correspondente. Cada CSV entra uma única vez na sua suíte, o que cria o link **Tests** com o PBI.

O import por CSV não preenche a Description nem os Parameter values, por isso o passo 2.

### 2. Preencher Summary e Parameter values

```
powershell -ExecutionPolicy Bypass -File .\scripts\preencher-test-cases.ps1 -Arquivo .\test-cases\epic-1\casos-feature-1-1.json -Simular
powershell -ExecutionPolicy Bypass -File .\scripts\preencher-test-cases.ps1 -Arquivo .\test-cases\epic-1\casos-feature-1-1.json
```

O script pede um Personal Access Token com escopo **Work Items: Read & write**. O token é digitado no terminal e não fica gravado em arquivo. O caso é localizado pelo título exato; com `-Simular` nada é alterado.

### 3. Capturar as telas

```
python -m pip install playwright
python .\scripts\prints-test-cases.py --de 139 --ate 395
```

O script usa o Microsoft Edge instalado, pede o login uma única vez e salva `15-tc-<código>-summary.png` e `15-tc-<código>-steps.png` na pasta `prints-tc/`. A sessão do navegador fica em `perfil-edge/`, fora do Git.

## Decisões principais

- **Processo Scrum e padrões da aula:** título do PBI em "[Feature] Contexto - Ação", descrição "Como ..., eu quero ... para que eu ...", critérios de aceite em tópicos verificáveis, Effort por Planning Poker, título do Test Case começando com "Validar" e tags `funcional` e `positivo` ou `negativo`.
- **Uma suíte por PBI:** a suíte requirement-based liga cada Test Case ao PBI pelo link Tests, o que mostra a cobertura por Feature no Boards e nos relatórios.
- **Técnicas de caixa-preta:** partição de equivalência, análise de valor limite, tabela de decisão por papel e transição de estado. Cada item do Acceptance Criteria tem pelo menos um caso.
- **Parameter values sem aspas duplas:** o grid do Azure exibe aspas como `&quot;`.
- **Massa de teste fictícia:** e-mails `@valence.dev`, telefones e documentos inventados; nenhum dado pessoal real.

## Uso de IA generativa

O Claude (Anthropic) foi usado como apoio na produção deste material:

- **Revisão dos critérios de aceite:** a partir dos contratos e atualizações do projeto, a IA apontou regras sem valor verificável. Os critérios finais foram escritos e conferidos por Pedro no Azure DevOps.
- **Geração dos Test Cases:** a IA gerou os CSVs, os JSON de Summary e os Markdown de conferência a partir do Acceptance Criteria de cada PBI. Cada Epic foi comparado item a item com os critérios e corrigido quando havia diferença (por exemplo, o Epic 3 ganhou 4 casos e teve 3 reescritos).
- **Scripts:** a IA escreveu o `preencher-test-cases.ps1`, que usa a API REST do Azure DevOps, e o `prints-test-cases.py`, que usa o Playwright. Os dois foram testados primeiro em modo de simulação ou em 2 casos antes do uso completo.

Responsabilidade humana: estrutura do backlog, decisões de escopo, aprovação de cada critério e de cada lote de casos, criação dos planos e suítes, importação, execução dos testes e análise dos resultados.
