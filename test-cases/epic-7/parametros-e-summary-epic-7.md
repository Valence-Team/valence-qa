# Feature epic.7 - Parameter values e Summary

## CT-7.1.1-01 · Validar consulta pública de focos sem login

Suíte: [Dados abertos de focos] Cidadão - Consultar focos anonimizados · Tags: funcional; positivo

| rota |
| --- |
| /api/publico/focos |

```
Identificador: CT-7.1.1-01
Objetivo: verificar a lista pública de focos.
PBI e critério de aceite: [Dados abertos de focos] Cidadão - Consultar focos anonimizados; critério "consulta de focos sem login; foco mostra somente id, cultura, praga provável, severidade, município, UF, status, data da ocorrência, data de atualização e links; da ocorrência mais recente para a mais antiga; datas em UTC no formato ISO-8601".
Técnica: partição de equivalência, classe válida.
Preparação: Observatório no ar com focos de MILHO em Ribeirão Preto/SP gerados nos Epics 3 a 5; nenhum login no Swagger.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: consulta sem filtros e sem token. Valores em Parameter values.
Outputs esperados: lista com os campos e a ordem do critério.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 401, campo a mais ou a menos, ordem errada ou data fora de UTC.
```

## CT-7.1.1-02 · Validar filtros de cultura, UF, município e data dos focos

Suíte: [Dados abertos de focos] Cidadão - Consultar focos anonimizados · Tags: funcional; positivo

| cultura | municipio | desde |
| --- | --- | --- |
| milho | ribeirão preto | 2026-11-01T00:00:00Z |

```
Identificador: CT-7.1.1-02
Objetivo: verificar os filtros dos focos.
PBI e critério de aceite: [Dados abertos de focos] Cidadão - Consultar focos anonimizados; critério "filtros opcionais por cultura (maiúsculas ou minúsculas), UF, município e data inicial (desde, em ISO-8601)".
Técnica: partição de equivalência, classes válidas.
Preparação: Observatório no ar com focos de MILHO em Ribeirão Preto/SP gerados nos Epics 3 a 5; nenhum login no Swagger.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: filtros de cultura, UF, município e data. Valores em Parameter values.
Outputs esperados: listas filtradas.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: foco fora do filtro na lista.
```

## CT-7.1.1-03 · Validar paginação dos focos com links que mantêm os filtros

Suíte: [Dados abertos de focos] Cidadão - Consultar focos anonimizados · Tags: funcional; positivo

| minimo | maximo |
| --- | --- |
| 1 | 100 |

```
Identificador: CT-7.1.1-03
Objetivo: verificar a paginação e os links HATEOAS.
PBI e critério de aceite: [Dados abertos de focos] Cidadão - Consultar focos anonimizados; critério "paginação por deslocamento (padrão 0) e registroRetornado (padrão 10, de 1 a 100), com total de registros e links self, prev e next que mantêm os filtros".
Técnica: análise de valor limite (registroRetornado 1 e 100) e padrões.
Preparação: Observatório no ar com focos de MILHO em Ribeirão Preto/SP gerados nos Epics 3 a 5; nenhum login no Swagger. Pelo menos 2 focos de MILHO.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: consultas com e sem paginação. Valores em Parameter values.
Outputs esperados: páginas corretas e links com os filtros.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: link sem o filtro, padrão diferente ou limite válido recusado.
```

## CT-7.1.1-04 · Validar detalhe público de um foco

Suíte: [Dados abertos de focos] Cidadão - Consultar focos anonimizados · Tags: funcional; positivo

| rota |
| --- |
| /api/publico/focos/{id} |

```
Identificador: CT-7.1.1-04
Objetivo: verificar o detalhe de foco sem login.
PBI e critério de aceite: [Dados abertos de focos] Cidadão - Consultar focos anonimizados; critério "consulta do detalhe de um foco sem login".
Técnica: partição de equivalência, classe válida.
Preparação: Observatório no ar com focos de MILHO em Ribeirão Preto/SP gerados nos Epics 3 a 5; nenhum login no Swagger.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: id de foco existente. Valores em Parameter values.
Outputs esperados: detalhe do foco.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 401 ou campo ausente.
```

## CT-7.1.1-05 · Validar que o foco não expõe dados pessoais nem o id da ocorrência

Suíte: [Dados abertos de focos] Cidadão - Consultar focos anonimizados · Tags: funcional; negativo

| dados |
| --- |
| ocorrenciaId, nome, e-mail, telefone, latitude, longitude, Sítio Boa Vista |

```
Identificador: CT-7.1.1-05
Objetivo: verificar a anonimização dos dados abertos.
PBI e critério de aceite: [Dados abertos de focos] Cidadão - Consultar focos anonimizados; critério "sem o id da ocorrência original e sem nome, e-mail, telefone ou coordenada".
Técnica: partição de equivalência, classe inválida (dado pessoal exposto).
Preparação: Observatório no ar com focos de MILHO em Ribeirão Preto/SP gerados nos Epics 3 a 5; nenhum login no Swagger.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: lista e detalhe de focos. Valores em Parameter values.
Outputs esperados: nenhum dado pessoal nem ocorrenciaId.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: qualquer dado de Parameter values na resposta.
```

## CT-7.1.1-06 · Validar lista de focos vazia

Suíte: [Dados abertos de focos] Cidadão - Consultar focos anonimizados · Tags: funcional; positivo

| uf |
| --- |
| AC |

```
Identificador: CT-7.1.1-06
Objetivo: verificar a resposta sem resultados.
PBI e critério de aceite: [Dados abertos de focos] Cidadão - Consultar focos anonimizados; critério "lista sem resultados recebe HTTP 204 sem corpo".
Técnica: partição de equivalência (lista vazia).
Preparação: Observatório no ar com focos de MILHO em Ribeirão Preto/SP gerados nos Epics 3 a 5; nenhum login no Swagger. Nenhum foco de BATATA no Acre.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: filtro sem resultados. Valores em Parameter values.
Outputs esperados: HTTP 204 sem corpo.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 200 com lista vazia ou 404.
```

## CT-7.1.1-07 · Validar filtros inválidos na consulta de focos

Suíte: [Dados abertos de focos] Cidadão - Consultar focos anonimizados · Tags: funcional; negativo

| cultura | uf | tamanho | deslocamento | desde |
| --- | --- | --- | --- | --- |
| SOJA | XX | 101 | -1 | ontem |

