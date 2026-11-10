# Feature epic.2 - Parameter values e Summary

## CT-2.1.1-01 · Validar registro de ocorrência com descrição e cultura válidas

Suíte: [Registrar ocorrência com foto] Produtor - Registrar ocorrência com descrição e cultura · Tags: funcional; positivo

| email | senha | propriedade | cultura | descricao |
| --- | --- | --- | --- | --- |
| produtor.teste01@valence.dev | Senha@2026 | Sítio Boa Vista | MILHO | Folhas avermelhadas e plantas com crescimento reduzido no talhão norte |

```
Identificador: CT-2.1.1-01
Objetivo: verificar o registro da ocorrência com propriedade, cultura e descrição válidas.
PBI e critério de aceite: [Registrar ocorrência com foto] Produtor - Registrar ocorrência com descrição e cultura; critério "registro com sucesso recebe HTTP 201 com o cabeçalho Location, id, status RECEBIDA e data de registro; o app segue para a tela de envio da foto".
Técnica: partição de equivalência, classe válida.
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista (CT-1.3.2-01, culturas MILHO e TOMATE); app Valence instalado; API Java online.
Ambiente: Android com o app Valence (Firebase App Distribution) e API Java no Azure App Service.
Inputs: propriedade do produtor, cultura cadastrada nela e descrição com mais de 10 caracteres. Valores em Parameter values.
Outputs esperados: HTTP 201, status RECEBIDA e tela de envio da foto.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: registro recusado com dados válidos, status diferente de RECEBIDA ou cultura de fora da propriedade listada.
Notas: esta ocorrência é usada nos casos de foto, triagem e laudo.
```

## CT-2.1.1-02 · Validar registro de ocorrência com descrição de 10 e de 1000 caracteres

Suíte: [Registrar ocorrência com foto] Produtor - Registrar ocorrência com descrição e cultura · Tags: funcional; positivo

| propriedade | cultura | desc10 |
| --- | --- | --- |
| Sítio Boa Vista | TOMATE | Folha seca |

```
Identificador: CT-2.1.1-02
Objetivo: verificar os limites válidos do tamanho da descrição.
PBI e critério de aceite: [Registrar ocorrência com foto] Produtor - Registrar ocorrência com descrição e cultura; critério "descrição de 10 a 1000 caracteres".
Técnica: análise de valor limite (limites válidos).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista; API Java online; Swagger autorizado com o token do produtor.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: descrição com 10 caracteres e descrição com 1000 caracteres. Valores em Parameter values.
Outputs esperados: HTTP 201 nos dois envios e descrições gravadas inteiras.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: limite válido recusado ou descrição cortada.
Notas: gerar o texto de 1000 caracteres num contador de caracteres; excluir as duas ocorrências ao final.
```

## CT-2.1.1-03 · Validar registro de ocorrência com descrição de 9 e de 1001 caracteres

Suíte: [Registrar ocorrência com foto] Produtor - Registrar ocorrência com descrição e cultura · Tags: funcional; negativo

| desc9 |
| --- |
| Folha amr |

```
Identificador: CT-2.1.1-03
Objetivo: verificar a recusa de descrição fora dos limites ou ausente.
PBI e critério de aceite: [Registrar ocorrência com foto] Produtor - Registrar ocorrência com descrição e cultura; critério "campo ausente ou fora do limite recebe HTTP 400 com a lista de campos e mensagens em português".
Técnica: análise de valor limite (logo fora dos limites) e partição de equivalência (campo ausente).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista; API Java online; Swagger autorizado com o token do produtor.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: descrição com 9 caracteres, com 1001 caracteres e sem descrição. Valores em Parameter values.
Outputs esperados: HTTP 400 nos três envios e nenhuma ocorrência criada.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: ocorrência criada com descrição fora do limite.
```

## CT-2.1.1-04 · Validar registro de ocorrência com cultura fora da propriedade

Suíte: [Registrar ocorrência com foto] Produtor - Registrar ocorrência com descrição e cultura · Tags: funcional; negativo

| propriedade | cultura |
| --- | --- |
| Sítio Boa Vista | BATATA |

```
Identificador: CT-2.1.1-04
Objetivo: verificar a regra de negócio que liga a cultura às culturas da propriedade.
PBI e critério de aceite: [Registrar ocorrência com foto] Produtor - Registrar ocorrência com descrição e cultura; critério "cultura que não está na propriedade recebe HTTP 422".
Técnica: tabela de decisão (cultura válida no sistema, mas ausente na propriedade).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista; API Java online; Swagger autorizado com o token do produtor.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: cultura BATATA numa propriedade que só tem MILHO e TOMATE. Valores em Parameter values.
Outputs esperados: HTTP 422 e nenhuma ocorrência criada.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: ocorrência criada com cultura que a propriedade não tem.
```

