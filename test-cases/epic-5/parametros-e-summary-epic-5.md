# Feature epic.5 - Parameter values e Summary

## CT-5.1.1-01 · Validar fila de análise ordenada por severidade e data

Suíte: [Fila de análise] Agrônomo - Ver fila de casos por severidade · Tags: funcional; positivo

| agronomo | severidade |
| --- | --- |
| agrônomo do README | 3 |

```
Identificador: CT-5.1.1-01
Objetivo: verificar a ordem e os dados da fila de análise.
PBI e critério de aceite: [Fila de análise] Agrônomo - Ver fila de casos por severidade; critério "ordem da maior para a menor severidade; em caso de empate, a mais antiga primeiro; cada item mostra cultura, severidade, praga provável, status, propriedade, município, UF e data de registro".
Técnica: partição de equivalência e tabela de decisão (severidade e data de registro).
Preparação: produtor.teste01@valence.dev com o Sítio Boa Vista (Ribeirão Preto/SP); agrônomo e gestor de seed do README; Swagger autorizado com o token indicado em cada passo. Pelo menos 3 ocorrências na fila: uma de severidade 4 e duas de severidade 3, registradas em horários diferentes.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: fila com severidades diferentes e um empate. Valores em Parameter values.
Outputs esperados: fila ordenada por severidade e, no empate, pela data mais antiga.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: ordem errada ou campo ausente no item.
```

## CT-5.1.1-02 · Validar filtro por status e paginação da fila

Suíte: [Fila de análise] Agrônomo - Ver fila de casos por severidade · Tags: funcional; positivo

| status1 | status2 |
| --- | --- |
| TRIADA | EM_ANALISE |

```
Identificador: CT-5.1.1-02
Objetivo: verificar o filtro de status e a paginação.
PBI e critério de aceite: [Fila de análise] Agrônomo - Ver fila de casos por severidade; critério "fila paginada (10 por página), com filtro opcional por status (TRIADA ou EM_ANALISE)".
Técnica: partição de equivalência (um valor de cada status).
Preparação: produtor.teste01@valence.dev com o Sítio Boa Vista (Ribeirão Preto/SP); agrônomo e gestor de seed do README; Swagger autorizado com o token indicado em cada passo. Ocorrências TRIADA e EM_ANALISE na fila.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: filtros TRIADA e EM_ANALISE. Valores em Parameter values.
Outputs esperados: listas filtradas e paginadas.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: item de outro status na lista filtrada ou mais de 10 itens na página.
```

## CT-5.1.1-03 · Validar que a fila não mostra ocorrências fora de análise

Suíte: [Fila de análise] Agrônomo - Ver fila de casos por severidade · Tags: funcional; negativo

| status1 | status2 |
| --- | --- |
| RECEBIDA | CONFIRMADA |

```
Identificador: CT-5.1.1-03
Objetivo: verificar que a fila só tem casos aguardando análise.
PBI e critério de aceite: [Fila de análise] Agrônomo - Ver fila de casos por severidade; critério "a fila mostra somente ocorrências com status TRIADA e EM_ANALISE".
Técnica: partição de equivalência, classes inválidas (RECEBIDA, CONFIRMADA e DESCARTADA).
Preparação: produtor.teste01@valence.dev com o Sítio Boa Vista (Ribeirão Preto/SP); agrônomo e gestor de seed do README; Swagger autorizado com o token indicado em cada passo. Ocorrências CONFIRMADA e DESCARTADA existentes; agendador de triagem desligado ou passo 2 feito antes de 10 minutos.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: ocorrências RECEBIDA, CONFIRMADA e DESCARTADA. Valores em Parameter values.
Outputs esperados: nenhuma delas na fila.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: ocorrência de outro status na fila.
```

## CT-5.1.1-04 · Validar acesso à fila por produtor, gestor e sem token

Suíte: [Fila de análise] Agrônomo - Ver fila de casos por severidade · Tags: funcional; negativo

| produtor | gestor |
| --- | --- |
| produtor.teste01@valence.dev | gestor do README |