```
Identificador: CT-7.1.1-07
Objetivo: verificar a validação dos filtros.
PBI e critério de aceite: [Dados abertos de focos] Cidadão - Consultar focos anonimizados; critério "filtro inválido recebe HTTP 400 com a lista de campos: cultura fora de MILHO, TOMATE e BATATA, UF inexistente, município com mais de 100 caracteres, deslocamento negativo, registroRetornado fora de 1 a 100, data ou número em formato errado".
Técnica: partição de equivalência e análise de valor limite (0, 101, -1 e 101 caracteres).
Preparação: Observatório no ar com focos de MILHO em Ribeirão Preto/SP gerados nos Epics 3 a 5; nenhum login no Swagger.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: um filtro inválido por chamada. Valores em Parameter values.
Outputs esperados: HTTP 400 com o campo em cada chamada.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 200 ou 500 em filtro inválido.
```

## CT-7.1.1-08 · Validar detalhe de foco inexistente

Suíte: [Dados abertos de focos] Cidadão - Consultar focos anonimizados · Tags: funcional; negativo

| inexistente |
| --- |
| 999999 |

```
Identificador: CT-7.1.1-08
Objetivo: verificar o detalhe de foco que não existe.
PBI e critério de aceite: [Dados abertos de focos] Cidadão - Consultar focos anonimizados; critério "detalhe de foco inexistente recebe HTTP 404".
Técnica: partição de equivalência, classe inválida.
Preparação: Observatório no ar com focos de MILHO em Ribeirão Preto/SP gerados nos Epics 3 a 5; nenhum login no Swagger.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: id inexistente. Valores em Parameter values.
Outputs esperados: HTTP 404.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 200 ou 500.
```

## CT-7.1.2-01 · Validar estatísticas por UF e período

Suíte: [Dados abertos de focos] Cidadão - Consultar estatísticas por período · Tags: funcional; positivo

| uf | periodo |
| --- | --- |
| SP | 30 |

```
Identificador: CT-7.1.2-01
Objetivo: verificar as estatísticas públicas.
PBI e critério de aceite: [Dados abertos de focos] Cidadão - Consultar estatísticas por período; critério "consulta de estatísticas sem login; resposta com UF, período em dias, data inicial e final, total de focos e contagens por status, cultura, praga e município (no formato Município/UF), cada uma em ordem decrescente de total; a resposta traz links HATEOAS".
Técnica: partição de equivalência, classe válida.
Preparação: Observatório no ar com focos de MILHO em Ribeirão Preto/SP gerados nos Epics 3 a 5; nenhum login no Swagger.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: UF SP e período de 30 dias. Valores em Parameter values.
Outputs esperados: estatísticas completas e ordenadas.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: campo ausente, ordem errada ou município fora do formato.
```

## CT-7.1.2-02 · Validar estatísticas do Brasil inteiro com período padrão

Suíte: [Dados abertos de focos] Cidadão - Consultar estatísticas por período · Tags: funcional; positivo

| padrao |
| --- |
| 30 |

```
Identificador: CT-7.1.2-02
Objetivo: verificar os padrões das estatísticas.
PBI e critério de aceite: [Dados abertos de focos] Cidadão - Consultar estatísticas por período; critério "filtro opcional por UF; sem UF, as estatísticas cobrem o Brasil inteiro; período com padrão de 30".
Técnica: partição de equivalência (parâmetros ausentes).
Preparação: Observatório no ar com focos de MILHO em Ribeirão Preto/SP gerados nos Epics 3 a 5; nenhum login no Swagger.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: consulta sem UF e sem período. Valores em Parameter values.
Outputs esperados: Brasil inteiro e 30 dias.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: uf preenchida ou período diferente de 30.
```

## CT-7.1.2-03 · Validar período de 1 e de 365 dias

Suíte: [Dados abertos de focos] Cidadão - Consultar estatísticas por período · Tags: funcional; positivo

| minimo | maximo |
| --- | --- |
| 1 | 365 |

```
Identificador: CT-7.1.2-03
Objetivo: verificar os limites válidos do período.
PBI e critério de aceite: [Dados abertos de focos] Cidadão - Consultar estatísticas por período; critério "período de 1 a 365 dias".
Técnica: análise de valor limite (1 e 365).
Preparação: Observatório no ar com focos de MILHO em Ribeirão Preto/SP gerados nos Epics 3 a 5; nenhum login no Swagger.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: períodos 1 e 365. Valores em Parameter values.
Outputs esperados: HTTP 200 nos dois.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 400 em valor válido.
```

## CT-7.1.2-04 · Validar período e UF inválidos nas estatísticas

Suíte: [Dados abertos de focos] Cidadão - Consultar estatísticas por período · Tags: funcional; negativo

| texto | uf |
| --- | --- |
| trinta | XX |

```
Identificador: CT-7.1.2-04
Objetivo: verificar a validação das estatísticas.
PBI e critério de aceite: [Dados abertos de focos] Cidadão - Consultar estatísticas por período; critério "período fora da faixa ou em formato errado recebe HTTP 400 com a mensagem do campo; UF inexistente recebe HTTP 400 com a mensagem do campo".
Técnica: análise de valor limite (0 e 366) e partição de equivalência.
Preparação: Observatório no ar com focos de MILHO em Ribeirão Preto/SP gerados nos Epics 3 a 5; nenhum login no Swagger.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: período 0, 366 e texto; UF XX. Valores em Parameter values.
Outputs esperados: HTTP 400 em todas.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 200 ou 500.
```

## CT-7.1.2-05 · Validar estatísticas zeradas sem focos no período

Suíte: [Dados abertos de focos] Cidadão - Consultar estatísticas por período · Tags: funcional; positivo

| uf |
| --- |
| AC |

```
Identificador: CT-7.1.2-05
Objetivo: verificar a resposta sem focos.
PBI e critério de aceite: [Dados abertos de focos] Cidadão - Consultar estatísticas por período; critério "sem focos no período, a resposta é HTTP 200 com o total e as contagens zerados".
Técnica: partição de equivalência (período sem focos).
Preparação: Observatório no ar com focos de MILHO em Ribeirão Preto/SP gerados nos Epics 3 a 5; nenhum login no Swagger. Nenhum foco no Acre no último dia.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: UF sem focos. Valores em Parameter values.
Outputs esperados: HTTP 200 zerado.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 204, 404 ou erro.
```

## CT-7.1.3-01 · Validar bloqueio na requisição 61 dentro de 60 segundos

Suíte: [Dados abertos de focos] Sistema - Limitar excesso de requisições · Tags: funcional; negativo

| rota |
| --- |
| GET /api/publico/focos |