## CT-2.1.1-05 · Validar registro de ocorrência em propriedade de outro produtor

Suíte: [Registrar ocorrência com foto] Produtor - Registrar ocorrência com descrição e cultura · Tags: funcional; negativo

| outro | propriedade |
| --- | --- |
| produtor.teste04@valence.dev | Sítio Boa Vista |

```
Identificador: CT-2.1.1-05
Objetivo: verificar que um produtor não registra ocorrência em propriedade alheia.
PBI e critério de aceite: [Registrar ocorrência com foto] Produtor - Registrar ocorrência com descrição e cultura; critério "propriedade de outro produtor ou inexistente recebe HTTP 404".
Técnica: partição de equivalência por dono do dado (acesso cruzado).
Preparação: dois produtores cadastrados (CT-1.1.1-01 e CT-1.1.1-02); a propriedade Sítio Boa Vista pertence ao primeiro; Swagger.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: token do segundo produtor e propriedade do primeiro. Valores em Parameter values.
Outputs esperados: HTTP 404 e nenhuma ocorrência criada.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: ocorrência criada na propriedade de outro produtor.
```

## CT-2.1.1-06 · Validar que o agrônomo não registra ocorrência

Suíte: [Registrar ocorrência com foto] Produtor - Registrar ocorrência com descrição e cultura · Tags: funcional; negativo

| agronomo |
| --- |
| agronomo do README |

```
Identificador: CT-2.1.1-06
Objetivo: verificar que somente o papel PRODUTOR registra ocorrências.
PBI e critério de aceite: [Registrar ocorrência com foto] Produtor - Registrar ocorrência com descrição e cultura; critério "somente o papel PRODUTOR registra ocorrências; AGRONOMO e GESTOR recebem HTTP 403".
Técnica: teste de permissão por papel.
Preparação: API Java online; credenciais do agrônomo de seed no README.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: token de AGRONOMO e corpo válido de ocorrência. Valores em Parameter values.
Outputs esperados: HTTP 403 e nenhuma ocorrência criada.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: ocorrência criada pelo agrônomo.
```

## CT-2.1.2-01 · Validar envio de foto da lavoura com triagem na mesma requisição

Suíte: [Registrar ocorrência com foto] Produtor - Enviar foto da lavoura · Tags: funcional; positivo

| foto |
| --- |
| milho-folha-ferrugem.jpg (JPEG, cerca de 2 MB) |

```
Identificador: CT-2.1.2-01
Objetivo: verificar o envio da foto e a triagem feita na mesma requisição.
PBI e critério de aceite: [Registrar ocorrência com foto] Produtor - Enviar foto da lavoura; critério "envio com sucesso recebe HTTP 201 com a ocorrência atualizada, já com a triagem feita na mesma requisição".
Técnica: partição de equivalência, classe válida (JPEG dentro do limite).
Preparação: ocorrência do caso CT-2.1.1-01 em RECEBIDA; foto de folha de milho em JPEG com menos de 8 MB no aparelho; API Java e serviço de IA online.
Ambiente: Android com o app Valence (Firebase App Distribution) e API Java no Azure App Service.
Inputs: foto JPEG de folha de milho com menos de 8 MB. Valores em Parameter values.
Outputs esperados: HTTP 201, triagem gravada e foto visível no detalhe.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: foto válida recusada, triagem ausente ou app travado além de 60 segundos.
```

## CT-2.1.2-02 · Validar envio de foto acima de 8 MB

Suíte: [Registrar ocorrência com foto] Produtor - Enviar foto da lavoura · Tags: funcional; negativo

| foto |
| --- |
| foto-grande.jpg (JPEG com 9 MB) |

```
Identificador: CT-2.1.2-02
Objetivo: verificar o limite de tamanho da foto.
PBI e critério de aceite: [Registrar ocorrência com foto] Produtor - Enviar foto da lavoura; critério "foto acima de 8 MB recebe HTTP 413".
Técnica: análise de valor limite (acima de 8 MB).
Preparação: ocorrência do produtor em RECEBIDA; arquivo JPEG de 9 MB; app e API online.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: JPEG com 9 MB. Valores em Parameter values.
Outputs esperados: HTTP 413 e nenhuma foto anexada.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: foto acima de 8 MB aceita ou erro 500.
```

## CT-2.1.2-03 · Validar envio de arquivo que não é imagem

Suíte: [Registrar ocorrência com foto] Produtor - Enviar foto da lavoura · Tags: funcional; negativo

| arquivo |
| --- |
| relatorio.pdf |