```
Identificador: CT-5.1.1-04
Objetivo: verificar que só o agrônomo acessa a fila.
PBI e critério de aceite: [Fila de análise] Agrônomo - Ver fila de casos por severidade; critério "somente o papel AGRONOMO acessa a fila; PRODUTOR e GESTOR recebem HTTP 403 e requisição sem token recebe HTTP 401".
Técnica: tabela de decisão por papel e autenticação.
Preparação: produtor.teste01@valence.dev com o Sítio Boa Vista (Ribeirão Preto/SP); agrônomo e gestor de seed do README; Swagger autorizado com o token indicado em cada passo.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: acesso como produtor, gestor e sem token. Valores em Parameter values.
Outputs esperados: HTTP 403, 403 e 401.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: fila devolvida para outro papel ou sem token.
```

## CT-5.1.1-05 · Validar ordenação da fila por campo inexistente

Suíte: [Fila de análise] Agrônomo - Ver fila de casos por severidade · Tags: funcional; negativo

| campo |
| --- |
| campoInexistente |

```
Identificador: CT-5.1.1-05
Objetivo: verificar a validação do parâmetro de ordenação.
PBI e critério de aceite: [Fila de análise] Agrônomo - Ver fila de casos por severidade; critério "ordenação por campo inexistente recebe HTTP 400".
Técnica: partição de equivalência, classe inválida.
Preparação: produtor.teste01@valence.dev com o Sítio Boa Vista (Ribeirão Preto/SP); agrônomo e gestor de seed do README; Swagger autorizado com o token indicado em cada passo.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: sort com campo que não existe. Valores em Parameter values.
Outputs esperados: HTTP 400.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 200 ou 500.
```

## CT-5.1.1-06 · Validar saída da fila após laudo final e permanência após mais informações

Suíte: [Fila de análise] Agrônomo - Ver fila de casos por severidade · Tags: funcional; positivo

| decisao1 | decisao2 |
| --- | --- |
| CONFIRMADA | MAIS_INFORMACOES |

```
Identificador: CT-5.1.1-06
Objetivo: verificar o efeito de cada laudo na fila.
PBI e critério de aceite: [Fila de análise] Agrônomo - Ver fila de casos por severidade; critério "ocorrência com laudo CONFIRMADA ou DESCARTADA sai da fila; com laudo MAIS_INFORMACOES continua na fila".
Técnica: tabela de decisão por tipo de laudo.
Preparação: produtor.teste01@valence.dev com o Sítio Boa Vista (Ribeirão Preto/SP); agrônomo e gestor de seed do README; Swagger autorizado com o token indicado em cada passo. Pelo menos 3 ocorrências na fila.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: três laudos com decisões diferentes. Valores em Parameter values.
Outputs esperados: fila sem as decididas e com a de mais informações.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: ocorrência decidida na fila ou ocorrência com mais informações fora dela.
```

## CT-5.1.2-01 · Validar detalhe da ocorrência com triagem completa para o agrônomo

Suíte: [Fila de análise] Agrônomo - Consultar detalhe da ocorrência com triagem · Tags: funcional; positivo

| agronomo |
| --- |
| agrônomo do README |

```
Identificador: CT-5.1.2-01
Objetivo: verificar o detalhe completo da ocorrência para análise.
PBI e critério de aceite: [Fila de análise] Agrônomo - Consultar detalhe da ocorrência com triagem; critério "detalhe mostra fotos, descrição, cultura, propriedade, município, UF, status e data de registro e a triagem completa; o detalhe tem o botão Emitir laudo, visível somente ao papel AGRONOMO".
Técnica: partição de equivalência, classe válida.
Preparação: produtor.teste01@valence.dev com o Sítio Boa Vista (Ribeirão Preto/SP); agrônomo e gestor de seed do README; Swagger autorizado com o token indicado em cada passo. Ocorrência TRIADA com foto (fluxo do CT-3.1.1-01).
Ambiente: Android com o app Valence (Firebase App Distribution) e API Java no Azure App Service.
Inputs: detalhe aberto pelo agrônomo. Valores em Parameter values.
Outputs esperados: todos os dados, a triagem e o botão Emitir laudo.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: dado ou parte da triagem ausente, ou botão ausente.
```