```
Identificador: CT-7.1.3-01
Objetivo: verificar o limite dos endpoints públicos.
PBI e critério de aceite: [Dados abertos de focos] Sistema - Limitar excesso de requisições; critério "endpoints públicos aceitam até 60 requisições a cada 60 segundos por IP; a requisição número 61 recebe HTTP 429 com Muitas requisições e Retry-After; depois do Retry-After, o mesmo IP volta a receber HTTP 200".
Técnica: análise de valor limite (60 e 61 requisições).
Preparação: Observatório no ar com focos de MILHO em Ribeirão Preto/SP gerados nos Epics 3 a 5; nenhum login no Swagger. Laço de requisições preparado no PowerShell.
Ambiente: Swagger do Observatório .NET no Azure e PowerShell para repetir requisições.
Inputs: 61 requisições em menos de 60 segundos. Valores em Parameter values.
Outputs esperados: 60 aceitas, a 61 com HTTP 429 e liberação depois do Retry-After.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: requisição 61 aceita, 429 sem Retry-After ou bloqueio permanente.
```

## CT-7.1.3-02 · Validar health e Swagger fora do limite de requisições

Suíte: [Dados abertos de focos] Sistema - Limitar excesso de requisições · Tags: funcional; positivo

| health | swagger |
| --- | --- |
| GET /health | /swagger |

```
Identificador: CT-7.1.3-02
Objetivo: verificar as rotas fora do limite.
PBI e critério de aceite: [Dados abertos de focos] Sistema - Limitar excesso de requisições; critério "os endpoints /health e /swagger ficam fora do limite".
Técnica: partição de equivalência (rotas isentas).
Preparação: caso CT-7.1.3-01 executado, com o IP ainda bloqueado.
Ambiente: Swagger do Observatório .NET no Azure e PowerShell para repetir requisições.
Inputs: chamadas a /health e /swagger com o IP bloqueado. Valores em Parameter values.
Outputs esperados: HTTP 200 nas duas.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 429 em /health ou /swagger.
```

## CT-7.1.3-03 · Validar que o limite de um IP não afeta outro

Suíte: [Dados abertos de focos] Sistema - Limitar excesso de requisições · Tags: funcional; positivo

| rede |
| --- |
| dados móveis, fora do Wi-Fi do computador |

```
Identificador: CT-7.1.3-03
Objetivo: verificar o isolamento do limite por IP.
PBI e critério de aceite: [Dados abertos de focos] Sistema - Limitar excesso de requisições; critério "o limite de um IP não afeta outro IP".
Técnica: partição de equivalência (dois IPs).
Preparação: caso CT-7.1.3-01 executado; celular com dados móveis.
Ambiente: Swagger do Observatório .NET no Azure e PowerShell para repetir requisições.
Inputs: requisição de outro IP. Valores em Parameter values.
Outputs esperados: HTTP 200 no outro IP.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: outro IP bloqueado.
```

## CT-7.1.3-04 · Validar limite configurado por variáveis de ambiente

Suíte: [Dados abertos de focos] Sistema - Limitar excesso de requisições · Tags: funcional; positivo

| limite | janela |
| --- | --- |
| 3 | 30 |

```
Identificador: CT-7.1.3-04
Objetivo: verificar que o limite vem da configuração.
PBI e critério de aceite: [Dados abertos de focos] Sistema - Limitar excesso de requisições; critério "os limites são configurados por variáveis de ambiente (RateLimiting__Publica__Limite e RateLimiting__Publica__JanelaSegundos)".
Técnica: partição de equivalência por configuração.
Preparação: Observatório local com as variáveis alteradas; voltar aos padrões ao final.
Ambiente: Observatório .NET local (porta 5080) com Swagger, ligado ao Oracle e ao CloudAMQP.
Inputs: limite de 3 em 30 segundos. Valores em Parameter values.
Outputs esperados: bloqueio na quarta chamada.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: bloqueio só na chamada 61.
```

## CT-7.1.4-01 · Validar foco criado como suspeita pelo evento de triagem

Suíte: [Dados abertos de focos] Sistema - Registrar focos a partir dos eventos sem duplicar · Tags: funcional; positivo

| fila |
| --- |
| valence.observatorio |

```
Identificador: CT-7.1.4-01
Objetivo: verificar a criação do foco pelo evento.
PBI e critério de aceite: [Dados abertos de focos] Sistema - Registrar focos a partir dos eventos sem duplicar; critério "o Observatório consome a fila valence.observatorio com as routing keys ocorrencia.triada e laudo.emitido; evento ocorrencia.triada cria o foco com status SUSPEITA".
Técnica: partição de equivalência, classe válida.
Preparação: ambiente integrado no ar; produtor.teste01 com o Sítio Boa Vista.
Ambiente: API Java e Observatório .NET no Azure, painel do CloudAMQP, Swagger das duas APIs e app Valence no Android.
Inputs: ocorrência triada. Valores em Parameter values.
Outputs esperados: foco SUSPEITA no Observatório.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: foco ausente ou com outro status.
```

## CT-7.1.4-02 · Validar mudança do foco para confirmado e descartado pelo laudo

Suíte: [Dados abertos de focos] Sistema - Registrar focos a partir dos eventos sem duplicar · Tags: funcional; positivo

| decisao1 | decisao2 |
| --- | --- |
| CONFIRMADA | DESCARTADA |

```
Identificador: CT-7.1.4-02
Objetivo: verificar a atualização do foco pelo laudo.
PBI e critério de aceite: [Dados abertos de focos] Sistema - Registrar focos a partir dos eventos sem duplicar; critério "evento laudo.emitido com CONFIRMADA ou DESCARTADA muda o foco para CONFIRMADO ou DESCARTADO".
Técnica: transição de estado (SUSPEITA para CONFIRMADO e para DESCARTADO).
Preparação: caso CT-7.1.4-01 executado; outra ocorrência TRIADA.
Ambiente: API Java e Observatório .NET no Azure, painel do CloudAMQP, Swagger das duas APIs e app Valence no Android.
Inputs: laudos CONFIRMADA e DESCARTADA. Valores em Parameter values.
Outputs esperados: focos CONFIRMADO e DESCARTADO.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: foco sem mudança.
```

## CT-7.1.4-03 · Validar foco criado pelo laudo quando não houve triagem

Suíte: [Dados abertos de focos] Sistema - Registrar focos a partir dos eventos sem duplicar · Tags: funcional; positivo

| decisao |
| --- |
| CONFIRMADA |

```
Identificador: CT-7.1.4-03
Objetivo: verificar a criação do foco quando o laudo chega antes da triagem.
PBI e critério de aceite: [Dados abertos de focos] Sistema - Registrar focos a partir dos eventos sem duplicar; critério "evento laudo.emitido cria o foco quando a ocorrência não passou pela triagem".
Técnica: tabela de decisão (laudo sem foco anterior).
Preparação: ambiente integrado no ar.
Ambiente: API Java e Observatório .NET no Azure, painel do CloudAMQP, Swagger das duas APIs e app Valence no Android.
Inputs: laudo de ocorrência sem triagem. Valores em Parameter values.
Outputs esperados: foco CONFIRMADO criado.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: nenhum foco criado.
```