```
Identificador: CT-2.1.2-03
Objetivo: verificar que o formato é conferido pelo conteúdo do arquivo, e não pela extensão.
PBI e critério de aceite: [Registrar ocorrência com foto] Produtor - Enviar foto da lavoura; critério "foto em JPEG, PNG ou WebP conferido pelo conteúdo do arquivo; arquivo em outro formato recebe HTTP 415".
Técnica: partição de equivalência, classe inválida (conteúdo fora do formato).
Preparação: ocorrência do produtor em RECEBIDA; um arquivo PDF qualquer; API online; Swagger.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: PDF renomeado com extensão .jpg. Valores em Parameter values.
Outputs esperados: HTTP 415 e nenhuma foto anexada.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: arquivo aceito só pela extensão.
```

## CT-2.1.2-04 · Validar limite de 5 fotos por ocorrência

Suíte: [Registrar ocorrência com foto] Produtor - Enviar foto da lavoura · Tags: funcional; negativo

| foto |
| --- |
| sexta-foto.jpg (JPEG, 1 MB) |

```
Identificador: CT-2.1.2-04
Objetivo: verificar o limite de fotos por ocorrência.
PBI e critério de aceite: [Registrar ocorrência com foto] Produtor - Enviar foto da lavoura; critério "cada ocorrência aceita no máximo 5 fotos".
Técnica: análise de valor limite (5 aceitas, 6 recusada).
Preparação: ocorrência do produtor em RECEBIDA ou TRIADA; 6 fotos JPEG de até 1 MB; API online; Swagger.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: seis fotos válidas enviadas em sequência. Valores em Parameter values.
Outputs esperados: 5 fotos aceitas e a sexta recusada.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: sexta foto aceita.
```

## CT-2.1.2-05 · Validar acesso de outro produtor à foto da ocorrência

Suíte: [Registrar ocorrência com foto] Produtor - Enviar foto da lavoura · Tags: funcional; negativo

| outro |
| --- |
| produtor.teste04@valence.dev |

```
Identificador: CT-2.1.2-05
Objetivo: verificar a proteção das fotos contra acesso de outro produtor.
PBI e critério de aceite: [Registrar ocorrência com foto] Produtor - Enviar foto da lavoura; critério "a foto só é exibida ao dono, AGRONOMO e GESTOR; outro produtor recebe HTTP 403".
Técnica: tabela de decisão por papel e dono (dono, outro produtor e agrônomo).
Preparação: ocorrência do caso CT-2.1.2-01 com foto; segundo produtor do CT-1.1.1-02; agrônomo de seed; Swagger.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: tokens do segundo produtor e do agrônomo. Valores em Parameter values.
Outputs esperados: HTTP 403 para o outro produtor e HTTP 200 para o agrônomo.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: foto exibida a outro produtor ou negada ao agrônomo.
```

## CT-2.1.2-06 · Validar triagem pelo texto de ocorrência sem foto

Suíte: [Registrar ocorrência com foto] Produtor - Enviar foto da lavoura · Tags: funcional; positivo

| descricao |
| --- |
| Manchas marrons com halo amarelo nas folhas de baixo do tomateiro |

```
Identificador: CT-2.1.2-06
Objetivo: verificar a triagem automática de ocorrência sem foto.
PBI e critério de aceite: [Registrar ocorrência com foto] Produtor - Enviar foto da lavoura; critério "ocorrência sem foto continua RECEBIDA e é triada só pelo texto depois de 10 minutos".
Técnica: transição de estado com tempo (RECEBIDA para TRIADA ou EM_ANALISE).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista (CT-1.3.2-01, culturas MILHO e TOMATE); app Valence instalado; API Java online. Agendador de triagem habilitado (VALENCE_TRIAGEM_AGENDADOR_HABILITADO diferente de false).
Ambiente: Android com o app Valence (Firebase App Distribution) e API Java no Azure App Service.
Inputs: ocorrência válida sem foto. Valores em Parameter values.
Outputs esperados: triagem gerada pelo texto após 10 minutos.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: ocorrência presa em RECEBIDA depois de 10 minutos.
```

## CT-2.1.3-01 · Validar lista de ocorrências do produtor com filtro por status

Suíte: [Registrar ocorrência com foto] Produtor - Acompanhar minhas ocorrências por status · Tags: funcional; positivo

| email | senha | status |
| --- | --- | --- |
| produtor.teste01@valence.dev | Senha@2026 | RECEBIDA |