## CT-5.1.2-02 · Validar motivo da recusa da foto no detalhe para o agrônomo

Suíte: [Fila de análise] Agrônomo - Consultar detalhe da ocorrência com triagem · Tags: funcional; positivo

| agronomo | motivo |
| --- | --- |
| agrônomo do README | foto tremida |

```
Identificador: CT-5.1.2-02
Objetivo: verificar que o agrônomo vê por que a foto foi recusada.
PBI e critério de aceite: [Fila de análise] Agrônomo - Consultar detalhe da ocorrência com triagem; critério "detalhe mostra o motivo da recusa da foto, quando houver".
Técnica: partição de equivalência (triagem só com motivo).
Preparação: produtor.teste01@valence.dev com o Sítio Boa Vista (Ribeirão Preto/SP); agrônomo e gestor de seed do README; Swagger autorizado com o token indicado em cada passo. Ocorrência do caso CT-3.2.1-03 em EM_ANALISE.
Ambiente: Android com o app Valence (Firebase App Distribution) e API Java no Azure App Service.
Inputs: ocorrência com foto recusada. Valores em Parameter values.
Outputs esperados: motivo da recusa no detalhe.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: motivo ausente ou tela de erro.
```

## CT-5.1.2-03 · Validar laudos anteriores no detalhe da ocorrência

Suíte: [Fila de análise] Agrônomo - Consultar detalhe da ocorrência com triagem · Tags: funcional; positivo

| decisao |
| --- |
| MAIS_INFORMACOES |

```
Identificador: CT-5.1.2-03
Objetivo: verificar o histórico de laudos no detalhe.
PBI e critério de aceite: [Fila de análise] Agrônomo - Consultar detalhe da ocorrência com triagem; critério "detalhe mostra os laudos anteriores da ocorrência, quando houver".
Técnica: partição de equivalência (ocorrência com laudo anterior).
Preparação: produtor.teste01@valence.dev com o Sítio Boa Vista (Ribeirão Preto/SP); agrônomo e gestor de seed do README; Swagger autorizado com o token indicado em cada passo.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: ocorrência com um laudo MAIS_INFORMACOES. Valores em Parameter values.
Outputs esperados: laudo anterior no detalhe.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: laudo anterior ausente.
```

## CT-5.1.2-04 · Validar ocorrência e foto inexistentes no detalhe

Suíte: [Fila de análise] Agrônomo - Consultar detalhe da ocorrência com triagem · Tags: funcional; negativo

| inexistente |
| --- |
| 999999 |

```
Identificador: CT-5.1.2-04
Objetivo: verificar o tratamento de ids inexistentes.
PBI e critério de aceite: [Fila de análise] Agrônomo - Consultar detalhe da ocorrência com triagem; critério "ocorrência inexistente recebe HTTP 404; foto de ocorrência inexistente recebe HTTP 404".
Técnica: partição de equivalência, classe inválida (id inexistente).
Preparação: produtor.teste01@valence.dev com o Sítio Boa Vista (Ribeirão Preto/SP); agrônomo e gestor de seed do README; Swagger autorizado com o token indicado em cada passo.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: id de ocorrência inexistente. Valores em Parameter values.
Outputs esperados: HTTP 404 nas duas chamadas.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 200 ou 500.
```

## CT-5.1.2-05 · Validar carregamento das fotos com o token do agrônomo

Suíte: [Fila de análise] Agrônomo - Consultar detalhe da ocorrência com triagem · Tags: funcional; positivo

| agronomo |
| --- |
| agrônomo do README |

```
Identificador: CT-5.1.2-05
Objetivo: verificar o acesso do agrônomo às fotos.
PBI e critério de aceite: [Fila de análise] Agrônomo - Consultar detalhe da ocorrência com triagem; critério "as fotos carregam com o token do agrônomo".
Técnica: partição de equivalência, classe válida.
Preparação: produtor.teste01@valence.dev com o Sítio Boa Vista (Ribeirão Preto/SP); agrônomo e gestor de seed do README; Swagger autorizado com o token indicado em cada passo. Ocorrência com foto na fila.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: ocorrência com foto. Valores em Parameter values.
Outputs esperados: foto exibida para o agrônomo.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: foto sem carregar ou HTTP 403.
```