## CT-7.1.4-04 · Validar que mais informações não muda o status do foco

Suíte: [Dados abertos de focos] Sistema - Registrar focos a partir dos eventos sem duplicar · Tags: funcional; negativo

| decisao |
| --- |
| MAIS_INFORMACOES |

```
Identificador: CT-7.1.4-04
Objetivo: verificar que o pedido de informações não altera o foco.
PBI e critério de aceite: [Dados abertos de focos] Sistema - Registrar focos a partir dos eventos sem duplicar; critério "evento laudo.emitido com MAIS_INFORMACOES não muda o status do foco".
Técnica: tabela de decisão por tipo de laudo.
Preparação: ocorrência TRIADA com foco SUSPEITA.
Ambiente: API Java e Observatório .NET no Azure, painel do CloudAMQP, Swagger das duas APIs e app Valence no Android.
Inputs: laudo MAIS_INFORMACOES. Valores em Parameter values.
Outputs esperados: foco sem mudança.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: foco CONFIRMADO ou DESCARTADO.
```

## CT-7.1.4-05 · Validar evento repetido sem duplicar foco

Suíte: [Dados abertos de focos] Sistema - Registrar focos a partir dos eventos sem duplicar · Tags: funcional; negativo

| eventoId |
| --- |
| 5e4d3c2b-1a09-4f8e-9d7c-6b5a4f3e2d1c |

```
Identificador: CT-7.1.4-05
Objetivo: verificar a idempotência do consumidor do Observatório.
PBI e critério de aceite: [Dados abertos de focos] Sistema - Registrar focos a partir dos eventos sem duplicar; critério "evento repetido é descartado pelo eventoId, e existe no máximo 1 foco por ocorrência".
Técnica: partição de equivalência, classe inválida (mensagem repetida).
Preparação: acesso ao painel do CloudAMQP; corpo conforme a seção 8 do contrato, sem dados pessoais.
Ambiente: API Java e Observatório .NET no Azure, painel do CloudAMQP, Swagger das duas APIs e app Valence no Android.
Inputs: mesma mensagem duas vezes e mesma ocorrência com outro eventoId. Valores em Parameter values.
Outputs esperados: um foco só.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: foco duplicado.
```

## CT-7.1.4-06 · Validar rejeição de mensagem inválida sem reenvio

Suíte: [Dados abertos de focos] Sistema - Registrar focos a partir dos eventos sem duplicar · Tags: funcional; negativo

| corpo |
| --- |
| texto qualquer que não é JSON |

```
Identificador: CT-7.1.4-06
Objetivo: verificar o tratamento de mensagem inválida.
PBI e critério de aceite: [Dados abertos de focos] Sistema - Registrar focos a partir dos eventos sem duplicar; critério "mensagem inválida é rejeitada sem reenvio e registrada no log sem dados pessoais".
Técnica: partição de equivalência, classe inválida (mensagem malformada).
Preparação: acesso ao CloudAMQP e ao Log stream do App Service.
Ambiente: API Java e Observatório .NET no Azure, painel do CloudAMQP, Swagger das duas APIs e app Valence no Android.
Inputs: mensagem que não é JSON. Valores em Parameter values.
Outputs esperados: rejeição registrada e nenhum foco.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: mensagem reenfileirada sem fim ou dado pessoal no log.
```

## CT-7.1.4-07 · Validar processamento dos eventos que aguardaram com o Observatório desligado

Suíte: [Dados abertos de focos] Sistema - Registrar focos a partir dos eventos sem duplicar · Tags: funcional; positivo

| fila |
| --- |
| valence.observatorio |

```
Identificador: CT-7.1.4-07
Objetivo: verificar a durabilidade da fila.
PBI e critério de aceite: [Dados abertos de focos] Sistema - Registrar focos a partir dos eventos sem duplicar; critério "com o Observatório desligado, os eventos aguardam na fila e são processados quando ele volta".
Técnica: transição de estado (consumidor parado e religado).
Preparação: permissão para parar e iniciar o App Service do Observatório.
Ambiente: API Java e Observatório .NET no Azure, painel do CloudAMQP, Swagger das duas APIs e app Valence no Android.
Inputs: evento publicado com o consumidor parado. Valores em Parameter values.
Outputs esperados: evento processado ao religar.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: evento perdido.
```

## CT-7.1.4-08 · Validar health check com o RabbitMQ fora do ar

Suíte: [Dados abertos de focos] Sistema - Registrar focos a partir dos eventos sem duplicar · Tags: funcional; negativo

| uri |
| --- |
| amqps://host-inexistente.invalid |

```
Identificador: CT-7.1.4-08
Objetivo: verificar o health check com o broker indisponível.
PBI e critério de aceite: [Dados abertos de focos] Sistema - Registrar focos a partir dos eventos sem duplicar; critério "o health check mostra o RabbitMQ como Degraded quando o broker está fora do ar, com HTTP 200".
Técnica: partição de equivalência por disponibilidade de dependência.
Preparação: Observatório local com a URI do broker inválida; voltar ao valor certo no final.
Ambiente: Observatório .NET local (porta 5080) com Swagger, ligado ao Oracle e ao CloudAMQP.
Inputs: broker inacessível. Valores em Parameter values.
Outputs esperados: RabbitMQ Degraded e HTTP 200.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 503 ou erro no health check.
```

## CT-7.2.1-01 · Validar login do gestor no Observatório

Suíte: [Boletins do gestor] Gestor - Entrar no Observatório · Tags: funcional; positivo

| gestor | minutos |
| --- | --- |
| gestor de teste do README do valence-dotnet | 120 |

```
Identificador: CT-7.2.1-01
Objetivo: verificar o login no Observatório.
PBI e critério de aceite: [Boletins do gestor] Gestor - Entrar no Observatório; critério "login com e-mail e senha corretos recebe HTTP 200 com token, tipo Bearer, data de expiração em UTC e papel; o token vale 120 minutos".
Técnica: partição de equivalência, classe válida.
Preparação: Observatório no ar; gestor de teste do README do valence-dotnet; Swagger autorizado com o token do gestor (POST /api/auth/login).
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: credenciais corretas do gestor. Valores em Parameter values.
Outputs esperados: token válido por 120 minutos.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP diferente de 200 ou expiração diferente de 120 minutos.
```