```
Identificador: CT-2.1.3-01
Objetivo: verificar a lista paginada, a ordem e o filtro por status.
PBI e critério de aceite: [Registrar ocorrência com foto] Produtor - Acompanhar minhas ocorrências por status; critério "lista paginada (10 por página) da mais recente para a mais antiga, com filtro por status".
Técnica: partição de equivalência por status.
Preparação: produtor com pelo menos 2 ocorrências em status diferentes; app e API online.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: filtros por status RECEBIDA e DESCARTADA. Valores em Parameter values.
Outputs esperados: lista ordenada, filtro correto e mensagem de lista vazia.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: ordem errada, filtro sem efeito ou ocorrência de outro produtor na lista.
```

## CT-2.1.3-02 · Validar detalhe da ocorrência para dono e agrônomo

Suíte: [Registrar ocorrência com foto] Produtor - Acompanhar minhas ocorrências por status · Tags: funcional; positivo

| email | senha |
| --- | --- |
| produtor.teste01@valence.dev | Senha@2026 |

```
Identificador: CT-2.1.3-02
Objetivo: verificar o conteúdo do detalhe e o acesso de dono, agrônomo e gestor.
PBI e critério de aceite: [Registrar ocorrência com foto] Produtor - Acompanhar minhas ocorrências por status; critério "detalhe acessível ao dono, AGRONOMO e GESTOR, com fotos, triagem e laudo quando existirem".
Técnica: tabela de decisão por papel (dono, agrônomo e gestor).
Preparação: ocorrência do caso CT-2.1.2-01 com foto e triagem; usuários de seed; app e API online.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: a mesma ocorrência consultada por três papéis. Valores em Parameter values.
Outputs esperados: detalhe completo para os três.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: campo da triagem ausente ou acesso negado a agrônomo ou gestor.
```

## CT-2.1.3-03 · Validar acesso ao detalhe de ocorrência de outro produtor

Suíte: [Registrar ocorrência com foto] Produtor - Acompanhar minhas ocorrências por status · Tags: funcional; negativo

| outro |
| --- |
| produtor.teste04@valence.dev |

```
Identificador: CT-2.1.3-03
Objetivo: verificar o isolamento das ocorrências entre produtores.
PBI e critério de aceite: [Registrar ocorrência com foto] Produtor - Acompanhar minhas ocorrências por status; critério "ocorrência de outro produtor ou inexistente recebe HTTP 404".
Técnica: partição de equivalência por dono do dado e id inexistente.
Preparação: ocorrência do caso CT-2.1.1-01; segundo produtor do CT-1.1.1-02; Swagger.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: token do segundo produtor, id de ocorrência alheia e id inexistente. Valores em Parameter values.
Outputs esperados: HTTP 404 nos dois casos.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: dados da ocorrência de outro produtor exibidos.
```

## CT-2.1.3-04 · Validar ordenação da lista por campo inexistente

Suíte: [Registrar ocorrência com foto] Produtor - Acompanhar minhas ocorrências por status · Tags: funcional; negativo

| campo |
| --- |
| campoInexistente |

```
Identificador: CT-2.1.3-04
Objetivo: verificar a validação do parâmetro de ordenação.
PBI e critério de aceite: [Registrar ocorrência com foto] Produtor - Acompanhar minhas ocorrências por status; critério "ordenação por campo inexistente recebe HTTP 400".
Técnica: partição de equivalência, classe inválida (campo de ordenação).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista; API Java online; Swagger autorizado com o token do produtor.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: sort com campo inexistente e sort com dataRegistro. Valores em Parameter values.
Outputs esperados: HTTP 400 para o campo inexistente e HTTP 200 para o válido.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: erro 500 ou ordenação ignorada sem aviso.
```

## CT-2.2.1-01 · Validar registro de ocorrência sem conexão na fila local

Suíte: [Envio offline] Produtor - Guardar ocorrência sem conexão · Tags: funcional; positivo

| email | senha | cultura | descricao |
| --- | --- | --- | --- |
| produtor.teste01@valence.dev | Senha@2026 | MILHO | Lagartas nas espigas do talhão sul, registro feito sem sinal |

```
Identificador: CT-2.2.1-01
Objetivo: verificar que o produtor registra ocorrência sem internet.
PBI e critério de aceite: [Envio offline] Produtor - Guardar ocorrência sem conexão; critério "sem conexão, a ocorrência vai para uma fila local com Idempotency-Key UUID e aparece como "Aguardando envio"".
Técnica: partição de equivalência por estado da rede (sem conexão) e transição de estado.
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista (MILHO e TOMATE); app Valence instalado; API Java online. Aparelho com modo avião disponível.
Ambiente: Android com o app Valence (Firebase App Distribution) e API Java no Azure App Service.
Inputs: ocorrência válida com foto, registrada em modo avião. Valores em Parameter values.
Outputs esperados: aviso de sem conexão e ocorrência na lista com "Aguardando envio".
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: formulário bloqueado sem conexão, ocorrência perdida ou sem a indicação de pendente.
```