## CT-5.2.1-01 · Validar laudo confirmado com post no mural do município

Suíte: [Emissão de laudo] Agrônomo - Confirmar ou descartar ocorrência · Tags: funcional; positivo

| praga | parecer |
| --- | --- |
| Ferrugem-comum | Pústulas típicas de ferrugem-comum na foto e na descrição. |

```
Identificador: CT-5.2.1-01
Objetivo: verificar o laudo CONFIRMADA e seus efeitos.
PBI e critério de aceite: [Emissão de laudo] Agrônomo - Confirmar ou descartar ocorrência; critério "laudo emitido com sucesso recebe HTTP 201 e registra o agrônomo responsável e a data; laudo CONFIRMADA muda a ocorrência para CONFIRMADA, atualiza os alertas e cria no mural do município um post do caso confirmado, assinado pelo agrônomo".
Técnica: transição de estado (TRIADA para CONFIRMADA).
Preparação: produtor.teste01@valence.dev com o Sítio Boa Vista (Ribeirão Preto/SP); agrônomo e gestor de seed do README; Swagger autorizado com o token indicado em cada passo. Ocorrência TRIADA na fila.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: laudo CONFIRMADA com praga e parecer válidos. Valores em Parameter values.
Outputs esperados: ocorrência CONFIRMADA, laudo registrado e post no mural.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: status diferente, laudo sem agrônomo ou data, ou post ausente.
```

## CT-5.2.1-02 · Validar laudo descartado com encerramento dos alertas

Suíte: [Emissão de laudo] Agrônomo - Confirmar ou descartar ocorrência · Tags: funcional; positivo

| decisao | parecer |
| --- | --- |
| DESCARTADA | Manchas de deficiência nutricional, sem praga ou doença. |

```
Identificador: CT-5.2.1-02
Objetivo: verificar o laudo DESCARTADA e seus efeitos.
PBI e critério de aceite: [Emissão de laudo] Agrônomo - Confirmar ou descartar ocorrência; critério "laudo DESCARTADA muda a ocorrência para DESCARTADA e encerra os alertas".
Técnica: transição de estado (TRIADA para DESCARTADA).
Preparação: produtor.teste01@valence.dev com o Sítio Boa Vista (Ribeirão Preto/SP); agrônomo e gestor de seed do README; Swagger autorizado com o token indicado em cada passo. Ocorrência TRIADA com alerta SUSPEITA para o vizinho.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: laudo DESCARTADA. Valores em Parameter values.
Outputs esperados: ocorrência DESCARTADA e alertas ENCERRADO.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: status diferente ou alerta ainda SUSPEITA.
```

## CT-5.2.1-03 · Validar parecer com 20 e com 2000 caracteres

Suíte: [Emissão de laudo] Agrônomo - Confirmar ou descartar ocorrência · Tags: funcional; positivo

| parecer20 | tamanho |
| --- | --- |
| Ferrugem confirmada. | 2000 |

```
Identificador: CT-5.2.1-03
Objetivo: verificar os limites válidos do parecer.
PBI e critério de aceite: [Emissão de laudo] Agrônomo - Confirmar ou descartar ocorrência; critério "parecer de 20 a 2000 caracteres".
Técnica: análise de valor limite (20 e 2000).
Preparação: produtor.teste01@valence.dev com o Sítio Boa Vista (Ribeirão Preto/SP); agrônomo e gestor de seed do README; Swagger autorizado com o token indicado em cada passo. Duas ocorrências TRIADA; texto de 2000 caracteres preparado num editor.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: pareceres com 20 e 2000 caracteres. Valores em Parameter values.
Outputs esperados: HTTP 201 nos dois.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 400 em valor válido.
```

## CT-5.2.1-04 · Validar parecer ausente, com 19 e com 2001 caracteres

Suíte: [Emissão de laudo] Agrônomo - Confirmar ou descartar ocorrência · Tags: funcional; negativo