## CT-7.2.1-02 · Validar consulta do usuário logado no Observatório

Suíte: [Boletins do gestor] Gestor - Entrar no Observatório · Tags: funcional; positivo

| gestor |
| --- |
| gestor de teste do README do valence-dotnet |

```
Identificador: CT-7.2.1-02
Objetivo: verificar o endpoint do usuário logado.
PBI e critério de aceite: [Boletins do gestor] Gestor - Entrar no Observatório; critério "a consulta do usuário logado (/api/auth/me) devolve id, papel e expiração".
Técnica: partição de equivalência, classe válida.
Preparação: Observatório no ar; gestor de teste do README do valence-dotnet; Swagger autorizado com o token do gestor (POST /api/auth/login).
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: token válido. Valores em Parameter values.
Outputs esperados: dados do usuário logado.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 401 com token válido ou campo ausente.
```

## CT-7.2.1-03 · Validar login com e-mail inexistente e senha errada

Suíte: [Boletins do gestor] Gestor - Entrar no Observatório · Tags: funcional; negativo

| email | senha |
| --- | --- |
| nao.existe@valence.dev | SenhaErrada@1 |

```
Identificador: CT-7.2.1-03
Objetivo: verificar que o login não revela se o e-mail existe.
PBI e critério de aceite: [Boletins do gestor] Gestor - Entrar no Observatório; critério "e-mail inexistente ou senha errada recebe HTTP 401 com a mesma mensagem E-mail ou senha inválidos.".
Técnica: partição de equivalência, classes inválidas.
Preparação: Observatório no ar; gestor de teste do README do valence-dotnet; Swagger autorizado com o token do gestor (POST /api/auth/login).
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: e-mail inexistente e senha errada. Valores em Parameter values.
Outputs esperados: HTTP 401 com a mesma mensagem.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: mensagens diferentes ou HTTP 200.
```

## CT-7.2.1-04 · Validar login com campos em branco e acima do limite

Suíte: [Boletins do gestor] Gestor - Entrar no Observatório · Tags: funcional; negativo

| tamEmail | tamSenha |
| --- | --- |
| 151 | 101 |

```
Identificador: CT-7.2.1-04
Objetivo: verificar a validação do login.
PBI e critério de aceite: [Boletins do gestor] Gestor - Entrar no Observatório; critério "e-mail ou senha em branco, e-mail com mais de 150 caracteres ou senha com mais de 100 recebe HTTP 400 com a lista de campos".
Técnica: análise de valor limite (151 e 101) e partição de equivalência (em branco).
Preparação: Observatório no ar; gestor de teste do README do valence-dotnet; Swagger autorizado com o token do gestor (POST /api/auth/login). Textos de 151 e 101 caracteres preparados.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: campos em branco e acima do limite. Valores em Parameter values.
Outputs esperados: HTTP 400 com os campos.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 401 ou 500.
```

## CT-7.2.1-05 · Validar usuário logado sem token, com token inválido e com token da API Java

Suíte: [Boletins do gestor] Gestor - Entrar no Observatório · Tags: funcional; negativo

| token |
| --- |
| abc.def.ghi |

```
Identificador: CT-7.2.1-05
Objetivo: verificar que só o token do Observatório é aceito.
PBI e critério de aceite: [Boletins do gestor] Gestor - Entrar no Observatório; critério "sem token ou com token inválido recebe HTTP 401 com o cabeçalho WWW-Authenticate: Bearer; o token é emitido pelo próprio Observatório e o token da API Java não é aceito".
Técnica: partição de equivalência, classes inválidas.
Preparação: Observatório no ar; gestor de teste do README do valence-dotnet; Swagger autorizado com o token do gestor (POST /api/auth/login). Usuário da API Java para gerar o token dela.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: sem token, token malformado e token da API Java. Valores em Parameter values.
Outputs esperados: HTTP 401 nos três.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: token da API Java aceito.
```

## CT-7.2.1-06 · Validar limite de tentativas de login por minuto

Suíte: [Boletins do gestor] Gestor - Entrar no Observatório · Tags: funcional; negativo

| vezes |
| --- |
| 5 |

```
Identificador: CT-7.2.1-06
Objetivo: verificar a proteção contra força bruta.
PBI e critério de aceite: [Boletins do gestor] Gestor - Entrar no Observatório; critério "mais de 5 tentativas de login por minuto do mesmo IP recebe HTTP 429 com o cabeçalho Retry-After".
Técnica: análise de valor limite (5 e 6 tentativas).
Preparação: Observatório no ar; gestor de teste do README do valence-dotnet; Swagger autorizado com o token do gestor (POST /api/auth/login).
Ambiente: Swagger do Observatório .NET no Azure e PowerShell para repetir requisições.
Inputs: 6 tentativas em menos de 1 minuto. Valores em Parameter values.
Outputs esperados: HTTP 429 na sexta.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: sexta tentativa processada.
```

## CT-7.2.1-07 · Validar que as credenciais de teste não aparecem no Swagger

Suíte: [Boletins do gestor] Gestor - Entrar no Observatório · Tags: funcional; negativo

| procura |
| --- |
| senha, password, e-mail do gestor de teste |

```
Identificador: CT-7.2.1-07
Objetivo: verificar que as credenciais de teste ficam só no README.
PBI e critério de aceite: [Boletins do gestor] Gestor - Entrar no Observatório; critério "as credenciais de teste do gestor e do agrônomo ficam apenas no README do repositório valence-dotnet".
Técnica: partição de equivalência, classe inválida (credencial exposta).
Preparação: acesso ao Swagger e ao repositório valence-dotnet.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: Swagger, health e README. Valores em Parameter values.
Outputs esperados: credenciais só no README.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: credencial real no Swagger ou no health.
```

## CT-7.2.2-01 · Validar publicação de boletim pelo gestor

Suíte: [Boletins do gestor] Gestor - Publicar boletim sem duplicar · Tags: funcional; positivo

| chave | municipio | uf |
| --- | --- | --- |
| 2f1e0d9c-8b7a-4c6d-9e5f-4a3b2c1d0e9f | ribeirao preto | sp |

```
Identificador: CT-7.2.2-01
Objetivo: verificar a publicação e a normalização pelo IBGE.
PBI e critério de aceite: [Boletins do gestor] Gestor - Publicar boletim sem duplicar; critério "publicação com sucesso recebe HTTP 201 com o cabeçalho Location e o boletim com id, município, UF, título, texto, data de criação e links; município gravado com o nome oficial e a UF em maiúsculas".
Técnica: partição de equivalência, classe válida.
Preparação: Observatório no ar; gestor de teste do README do valence-dotnet; Swagger autorizado com o token do gestor (POST /api/auth/login).
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: boletim válido com município em minúsculas. Valores em Parameter values.
Outputs esperados: boletim criado com nome oficial e UF maiúscula.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP diferente de 201, Location ausente ou município sem normalizar.
```