## CT-2.2.1-02 · Validar que a fila local sobrevive ao fechamento do app

Suíte: [Envio offline] Produtor - Guardar ocorrência sem conexão · Tags: funcional; positivo

| email | senha |
| --- | --- |
| produtor.teste01@valence.dev | Senha@2026 |

```
Identificador: CT-2.2.1-02
Objetivo: verificar que a fila local não se perde ao fechar o app.
PBI e critério de aceite: [Envio offline] Produtor - Guardar ocorrência sem conexão; critério "a fila local guarda a foto junto da ocorrência e sobrevive ao fechamento do app".
Técnica: transição de estado (app fechado e reaberto sem conexão).
Preparação: caso CT-2.2.1-01 executado, com a ocorrência ainda pendente e o modo avião ligado.
Ambiente: Android com o app Valence (Firebase App Distribution) e API Java no Azure App Service.
Inputs: app fechado e reaberto sem conexão. Valores em Parameter values.
Outputs esperados: ocorrência pendente com a foto preservada.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: ocorrência ou foto perdidas após fechar o app.
```

## CT-2.2.1-03 · Validar que a ocorrência pendente não existe na API antes do envio

Suíte: [Envio offline] Produtor - Guardar ocorrência sem conexão · Tags: funcional; positivo

| email |
| --- |
| produtor.teste01@valence.dev |

```
Identificador: CT-2.2.1-03
Objetivo: verificar que a fila local é temporária e o dado só existe depois de gravado pela API.
PBI e critério de aceite: [Envio offline] Produtor - Guardar ocorrência sem conexão; critério "a fila local é temporária: a ocorrência só passa a existir no sistema depois de gravada pela API".
Técnica: partição de equivalência (dado pendente no aparelho e dado gravado no servidor).
Preparação: caso CT-2.2.1-01 executado, com a ocorrência ainda pendente; Swagger acessível num computador.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: consulta à API enquanto a ocorrência está pendente. Valores em Parameter values.
Outputs esperados: ocorrência ausente da API até a sincronização.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: ocorrência na API antes do envio ou duplicada depois.
```

## CT-2.2.2-01 · Validar reenvio automático da fila ao reconectar

Suíte: [Envio offline] Produtor - Reenviar ao reconectar sem duplicar · Tags: funcional; positivo

| primeira | segunda |
| --- | --- |
| ocorrência A do talhão norte | ocorrência B do talhão sul |

```
Identificador: CT-2.2.2-01
Objetivo: verificar o reenvio automático, a ordem e a remoção da fila local.
PBI e critério de aceite: [Envio offline] Produtor - Reenviar ao reconectar sem duplicar; critério "ao reconectar, o app reenvia cada ocorrência da fila na ordem em que foi criada; envio com sucesso remove a ocorrência da fila local".
Técnica: transição de estado (sem conexão para conectado).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista (MILHO e TOMATE); app Valence instalado; API Java online.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: duas ocorrências registradas em modo avião. Valores em Parameter values.
Outputs esperados: as duas gravadas na API, na ordem de criação, sem duplicar e fora da fila local.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: ocorrência perdida, duplicada, fora de ordem ou ainda marcada como pendente.
```

## CT-2.2.2-02 · Validar reenvio com a mesma Idempotency-Key e o mesmo corpo

Suíte: [Envio offline] Produtor - Reenviar ao reconectar sem duplicar · Tags: funcional; positivo

| chave |
| --- |
| 3f6c1e2a-8b4d-4e9a-9c1f-2d7e5a6b8c90 |

```
Identificador: CT-2.2.2-02
Objetivo: verificar a idempotência do registro de ocorrência.
PBI e critério de aceite: [Envio offline] Produtor - Reenviar ao reconectar sem duplicar; critério "reenvio com a mesma Idempotency-Key e o mesmo corpo recebe HTTP 200 com a ocorrência original e Idempotency-Replayed: true, sem criar outra".
Técnica: partição de equivalência (chave repetida com corpo igual).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista; API Java online; Swagger autorizado com o token do produtor. A chave do parâmetro @chave nunca usada por este produtor.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: o mesmo corpo enviado duas vezes com a mesma chave. Valores em Parameter values.
Outputs esperados: HTTP 201 e depois HTTP 200 com o mesmo id e Idempotency-Replayed: true.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: segunda ocorrência criada ou cabeçalho ausente.
```

## CT-2.2.2-03 · Validar mesma Idempotency-Key com corpo diferente