| parecer19 | tamanho |
| --- | --- |
| Ferrugem confirmada | 2001 |

```
Identificador: CT-5.2.1-04
Objetivo: verificar a validação do parecer.
PBI e critério de aceite: [Emissão de laudo] Agrônomo - Confirmar ou descartar ocorrência; critério "parecer ausente ou fora do limite recebe HTTP 400 com a lista de campos".
Técnica: análise de valor limite (19 e 2001) e partição de equivalência (ausente).
Preparação: produtor.teste01@valence.dev com o Sítio Boa Vista (Ribeirão Preto/SP); agrônomo e gestor de seed do README; Swagger autorizado com o token indicado em cada passo. Ocorrência TRIADA; texto de 2001 caracteres preparado.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: parecer ausente, com 19 e com 2001 caracteres. Valores em Parameter values.
Outputs esperados: HTTP 400 e ocorrência sem mudança.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: laudo gravado com parecer inválido.
```

## CT-5.2.1-05 · Validar laudo confirmado sem praga confirmada

Suíte: [Emissão de laudo] Agrônomo - Confirmar ou descartar ocorrência · Tags: funcional; negativo

| parecer |
| --- |
| Sintomas compatíveis com doença fúngica nas folhas. |

```
Identificador: CT-5.2.1-05
Objetivo: verificar a obrigatoriedade da praga na confirmação.
PBI e critério de aceite: [Emissão de laudo] Agrônomo - Confirmar ou descartar ocorrência; critério "decisão CONFIRMADA sem praga confirmada recebe HTTP 400".
Técnica: tabela de decisão (CONFIRMADA sem praga).
Preparação: produtor.teste01@valence.dev com o Sítio Boa Vista (Ribeirão Preto/SP); agrônomo e gestor de seed do README; Swagger autorizado com o token indicado em cada passo. Ocorrência TRIADA.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: laudo CONFIRMADA sem praga. Valores em Parameter values.
Outputs esperados: HTTP 400.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: laudo gravado sem praga.
```

## CT-5.2.1-06 · Validar laudo em ocorrência já decidida e inexistente

Suíte: [Emissão de laudo] Agrônomo - Confirmar ou descartar ocorrência · Tags: funcional; negativo

| status | inexistente |
| --- | --- |
| CONFIRMADA | 999999 |

```
Identificador: CT-5.2.1-06
Objetivo: verificar que a decisão final não é sobrescrita.
PBI e critério de aceite: [Emissão de laudo] Agrônomo - Confirmar ou descartar ocorrência; critério "ocorrência já CONFIRMADA ou DESCARTADA recebe HTTP 422; ocorrência inexistente recebe HTTP 404".
Técnica: transição de estado inválida e partição de equivalência (id inexistente).
Preparação: produtor.teste01@valence.dev com o Sítio Boa Vista (Ribeirão Preto/SP); agrônomo e gestor de seed do README; Swagger autorizado com o token indicado em cada passo. Ocorrências CONFIRMADA e DESCARTADA.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: laudos em ocorrências decididas e inexistente. Valores em Parameter values.
Outputs esperados: HTTP 422, 422 e 404.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: laudo final substituído.
```

## CT-5.2.1-07 · Validar post do caso confirmado sem dados do produtor

Suíte: [Emissão de laudo] Agrônomo - Confirmar ou descartar ocorrência · Tags: funcional; negativo

| dados |
| --- |
| nome do produtor, produtor.teste01@valence.dev, Sítio Boa Vista, -21.1775, -47.8103 |

```
Identificador: CT-5.2.1-07
Objetivo: verificar a privacidade do produtor no post público.
PBI e critério de aceite: [Emissão de laudo] Agrônomo - Confirmar ou descartar ocorrência; critério "post do caso confirmado assinado pelo agrônomo e sem dados do produtor".
Técnica: partição de equivalência, classe inválida (dado pessoal no post).
Preparação: caso CT-5.2.1-01 executado.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: post criado pelo laudo CONFIRMADA. Valores em Parameter values.
Outputs esperados: post sem dados do produtor.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: qualquer dado de Parameter values no post.
```