## CT-7.2.2-02 · Validar repetição com a mesma chave e o mesmo corpo

Suíte: [Boletins do gestor] Gestor - Publicar boletim sem duplicar · Tags: funcional; positivo

| chave |
| --- |
| 2f1e0d9c-8b7a-4c6d-9e5f-4a3b2c1d0e9f |

```
Identificador: CT-7.2.2-02
Objetivo: verificar a idempotência da publicação.
PBI e critério de aceite: [Boletins do gestor] Gestor - Publicar boletim sem duplicar; critério "repetição com a mesma Idempotency-Key e o mesmo corpo devolve a resposta original com o mesmo Location e o cabeçalho Idempotency-Replayed: true, sem criar outro boletim".
Técnica: partição de equivalência (requisição repetida).
Preparação: caso CT-7.2.2-01 executado.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: mesma chave e mesmo corpo. Valores em Parameter values.
Outputs esperados: resposta original sem novo boletim.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: segundo boletim criado ou cabeçalho ausente.
```

## CT-7.2.2-03 · Validar mesma chave com corpo diferente

Suíte: [Boletins do gestor] Gestor - Publicar boletim sem duplicar · Tags: funcional; negativo

| chave | titulo |
| --- | --- |
| 2f1e0d9c-8b7a-4c6d-9e5f-4a3b2c1d0e9f | Alerta de ferrugem |

```
Identificador: CT-7.2.2-03
Objetivo: verificar o conflito de chave.
PBI e critério de aceite: [Boletins do gestor] Gestor - Publicar boletim sem duplicar; critério "mesma Idempotency-Key com corpo diferente recebe HTTP 409".
Técnica: partição de equivalência, classe inválida.
Preparação: caso CT-7.2.2-01 executado.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: chave repetida com corpo diferente. Valores em Parameter values.
Outputs esperados: HTTP 409.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: boletim criado ou resposta original devolvida.
```

## CT-7.2.2-04 · Validar publicação sem Idempotency-Key e com chave fora do formato

Suíte: [Boletins do gestor] Gestor - Publicar boletim sem duplicar · Tags: funcional; negativo

| chave |
| --- |
| chave-123 |

```
Identificador: CT-7.2.2-04
Objetivo: verificar a obrigatoriedade da chave.
PBI e critério de aceite: [Boletins do gestor] Gestor - Publicar boletim sem duplicar; critério "publicação exige o cabeçalho Idempotency-Key no formato UUID; ausente ou fora do formato recebe HTTP 400".
Técnica: partição de equivalência, classes inválidas.
Preparação: Observatório no ar; gestor de teste do README do valence-dotnet; Swagger autorizado com o token do gestor (POST /api/auth/login).
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: chave ausente e fora do formato. Valores em Parameter values.
Outputs esperados: HTTP 400 nos dois.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: boletim criado.
```

## CT-7.2.2-05 · Validar publicação de boletim por agrônomo e sem token

Suíte: [Boletins do gestor] Gestor - Publicar boletim sem duplicar · Tags: funcional; negativo

| agronomo |
| --- |
| agrônomo de teste do README do valence-dotnet |

```
Identificador: CT-7.2.2-05
Objetivo: verificar que só o gestor publica.
PBI e critério de aceite: [Boletins do gestor] Gestor - Publicar boletim sem duplicar; critério "somente o papel GESTOR publica; AGRONOMO recebe HTTP 403 e requisição sem token recebe HTTP 401".
Técnica: tabela de decisão por papel.
Preparação: Observatório no ar; gestor de teste do README do valence-dotnet; Swagger autorizado com o token do gestor (POST /api/auth/login). Token do agrônomo do Observatório.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: publicação como agrônomo e sem token. Valores em Parameter values.
Outputs esperados: HTTP 403 e 401.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: boletim criado.
```

## CT-7.2.2-06 · Validar boletim com município, título e texto no limite

Suíte: [Boletins do gestor] Gestor - Publicar boletim sem duplicar · Tags: funcional; positivo

| titulo | texto |
| --- | --- |
| 150 | 4000 |

```
Identificador: CT-7.2.2-06
Objetivo: verificar os limites válidos do boletim.
PBI e critério de aceite: [Boletins do gestor] Gestor - Publicar boletim sem duplicar; critério "boletim exige município (até 100 caracteres), UF, título (até 150) e texto (até 4000)".
Técnica: análise de valor limite (150 e 4000).
Preparação: Observatório no ar; gestor de teste do README do valence-dotnet; Swagger autorizado com o token do gestor (POST /api/auth/login). Textos de 150 e 4000 caracteres preparados.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: título e texto no limite. Valores em Parameter values.
Outputs esperados: HTTP 201.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 400 em valor válido.
```

## CT-7.2.2-07 · Validar boletim com campo ausente ou acima do limite

Suíte: [Boletins do gestor] Gestor - Publicar boletim sem duplicar · Tags: funcional; negativo

| municipio | titulo | texto |
| --- | --- | --- |
| 101 | 151 | 4001 |

```
Identificador: CT-7.2.2-07
Objetivo: verificar a validação dos campos do boletim.
PBI e critério de aceite: [Boletins do gestor] Gestor - Publicar boletim sem duplicar; critério "campo ausente ou acima do limite recebe HTTP 400 com a lista de campos".
Técnica: análise de valor limite (101, 151 e 4001) e partição de equivalência (ausente).
Preparação: Observatório no ar; gestor de teste do README do valence-dotnet; Swagger autorizado com o token do gestor (POST /api/auth/login). Textos acima do limite preparados.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: um campo inválido por chamada. Valores em Parameter values.
Outputs esperados: HTTP 400 com o campo.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: boletim criado com dado inválido.
```

## CT-7.2.2-08 · Validar município inexistente na UF e IBGE fora do ar

Suíte: [Boletins do gestor] Gestor - Publicar boletim sem duplicar · Tags: funcional; negativo

| municipio | url |
| --- | --- |
| Cidade Inventada | https://ibge-inexistente.invalid/ |

```
Identificador: CT-7.2.2-08
Objetivo: verificar a validação de município pelo IBGE.
PBI e critério de aceite: [Boletins do gestor] Gestor - Publicar boletim sem duplicar; critério "município inexistente na UF recebe HTTP 422 e IBGE fora do ar recebe HTTP 503".
Técnica: partição de equivalência, classe inválida e indisponibilidade de dependência.
Preparação: Observatório no ar; gestor de teste do README do valence-dotnet; Swagger autorizado com o token do gestor (POST /api/auth/login). Observatório local para o passo 2; voltar a URL certa ao final.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome. Observatório local para o passo 2.
Inputs: município inventado e IBGE inacessível. Valores em Parameter values.
Outputs esperados: HTTP 422 e HTTP 503.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: boletim criado com município inválido ou erro 500.
```