Suíte: [Envio offline] Produtor - Reenviar ao reconectar sem duplicar · Tags: funcional; negativo

| chave |
| --- |
| 3f6c1e2a-8b4d-4e9a-9c1f-2d7e5a6b8c90 |

```
Identificador: CT-2.2.2-03
Objetivo: verificar o conflito de chave reutilizada com outro conteúdo.
PBI e critério de aceite: [Envio offline] Produtor - Reenviar ao reconectar sem duplicar; critério "mesma Idempotency-Key com corpo diferente recebe HTTP 409".
Técnica: partição de equivalência, classe inválida (chave repetida com corpo diferente).
Preparação: caso CT-2.2.2-02 executado com a chave do parâmetro; Swagger autorizado com o mesmo produtor.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: chave já usada e corpo diferente. Valores em Parameter values.
Outputs esperados: HTTP 409 e nenhuma ocorrência nova.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: ocorrência criada ou original sobrescrita.
```

## CT-2.2.2-04 · Validar Idempotency-Key fora do formato UUID

Suíte: [Envio offline] Produtor - Reenviar ao reconectar sem duplicar · Tags: funcional; negativo

| chave |
| --- |
| chave-123 |

```
Identificador: CT-2.2.2-04
Objetivo: verificar a validação do formato da chave de idempotência.
PBI e critério de aceite: [Envio offline] Produtor - Reenviar ao reconectar sem duplicar; critério "Idempotency-Key fora do formato UUID recebe HTTP 400 indicando o campo Idempotency-Key".
Técnica: partição de equivalência, classe inválida (formato da chave).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista; API Java online; Swagger autorizado com o token do produtor.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: chave chave-123. Valores em Parameter values.
Outputs esperados: HTTP 400 com o campo Idempotency-Key.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: ocorrência criada com chave inválida.
```

## CT-2.2.2-05 · Validar a mesma Idempotency-Key usada por outro produtor

Suíte: [Envio offline] Produtor - Reenviar ao reconectar sem duplicar · Tags: funcional; positivo

| outro | chave |
| --- | --- |
| produtor.teste04@valence.dev | 3f6c1e2a-8b4d-4e9a-9c1f-2d7e5a6b8c90 |

```
Identificador: CT-2.2.2-05
Objetivo: verificar que a chave é única por usuário.
PBI e critério de aceite: [Envio offline] Produtor - Reenviar ao reconectar sem duplicar; critério "a chave é única por usuário: a mesma chave usada por outro usuário não entra em conflito".
Técnica: partição de equivalência por usuário dono da chave.
Preparação: caso CT-2.2.2-02 executado; segundo produtor (CT-1.1.1-02) com uma propriedade cadastrada; Swagger.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: mesma chave usada por outro produtor. Valores em Parameter values.
Outputs esperados: HTTP 201 com ocorrência nova; original preservada.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 409 ou devolução da ocorrência de outro produtor.
```

## CT-2.2.2-06 · Validar que envio com falha mantém a ocorrência na fila

Suíte: [Envio offline] Produtor - Reenviar ao reconectar sem duplicar · Tags: funcional; negativo

| descricao |
| --- |
| Teste de falha de envio com rede sem internet |

```
Identificador: CT-2.2.2-06
Objetivo: verificar que uma falha de envio não apaga a ocorrência da fila.
PBI e critério de aceite: [Envio offline] Produtor - Reenviar ao reconectar sem duplicar; critério "envio com falha mantém a ocorrência na fila para nova tentativa na próxima conexão".
Técnica: partição de equivalência por estado da rede (conectado sem internet).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista (MILHO e TOMATE); app Valence instalado; API Java online. Uma rede Wi-Fi sem internet, como o roteador do celular sem dados móveis.
Ambiente: Android com o app Valence (Firebase App Distribution) e API Java no Azure App Service.
Inputs: envio tentado numa rede sem internet. Valores em Parameter values.
Outputs esperados: ocorrência mantida na fila e enviada quando a internet volta.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: ocorrência removida da fila sem ter sido gravada na API.
```

## CT-2.3.1-01 · Validar edição de ocorrência em RECEBIDA

Suíte: [Editar e excluir ocorrência] Produtor - Editar ocorrência antes da análise · Tags: funcional; positivo

| email | senha | cultura | descricao |
| --- | --- | --- | --- |
| produtor.teste01@valence.dev | Senha@2026 | TOMATE | Correção: o dano é no tomateiro, com folhas enroladas |