## CT-5.2.1-08 · Validar evento de laudo no Observatório sem dados pessoais

Suíte: [Emissão de laudo] Agrônomo - Confirmar ou descartar ocorrência · Tags: funcional; positivo

| municipio |
| --- |
| Ribeirão Preto |

```
Identificador: CT-5.2.1-08
Objetivo: verificar que as duas decisões chegam ao Observatório.
PBI e critério de aceite: [Emissão de laudo] Agrônomo - Confirmar ou descartar ocorrência; critério "as duas decisões emitem o evento laudo.emitido, sem dados pessoais, para o Observatório".
Técnica: tabela de decisão (CONFIRMADA e DESCARTADA).
Preparação: casos CT-5.2.1-01 e CT-5.2.1-02 executados; Observatório consumindo a fila.
Ambiente: API Java no Azure App Service, Swagger da API Java, Swagger do Observatório .NET no Azure e app Valence no Android.
Inputs: laudos CONFIRMADA e DESCARTADA. Valores em Parameter values.
Outputs esperados: focos atualizados sem dados pessoais.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: foco sem atualização ou com dado pessoal.
```

## CT-5.2.1-09 · Validar que o produtor vê o laudo sem o e-mail do agrônomo

Suíte: [Emissão de laudo] Agrônomo - Confirmar ou descartar ocorrência · Tags: funcional; negativo

| produtor |
| --- |
| produtor.teste01@valence.dev |

```
Identificador: CT-5.2.1-09
Objetivo: verificar a privacidade do agrônomo no laudo.
PBI e critério de aceite: [Emissão de laudo] Agrônomo - Confirmar ou descartar ocorrência; critério "o produtor vê no detalhe a decisão, a praga confirmada, o parecer, a data e o nome do agrônomo, sem o e-mail dele".
Técnica: partição de equivalência, classe inválida (e-mail no laudo).
Preparação: caso CT-5.2.1-01 executado.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: detalhe da ocorrência confirmada visto pelo produtor. Valores em Parameter values.
Outputs esperados: laudo sem o e-mail do agrônomo.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: e-mail do agrônomo exibido.
```

## CT-5.2.2-01 · Validar pedido de mais informações sem praga confirmada

Suíte: [Emissão de laudo] Agrônomo - Pedir mais informações ao produtor · Tags: funcional; positivo

| decisao | parecer |
| --- | --- |
| MAIS_INFORMACOES | Envie uma foto mais próxima da folha, com luz do dia. |

```
Identificador: CT-5.2.2-01
Objetivo: verificar o pedido de mais informações.
PBI e critério de aceite: [Emissão de laudo] Agrônomo - Pedir mais informações ao produtor; critério "o formulário aceita MAIS_INFORMACOES com parecer de 20 a 2000 caracteres; a praga confirmada não é obrigatória; laudo MAIS_INFORMACOES recebe HTTP 201 e deixa a ocorrência em EM_ANALISE; a ocorrência continua na fila e os alertas continuam como SUSPEITA".
Técnica: tabela de decisão (MAIS_INFORMACOES sem praga).
Preparação: produtor.teste01@valence.dev com o Sítio Boa Vista (Ribeirão Preto/SP); agrônomo e gestor de seed do README; Swagger autorizado com o token indicado em cada passo. Ocorrência TRIADA com alerta SUSPEITA para o vizinho.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: laudo MAIS_INFORMACOES sem praga. Valores em Parameter values.
Outputs esperados: EM_ANALISE, na fila e alertas SUSPEITA.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 400 pela falta de praga, saída da fila ou alerta alterado.
```

## CT-5.2.2-02 · Validar que o produtor vê o parecer e envia nova foto

Suíte: [Emissão de laudo] Agrônomo - Pedir mais informações ao produtor · Tags: funcional; positivo

| produtor | foto |
| --- | --- |
| produtor.teste01@valence.dev | milho-folha-ferrugem.jpg |