## CT-7.2.2-09 · Validar boletim com dados pessoais no título ou no texto

Suíte: [Boletins do gestor] Gestor - Publicar boletim sem duplicar · Tags: funcional; negativo

| texto | titulo |
| --- | --- |
| Dúvidas, ligar para 16 99999-0000 | Contato gestor.teste@valence.dev |

```
Identificador: CT-7.2.2-09
Objetivo: verificar o bloqueio de dados pessoais nos boletins.
PBI e critério de aceite: [Boletins do gestor] Gestor - Publicar boletim sem duplicar; critério "título ou texto com e-mail, telefone ou CPF recebe HTTP 422".
Técnica: partição de equivalência, classe inválida (dado pessoal).
Preparação: Observatório no ar; gestor de teste do README do valence-dotnet; Swagger autorizado com o token do gestor (POST /api/auth/login).
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: telefone no texto e e-mail no título. Valores em Parameter values.
Outputs esperados: HTTP 422 nos dois.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: boletim publicado com dado pessoal.
```

## CT-7.2.2-10 · Validar limite de escritas do gestor por minuto

Suíte: [Boletins do gestor] Gestor - Publicar boletim sem duplicar · Tags: funcional; negativo

| vezes |
| --- |
| 20 |

```
Identificador: CT-7.2.2-10
Objetivo: verificar o limite de escrita.
PBI e critério de aceite: [Boletins do gestor] Gestor - Publicar boletim sem duplicar; critério "mais de 20 publicações, edições ou remoções por minuto do mesmo gestor recebe HTTP 429 com o cabeçalho Retry-After".
Técnica: análise de valor limite (20 e 21).
Preparação: Observatório no ar; gestor de teste do README do valence-dotnet; Swagger autorizado com o token do gestor (POST /api/auth/login). Laço do PowerShell com o token do gestor; remover os boletins de teste depois.
Ambiente: Swagger do Observatório .NET no Azure e PowerShell para repetir requisições.
Inputs: 21 escritas em menos de 1 minuto. Valores em Parameter values.
Outputs esperados: HTTP 429 na 21.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: escrita 21 aceita.
```

## CT-7.2.3-01 · Validar edição do boletim pelo gestor autor

Suíte: [Boletins do gestor] Gestor - Editar e remover meu boletim · Tags: funcional; positivo

| titulo |
| --- |
| Alerta de cigarrinha atualizado |

```
Identificador: CT-7.2.3-01
Objetivo: verificar a edição do boletim.
PBI e critério de aceite: [Boletins do gestor] Gestor - Editar e remover meu boletim; critério "edição recebe HTTP 200 com o boletim atualizado e a data de atualização".
Técnica: partição de equivalência, classe válida.
Preparação: caso CT-7.2.2-01 executado.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: novo título. Valores em Parameter values.
Outputs esperados: boletim atualizado.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: edição recusada ou atualizadoEm nulo.
```

## CT-7.2.3-02 · Validar edição de boletim com dados inválidos

Suíte: [Boletins do gestor] Gestor - Editar e remover meu boletim · Tags: funcional; negativo

| titulo | municipio | texto |
| --- | --- | --- |
| 151 | Cidade Inventada | Falar no 16 99999-0000 |

```
Identificador: CT-7.2.3-02
Objetivo: verificar que a edição segue as regras da publicação.
PBI e critério de aceite: [Boletins do gestor] Gestor - Editar e remover meu boletim; critério "edição aceita as mesmas regras de campos, IBGE e dados pessoais da publicação".
Técnica: partição de equivalência e análise de valor limite.
Preparação: caso CT-7.2.2-01 executado.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: título longo, município inventado e telefone no texto. Valores em Parameter values.
Outputs esperados: HTTP 400, 422 e 422.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: boletim salvo com dado inválido.
```

## CT-7.2.3-03 · Validar remoção do boletim pelo gestor autor

Suíte: [Boletins do gestor] Gestor - Editar e remover meu boletim · Tags: funcional; positivo

| uf |
| --- |
| SP |

```
Identificador: CT-7.2.3-03
Objetivo: verificar a remoção do boletim.
PBI e critério de aceite: [Boletins do gestor] Gestor - Editar e remover meu boletim; critério "remoção recebe HTTP 204 e o boletim deixa de aparecer na consulta pública".
Técnica: transição de estado (publicado para removido).
Preparação: boletim do gestor publicado.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: remoção pelo autor. Valores em Parameter values.
Outputs esperados: boletim fora da consulta pública.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: boletim ainda visível.
```

## CT-7.2.3-04 · Validar edição e remoção por outro gestor e por agrônomo

Suíte: [Boletins do gestor] Gestor - Editar e remover meu boletim · Tags: funcional; negativo

| outroGestor | agronomo |
| --- | --- |
| segundo gestor de teste do README do valence-dotnet | agrônomo de teste do README do valence-dotnet |

```
Identificador: CT-7.2.3-04
Objetivo: verificar que só o autor altera o boletim.
PBI e critério de aceite: [Boletins do gestor] Gestor - Editar e remover meu boletim; critério "somente o gestor autor edita ou remove; outro gestor recebe HTTP 403 e AGRONOMO recebe HTTP 403".
Técnica: tabela de decisão por papel e autor.
Preparação: Observatório no ar; gestor de teste do README do valence-dotnet; Swagger autorizado com o token do gestor (POST /api/auth/login). Segundo gestor e agrônomo de teste no Observatório.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: PUT e DELETE por outro gestor e por agrônomo. Valores em Parameter values.
Outputs esperados: HTTP 403 em todos.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: boletim alterado por quem não é autor.
Notas: se o README tiver só um gestor, pedir ao Guilherme um segundo gestor de teste antes da execução.
```

## CT-7.2.3-05 · Validar edição e remoção de boletim inexistente

Suíte: [Boletins do gestor] Gestor - Editar e remover meu boletim · Tags: funcional; negativo

| inexistente |
| --- |
| 999999 |