```
Identificador: CT-2.3.1-01
Objetivo: verificar a edição de descrição e cultura antes da análise.
PBI e critério de aceite: [Editar e excluir ocorrência] Produtor - Editar ocorrência antes da análise; critério "edição com sucesso recebe HTTP 200 com os dados atualizados e a data de atualização".
Técnica: partição de equivalência, classe válida (status RECEBIDA).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista (MILHO e TOMATE); app Valence instalado; API Java online. Uma ocorrência do produtor em RECEBIDA (registrada sem foto há menos de 10 minutos).
Ambiente: Android com o app Valence (Firebase App Distribution) e API Java no Azure App Service.
Inputs: nova cultura cadastrada na propriedade e nova descrição. Valores em Parameter values.
Outputs esperados: HTTP 200 e dados atualizados.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: alteração não gravada ou data de atualização sem mudança.
```

## CT-2.3.1-02 · Validar edição de ocorrência já em análise

Suíte: [Editar e excluir ocorrência] Produtor - Editar ocorrência antes da análise · Tags: funcional; negativo

| email | senha | status |
| --- | --- | --- |
| produtor.teste01@valence.dev | Senha@2026 | EM_ANALISE |

```
Identificador: CT-2.3.1-02
Objetivo: verificar o bloqueio da edição depois que a ocorrência entra em análise.
PBI e critério de aceite: [Editar e excluir ocorrência] Produtor - Editar ocorrência antes da análise; critério "ocorrência com status EM_ANALISE, CONFIRMADA ou DESCARTADA recebe HTTP 422 com a mensagem definida".
Técnica: tabela de decisão por status (RECEBIDA e TRIADA permitem; EM_ANALISE, CONFIRMADA e DESCARTADA bloqueiam).
Preparação: ocorrência do produtor em EM_ANALISE (por exemplo, com foto recusada); app e API online.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: edição de ocorrência em EM_ANALISE. Valores em Parameter values.
Outputs esperados: botão ausente no app e HTTP 422 na API.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: ocorrência em análise alterada.
```

## CT-2.3.1-03 · Validar edição de ocorrência com cultura fora da propriedade

Suíte: [Editar e excluir ocorrência] Produtor - Editar ocorrência antes da análise · Tags: funcional; negativo

| cultura |
| --- |
| BATATA |

```
Identificador: CT-2.3.1-03
Objetivo: verificar a regra da cultura também na edição.
PBI e critério de aceite: [Editar e excluir ocorrência] Produtor - Editar ocorrência antes da análise; critério "edição permite alterar a cultura, desde que ela esteja cadastrada na propriedade".
Técnica: tabela de decisão (cultura válida no sistema, mas ausente na propriedade).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista; API Java online; Swagger autorizado com o token do produtor. Uma ocorrência do produtor em RECEBIDA.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: cultura BATATA numa propriedade com MILHO e TOMATE. Valores em Parameter values.
Outputs esperados: HTTP 422 e cultura inalterada.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: cultura de fora da propriedade gravada.
```

## CT-2.3.1-04 · Validar edição de ocorrência por outro produtor e pelo agrônomo

Suíte: [Editar e excluir ocorrência] Produtor - Editar ocorrência antes da análise · Tags: funcional; negativo

| outro |
| --- |
| produtor.teste04@valence.dev |

```
Identificador: CT-2.3.1-04
Objetivo: verificar que só o dono edita a ocorrência.
PBI e critério de aceite: [Editar e excluir ocorrência] Produtor - Editar ocorrência antes da análise; critério "ocorrência de outro produtor recebe HTTP 404; AGRONOMO e GESTOR recebem HTTP 403".
Técnica: tabela de decisão por papel e dono.
Preparação: ocorrência do primeiro produtor em RECEBIDA; segundo produtor e agrônomo de seed; Swagger.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: PUT feito por outro produtor e pelo agrônomo. Valores em Parameter values.
Outputs esperados: HTTP 404 e HTTP 403; ocorrência inalterada.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: ocorrência alterada por quem não é dono.
```

## CT-2.3.1-05 · Validar edições simultâneas da mesma ocorrência

Suíte: [Editar e excluir ocorrência] Produtor - Editar ocorrência antes da análise · Tags: funcional; negativo

| email | descricao1 | descricao2 |
| --- | --- | --- |
| produtor.teste01@valence.dev | Descrição gravada pela aba 1 | Descrição tardia da aba 2 |

```
Identificador: CT-2.3.1-05
Objetivo: verificar o controle de concorrência na edição.
PBI e critério de aceite: [Editar e excluir ocorrência] Produtor - Editar ocorrência antes da análise; critério "duas edições simultâneas da mesma ocorrência: a primeira é gravada e a segunda recebe HTTP 409".
Técnica: transição de estado com concorrência (versão desatualizada).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista; API Java online; Swagger autorizado com o token do produtor. Uma ocorrência do produtor em RECEBIDA.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: duas edições a partir da mesma versão. Valores em Parameter values.
Outputs esperados: HTTP 200 na primeira, HTTP 409 na segunda e a primeira preservada.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: segunda edição sobrescrevendo a primeira.
```