```
Identificador: CT-5.2.2-02
Objetivo: verificar que o produtor responde ao pedido de mais informações.
PBI e critério de aceite: [Emissão de laudo] Agrônomo - Pedir mais informações ao produtor; critério "o produtor vê o parecer no detalhe da ocorrência e pode enviar nova foto e refazer a triagem".
Técnica: transição de estado (EM_ANALISE com nova foto).
Preparação: caso CT-5.2.2-01 executado; ambiente da triagem com foto.
Ambiente: Android com o app Valence (Firebase App Distribution) e API Java no Azure App Service.
Inputs: nova foto e novo pedido de triagem. Valores em Parameter values.
Outputs esperados: parecer visível, foto aceita e triagem refeita.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: parecer ausente ou envio de foto bloqueado.
```

## CT-5.2.2-03 · Validar que mais informações não muda o status do foco no Observatório

Suíte: [Emissão de laudo] Agrônomo - Pedir mais informações ao produtor · Tags: funcional; positivo

| municipio |
| --- |
| Ribeirão Preto |

```
Identificador: CT-5.2.2-03
Objetivo: verificar que o evento de mais informações não altera o foco.
PBI e critério de aceite: [Emissão de laudo] Agrônomo - Pedir mais informações ao produtor; critério "o evento laudo.emitido é emitido com a decisão MAIS_INFORMACOES, e o Observatório não muda o status do foco".
Técnica: tabela de decisão por tipo de laudo.
Preparação: ocorrência TRIADA com foco no Observatório; Observatório consumindo a fila.
Ambiente: API Java no Azure App Service, Swagger da API Java, Swagger do Observatório .NET no Azure e app Valence no Android.
Inputs: laudo MAIS_INFORMACOES. Valores em Parameter values.
Outputs esperados: foco com o mesmo status.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: status do foco alterado.
```

## CT-5.2.2-04 · Validar novo laudo final depois de mais informações

Suíte: [Emissão de laudo] Agrônomo - Pedir mais informações ao produtor · Tags: funcional; positivo

| decisao |
| --- |
| CONFIRMADA |

```
Identificador: CT-5.2.2-04
Objetivo: verificar que a análise continua depois do pedido.
PBI e critério de aceite: [Emissão de laudo] Agrônomo - Pedir mais informações ao produtor; critério "depois de um laudo MAIS_INFORMACOES, o agrônomo pode emitir um novo laudo CONFIRMADA ou DESCARTADA".
Técnica: transição de estado (EM_ANALISE para CONFIRMADA).
Preparação: caso CT-5.2.2-01 executado.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: laudo CONFIRMADA após MAIS_INFORMACOES. Valores em Parameter values.
Outputs esperados: HTTP 201 e status CONFIRMADA.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 422 ou status sem mudança.
```

## CT-5.2.2-05 · Validar pedido de mais informações com parecer curto

Suíte: [Emissão de laudo] Agrônomo - Pedir mais informações ao produtor · Tags: funcional; negativo

| parecer19 |
| --- |
| Mande outra foto ok |

```
Identificador: CT-5.2.2-05
Objetivo: verificar o limite do parecer no pedido de mais informações.
PBI e critério de aceite: [Emissão de laudo] Agrônomo - Pedir mais informações ao produtor; critério "MAIS_INFORMACOES com parecer de 20 a 2000 caracteres".
Técnica: análise de valor limite (19 caracteres).
Preparação: produtor.teste01@valence.dev com o Sítio Boa Vista (Ribeirão Preto/SP); agrônomo e gestor de seed do README; Swagger autorizado com o token indicado em cada passo. Ocorrência TRIADA.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: parecer com 19 caracteres. Valores em Parameter values.
Outputs esperados: HTTP 400.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: laudo gravado com parecer curto.
```

## CT-5.2.3-01 · Validar emissão de laudo pelo produtor na própria ocorrência

Suíte: [Emissão de laudo] Produtor ou gestor - Bloquear emissão de laudo sem permissão · Tags: funcional; negativo

| produtor |
| --- |
| produtor.teste01@valence.dev |