```
Identificador: CT-7.2.3-05
Objetivo: verificar o tratamento de boletim inexistente.
PBI e critério de aceite: [Boletins do gestor] Gestor - Editar e remover meu boletim; critério "boletim inexistente recebe HTTP 404 ao editar ou remover".
Técnica: partição de equivalência, classe inválida.
Preparação: Observatório no ar; gestor de teste do README do valence-dotnet; Swagger autorizado com o token do gestor (POST /api/auth/login).
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: id inexistente. Valores em Parameter values.
Outputs esperados: HTTP 404 nos dois.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 200, 204 ou 500.
```

## CT-7.2.3-06 · Validar edição e remoção sem token e com token expirado

Suíte: [Boletins do gestor] Gestor - Editar e remover meu boletim · Tags: funcional; negativo

| token |
| --- |
| token do gestor emitido há mais de 120 minutos |

```
Identificador: CT-7.2.3-06
Objetivo: verificar a autenticação na edição e remoção.
PBI e critério de aceite: [Boletins do gestor] Gestor - Editar e remover meu boletim; critério "requisição sem token ou com token expirado recebe HTTP 401".
Técnica: partição de equivalência (sem token e token expirado).
Preparação: Observatório no ar; gestor de teste do README do valence-dotnet; Swagger autorizado com o token do gestor (POST /api/auth/login). Token antigo guardado, ou Observatório local com Jwt__ExpiracaoMinutos=1.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: sem token e token expirado. Valores em Parameter values.
Outputs esperados: HTTP 401.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: boletim alterado sem autenticação válida.
```

## CT-7.2.4-01 · Validar consulta pública da lista de boletins

Suíte: [Boletins do gestor] Cidadão - Consultar boletins publicados · Tags: funcional; positivo

| registros |
| --- |
| 10 |

```
Identificador: CT-7.2.4-01
Objetivo: verificar a lista pública de boletins.
PBI e critério de aceite: [Boletins do gestor] Cidadão - Consultar boletins publicados; critério "consulta da lista de boletins sem login; lista paginada por deslocamento e registroRetornado (de 1 a 100), com total de registros e links HATEOAS".
Técnica: partição de equivalência, classe válida.
Preparação: Observatório no ar com focos de MILHO em Ribeirão Preto/SP gerados nos Epics 3 a 5; nenhum login no Swagger. Pelo menos 2 boletins publicados.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: lista com paginação e filtros. Valores em Parameter values.
Outputs esperados: lista paginada e filtrada.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 401 ou links ausentes.
```

## CT-7.2.4-02 · Validar detalhe público de boletim

Suíte: [Boletins do gestor] Cidadão - Consultar boletins publicados · Tags: funcional; positivo

| sufixo |
| --- |
| Z |

```
Identificador: CT-7.2.4-02
Objetivo: verificar o detalhe do boletim.
PBI e critério de aceite: [Boletins do gestor] Cidadão - Consultar boletins publicados; critério "consulta do detalhe sem login; detalhe mostra id, município, UF, título, texto, data de criação, data de atualização e links; datas em UTC no formato ISO-8601".
Técnica: partição de equivalência, classe válida.
Preparação: Observatório no ar com focos de MILHO em Ribeirão Preto/SP gerados nos Epics 3 a 5; nenhum login no Swagger. Boletim publicado.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: id de boletim existente. Valores em Parameter values.
Outputs esperados: detalhe completo.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: campo ausente ou data fora de UTC.
```

## CT-7.2.4-03 · Validar lista de boletins vazia

Suíte: [Boletins do gestor] Cidadão - Consultar boletins publicados · Tags: funcional; positivo

| uf |
| --- |
| AC |

```
Identificador: CT-7.2.4-03
Objetivo: verificar a resposta sem boletins.
PBI e critério de aceite: [Boletins do gestor] Cidadão - Consultar boletins publicados; critério "lista sem boletins recebe HTTP 204 sem corpo".
Técnica: partição de equivalência (lista vazia).
Preparação: Observatório no ar com focos de MILHO em Ribeirão Preto/SP gerados nos Epics 3 a 5; nenhum login no Swagger. Nenhum boletim do Acre.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: filtro sem boletins. Valores em Parameter values.
Outputs esperados: HTTP 204.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 200 com lista vazia.
```

## CT-7.2.4-04 · Validar boletim inexistente e removido

Suíte: [Boletins do gestor] Cidadão - Consultar boletins publicados · Tags: funcional; negativo

| inexistente |
| --- |
| 999999 |

```
Identificador: CT-7.2.4-04
Objetivo: verificar o detalhe de boletim indisponível.
PBI e critério de aceite: [Boletins do gestor] Cidadão - Consultar boletins publicados; critério "boletim inexistente ou removido recebe HTTP 404".
Técnica: partição de equivalência, classes inválidas.
Preparação: caso CT-7.2.3-03 executado.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: id inexistente e id removido. Valores em Parameter values.
Outputs esperados: HTTP 404 nos dois.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: boletim removido devolvido.
```

## CT-7.2.4-05 · Validar paginação de boletins fora da faixa

Suíte: [Boletins do gestor] Cidadão - Consultar boletins publicados · Tags: funcional; negativo

| maximo |
| --- |
| 101 |

```
Identificador: CT-7.2.4-05
Objetivo: verificar a validação da paginação.
PBI e critério de aceite: [Boletins do gestor] Cidadão - Consultar boletins publicados; critério "lista paginada por deslocamento e registroRetornado (de 1 a 100)".
Técnica: análise de valor limite (0, 101 e -1).
Preparação: Observatório no ar com focos de MILHO em Ribeirão Preto/SP gerados nos Epics 3 a 5; nenhum login no Swagger.
Ambiente: Swagger do Observatório .NET publicado no Azure App Service (/swagger), navegador Chrome.
Inputs: paginação fora da faixa. Valores em Parameter values.
Outputs esperados: HTTP 400 nas três.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 200 ou 500.
```

## CT-7.2.4-06 · Validar limite de requisições na consulta de boletins

Suíte: [Boletins do gestor] Cidadão - Consultar boletins publicados · Tags: funcional; negativo

| vezes |
| --- |
| 60 |

```
Identificador: CT-7.2.4-06
Objetivo: verificar o limite na consulta de boletins.
PBI e critério de aceite: [Boletins do gestor] Cidadão - Consultar boletins publicados; critério "mais de 60 requisições por minuto do mesmo IP recebe HTTP 429 com o cabeçalho Retry-After".
Técnica: análise de valor limite (60 e 61).
Preparação: Observatório no ar com focos de MILHO em Ribeirão Preto/SP gerados nos Epics 3 a 5; nenhum login no Swagger.
Ambiente: Swagger do Observatório .NET no Azure e PowerShell para repetir requisições.
Inputs: 61 consultas em menos de 1 minuto. Valores em Parameter values.
Outputs esperados: HTTP 429 na 61.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: chamada 61 aceita.
```