## CT-2.3.2-01 · Validar exclusão de ocorrência em RECEBIDA

Suíte: [Editar e excluir ocorrência] Produtor - Excluir ocorrência antes da análise · Tags: funcional; positivo

| email | senha |
| --- | --- |
| produtor.teste01@valence.dev | Senha@2026 |

```
Identificador: CT-2.3.2-01
Objetivo: verificar a exclusão de ocorrência antes da análise.
PBI e critério de aceite: [Editar e excluir ocorrência] Produtor - Excluir ocorrência antes da análise; critério "exclusão com sucesso recebe HTTP 204; a ocorrência, as fotos e a triagem somem da lista do produtor".
Técnica: partição de equivalência, classe válida (status RECEBIDA).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista (MILHO e TOMATE); app Valence instalado; API Java online. Uma ocorrência do produtor em RECEBIDA.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: exclusão confirmada de ocorrência em RECEBIDA. Valores em Parameter values.
Outputs esperados: confirmação exibida, HTTP 204 e ocorrência inexistente depois.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: exclusão sem confirmação ou ocorrência ainda acessível.
```

## CT-2.3.2-02 · Validar exclusão de ocorrência confirmada pelo agrônomo

Suíte: [Editar e excluir ocorrência] Produtor - Excluir ocorrência antes da análise · Tags: funcional; negativo

| email | senha | status |
| --- | --- | --- |
| produtor.teste01@valence.dev | Senha@2026 | CONFIRMADA |

```
Identificador: CT-2.3.2-02
Objetivo: verificar que casos já decididos não podem ser excluídos.
PBI e critério de aceite: [Editar e excluir ocorrência] Produtor - Excluir ocorrência antes da análise; critério "exclusão permitida somente com status RECEBIDA ou TRIADA; outros status recebem HTTP 422".
Técnica: tabela de decisão por status.
Preparação: ocorrência do produtor com laudo CONFIRMADA (caso CT-5.2.1-01); app e API online.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: exclusão de ocorrência CONFIRMADA. Valores em Parameter values.
Outputs esperados: botão ausente e HTTP 422; ocorrência preservada.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: caso confirmado excluído.
```

## CT-2.3.2-03 · Validar exclusão de ocorrência por outro produtor e pelo gestor

Suíte: [Editar e excluir ocorrência] Produtor - Excluir ocorrência antes da análise · Tags: funcional; negativo

| outro |
| --- |
| produtor.teste04@valence.dev |

```
Identificador: CT-2.3.2-03
Objetivo: verificar que só o dono exclui a ocorrência.
PBI e critério de aceite: [Editar e excluir ocorrência] Produtor - Excluir ocorrência antes da análise; critério "ocorrência de outro produtor recebe HTTP 404; AGRONOMO e GESTOR recebem HTTP 403".
Técnica: tabela de decisão por papel e dono.
Preparação: ocorrência do primeiro produtor em RECEBIDA; segundo produtor e gestor de seed; Swagger.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: DELETE feito por outro produtor e pelo gestor. Valores em Parameter values.
Outputs esperados: HTTP 404 e HTTP 403; ocorrência preservada.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: ocorrência excluída por quem não é dono.
```

## CT-2.3.2-04 · Validar encerramento dos alertas ao excluir ocorrência triada

Suíte: [Editar e excluir ocorrência] Produtor - Excluir ocorrência antes da análise · Tags: funcional; positivo

| email | vizinho |
| --- | --- |
| produtor.teste01@valence.dev | produtor.teste04@valence.dev |

```
Identificador: CT-2.3.2-04
Objetivo: verificar que a exclusão encerra os alertas de suspeita gerados pela ocorrência.
PBI e critério de aceite: [Editar e excluir ocorrência] Produtor - Excluir ocorrência antes da análise; critério "alertas de nível SUSPEITA gerados pela ocorrência excluída passam a ENCERRADO".
Técnica: transição de estado do alerta (SUSPEITA para ENCERRADO).
Preparação: vizinho (CT-1.1.1-02) com propriedade de MILHO a menos de 10 km do Sítio Boa Vista; ocorrência de MILHO do primeiro produtor em TRIADA com alerta SUSPEITA para o vizinho.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: exclusão de ocorrência TRIADA com alerta. Valores em Parameter values.
Outputs esperados: alerta do vizinho em ENCERRADO.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: alerta de suspeita mantido para caso excluído.
```