```
Identificador: CT-5.2.3-01
Objetivo: verificar que o produtor não emite laudo.
PBI e critério de aceite: [Emissão de laudo] Produtor ou gestor - Bloquear emissão de laudo sem permissão; critério "PRODUTOR que tenta emitir laudo recebe HTTP 403, inclusive na própria ocorrência; nenhum laudo é gravado e o status não muda".
Técnica: tabela de decisão por papel.
Preparação: produtor.teste01@valence.dev com o Sítio Boa Vista (Ribeirão Preto/SP); agrônomo e gestor de seed do README; Swagger autorizado com o token indicado em cada passo. Ocorrência TRIADA do produtor.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: laudo enviado pelo dono da ocorrência. Valores em Parameter values.
Outputs esperados: HTTP 403 e ocorrência sem mudança.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: laudo gravado pelo produtor.
```

## CT-5.2.3-02 · Validar emissão de laudo pelo gestor

Suíte: [Emissão de laudo] Produtor ou gestor - Bloquear emissão de laudo sem permissão · Tags: funcional; negativo

| gestor |
| --- |
| gestor do README |

```
Identificador: CT-5.2.3-02
Objetivo: verificar que o gestor não emite laudo.
PBI e critério de aceite: [Emissão de laudo] Produtor ou gestor - Bloquear emissão de laudo sem permissão; critério "GESTOR que tenta emitir laudo recebe HTTP 403; nenhum laudo é gravado e o status não muda".
Técnica: tabela de decisão por papel.
Preparação: produtor.teste01@valence.dev com o Sítio Boa Vista (Ribeirão Preto/SP); agrônomo e gestor de seed do README; Swagger autorizado com o token indicado em cada passo. Ocorrência TRIADA.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: laudo enviado pelo gestor. Valores em Parameter values.
Outputs esperados: HTTP 403.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: laudo gravado pelo gestor.
```

## CT-5.2.3-03 · Validar emissão de laudo sem token e com token expirado

Suíte: [Emissão de laudo] Produtor ou gestor - Bloquear emissão de laudo sem permissão · Tags: funcional; negativo

| token |
| --- |
| token do agrônomo emitido há mais de 120 minutos |

```
Identificador: CT-5.2.3-03
Objetivo: verificar a autenticação na emissão de laudo.
PBI e critério de aceite: [Emissão de laudo] Produtor ou gestor - Bloquear emissão de laudo sem permissão; critério "requisição sem token ou com token expirado recebe HTTP 401; nenhum laudo é gravado e o status não muda".
Técnica: partição de equivalência (sem token e token expirado).
Preparação: produtor.teste01@valence.dev com o Sítio Boa Vista (Ribeirão Preto/SP); agrônomo e gestor de seed do README; Swagger autorizado com o token indicado em cada passo. Token do agrônomo guardado há mais de 120 minutos, ou API local com JWT_EXPIRATION_MINUTES=1.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: envio sem token e com token expirado. Valores em Parameter values.
Outputs esperados: HTTP 401 nos dois.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: laudo gravado sem autenticação válida.
```

## CT-5.2.3-04 · Validar ausência do botão Emitir laudo para produtor e gestor

Suíte: [Emissão de laudo] Produtor ou gestor - Bloquear emissão de laudo sem permissão · Tags: funcional; negativo

| produtor | gestor |
| --- | --- |
| produtor.teste01@valence.dev | gestor do README |

```
Identificador: CT-5.2.3-04
Objetivo: verificar que o app esconde a emissão de laudo de quem não tem permissão.
PBI e critério de aceite: [Emissão de laudo] Produtor ou gestor - Bloquear emissão de laudo sem permissão; critério "o botão Emitir laudo não aparece no app para PRODUTOR e GESTOR".
Técnica: tabela de decisão por papel.
Preparação: produtor.teste01@valence.dev com o Sítio Boa Vista (Ribeirão Preto/SP); agrônomo e gestor de seed do README; Swagger autorizado com o token indicado em cada passo.
Ambiente: Android com o app Valence (Firebase App Distribution) e API Java no Azure App Service.
Inputs: detalhe aberto por produtor e gestor. Valores em Parameter values.
Outputs esperados: botão ausente nos dois.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: botão visível para produtor ou gestor.
```

