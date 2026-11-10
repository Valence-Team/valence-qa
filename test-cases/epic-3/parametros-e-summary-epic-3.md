# Feature epic.3 - Parameter values e Summary

## CT-3.1.1-01 · Validar triagem com hipóteses e severidade a partir de foto válida

Suíte: [Triagem por IA] Produtor - Receber hipóteses de praga e severidade · Tags: funcional; positivo

| email | senha | cultura | descricao | foto |
| --- | --- | --- | --- | --- |
| produtor.teste01@valence.dev | Senha@2026 | MILHO | Pústulas alaranjadas nas folhas do talhão norte | milho-folha-ferrugem.jpg (JPEG nítido, folha inteira, cerca de 2 MB) |

```
Identificador: CT-3.1.1-01
Objetivo: verificar que a foto válida gera triagem com hipóteses de praga e severidade.
PBI e critério de aceite: [Triagem por IA] Produtor - Receber hipóteses de praga e severidade; critério "confiança igual ou maior que 0,6 muda a ocorrência de RECEBIDA para TRIADA; o app mostra a praga provável, a severidade e a explicação no detalhe da ocorrência, com o aviso Resultado de triagem automática, sujeito à confirmação do agrônomo".
Técnica: partição de equivalência, classe válida (foto nítida da cultura informada).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista (MILHO e TOMATE); API Java e serviço de IA rodando localmente com IA_CONFIANCA_MINIMA=0.6; chave do LLM válida no .env local; Swagger autorizado com o token do produtor.
Ambiente: API Java local (porta 8080) com o serviço de IA local (porta 8000), Swagger da API local e app Valence no Android apontando para a API local.
Inputs: ocorrência de MILHO com foto nítida de ferrugem. Valores em Parameter values.
Outputs esperados: status TRIADA, hipóteses, severidade e aviso de triagem automática.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: triagem ausente, severidade fora de 1 a 5, mais de 3 hipóteses ou aviso de triagem automática ausente.
Notas: o serviço de IA roda só localmente; a API publicada no Azure não chega nele e usa a triagem só pelo texto.
```

## CT-3.1.1-02 · Validar os campos da triagem na API dentro dos limites

Suíte: [Triagem por IA] Produtor - Receber hipóteses de praga e severidade · Tags: funcional; positivo

| limite |
| --- |
| 0.6 |

```
Identificador: CT-3.1.1-02
Objetivo: verificar o formato e os limites dos campos da triagem devolvidos pela API.
PBI e critério de aceite: [Triagem por IA] Produtor - Receber hipóteses de praga e severidade; critério "triagem traz até 3 hipóteses de praga com probabilidade de 0 a 1, confiança e severidade de 1 a 5; resposta com severidade fora de 1 a 5 ou probabilidade fora de 0 a 1 não é gravada como triagem válida".
Técnica: análise de valor limite (severidade 1 e 5, probabilidade 0 e 1, confiança 0.6).
Preparação: caso CT-3.1.1-01 executado; Swagger da API local autorizado com o token do produtor.
Ambiente: API Java local (porta 8080) com o serviço de IA local (porta 8000) e Swagger da API local, navegador Chrome.
Inputs: id da ocorrência triada. Valores em Parameter values.
Outputs esperados: campos da triagem dentro dos limites do contrato.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: campo ausente, valor fora do limite ou pragaProvavel diferente da primeira hipótese.
```

## CT-3.1.1-03 · Validar explicação e fontes da triagem no detalhe da ocorrência

Suíte: [Triagem por IA] Produtor - Receber hipóteses de praga e severidade · Tags: funcional; positivo

| fonte |
| --- |
| Embrapa |

```
Identificador: CT-3.1.1-03
Objetivo: verificar que a triagem mostra a explicação com as fontes consultadas.
PBI e critério de aceite: [Triagem por IA] Produtor - Receber hipóteses de praga e severidade; critério "triagem traz a explicação baseada nas fichas técnicas e as fontes consultadas (título, fonte e link)".
Técnica: partição de equivalência, classe válida.
Preparação: caso CT-3.1.1-01 executado com o LLM disponível.
Ambiente: API Java local (porta 8080) com o serviço de IA local (porta 8000), Swagger da API local e app Valence no Android apontando para a API local.
Inputs: ocorrência triada com foto. Valores em Parameter values.
Outputs esperados: explicação e fontes no app e na API.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: explicação ausente ou fontes sem título, origem e link.
```

## CT-3.1.1-04 · Validar que dados pessoais da descrição não aparecem na triagem

Suíte: [Triagem por IA] Produtor - Receber hipóteses de praga e severidade · Tags: funcional; negativo

| descricao | telefone | emailCitado |
| --- | --- | --- |
| Folhas com pústulas, me liguem no 11 98765-4321 ou contato.sitio@valence.dev | 11 98765-4321 | contato.sitio@valence.dev |

```
Identificador: CT-3.1.1-04
Objetivo: verificar o mascaramento de dados pessoais antes do uso da IA.
PBI e critério de aceite: [Triagem por IA] Produtor - Receber hipóteses de praga e severidade; critério "e-mail, telefone, CPF, CEP e coordenadas são mascarados antes de qualquer envio à IA e ao LLM".
Técnica: partição de equivalência, classe inválida (descrição com dados pessoais).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista (MILHO e TOMATE); API Java e serviço de IA rodando localmente com IA_CONFIANCA_MINIMA=0.6; chave do LLM válida no .env local; Swagger autorizado com o token do produtor.
Ambiente: API Java local (porta 8080) com o serviço de IA local (porta 8000), Swagger da API local e app Valence no Android apontando para a API local.
Inputs: descrição com telefone e e-mail fictícios. Valores em Parameter values.
Outputs esperados: triagem gerada sem o telefone e sem o e-mail.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: telefone ou e-mail repetidos em qualquer texto da triagem.
```

## CT-3.1.1-05 · Validar evento de ocorrência triada publicado sem dados pessoais

Suíte: [Triagem por IA] Produtor - Receber hipóteses de praga e severidade · Tags: funcional; positivo

| cultura | municipio |
| --- | --- |
| MILHO | Ribeirão Preto |

```
Identificador: CT-3.1.1-05
Objetivo: verificar que a ocorrência triada publica o evento ocorrencia.triada sem dados pessoais.
PBI e critério de aceite: [Triagem por IA] Produtor - Receber hipóteses de praga e severidade; critério "confiança igual ou maior que 0,6 muda a ocorrência de RECEBIDA para TRIADA e publica o evento ocorrencia.triada, sem dados pessoais".
Técnica: partição de equivalência, classe válida, com verificação pelo consumidor do evento.
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista (MILHO e TOMATE); API Java e serviço de IA rodando localmente com IA_CONFIANCA_MINIMA=0.6; chave do LLM válida no .env local; Swagger autorizado com o token do produtor. Observatório .NET publicado e consumindo a fila valence.observatorio; propriedade em Ribeirão Preto/SP.
Ambiente: API Java local com o serviço de IA local, RabbitMQ no CloudAMQP e Swagger do Observatório .NET publicado no Azure.
Inputs: ocorrência de MILHO triada com foto válida. Valores em Parameter values.
Outputs esperados: foco novo no Observatório, só com dados agregados da ocorrência.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: foco ausente depois da triagem ou qualquer dado pessoal no foco.
Notas: o município do parâmetro deve ser o mesmo da propriedade usada no teste.
```

## CT-3.1.2-01 · Validar cuidados imediatos e texto de alerta em linguagem simples

Suíte: [Triagem por IA] Produtor - Receber cuidados imediatos seguros · Tags: funcional; positivo

| limite |
| --- |
| 200 |

```
Identificador: CT-3.1.2-01
Objetivo: verificar que o produtor recebe cuidados imediatos seguros.
PBI e critério de aceite: [Triagem por IA] Produtor - Receber cuidados imediatos seguros; critério "triagem traz uma lista de cuidados imediatos em linguagem simples; texto de alerta com no máximo 200 caracteres; o app exibe os cuidados em lista no detalhe da ocorrência".
Técnica: partição de equivalência e valor limite (texto de alerta até 200 caracteres).
Preparação: caso CT-3.1.1-01 executado.
Ambiente: API Java local (porta 8080) com o serviço de IA local (porta 8000), Swagger da API local e app Valence no Android apontando para a API local.
Inputs: ocorrência triada. Valores em Parameter values.
Outputs esperados: cuidados seguros e texto de alerta dentro do limite.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: cuidado ausente, texto de alerta acima de 200 caracteres ou menção a produto ou dose.
```

## CT-3.1.2-02 · Validar que a triagem não recomenda produto ou dose quando o produtor pede

Suíte: [Triagem por IA] Produtor - Receber cuidados imediatos seguros · Tags: funcional; negativo

| descricao | foto |
| --- | --- |
| Manchas escuras nas folhas, qual veneno e quantos ml por litro devo aplicar | tomate-requeima.jpg (JPEG nítido, cerca de 2 MB) |

```
Identificador: CT-3.1.2-02
Objetivo: verificar o filtro de segurança dos cuidados imediatos.
PBI e critério de aceite: [Triagem por IA] Produtor - Receber cuidados imediatos seguros; critério "cuidado imediato que cita agrotóxico, nome de produto ou dose é descartado antes de salvar; texto de alerta que cita agrotóxico, produto ou dose é trocado por um texto padrão antes de salvar".
Técnica: partição de equivalência, classe inválida (pedido explícito de dose).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista (MILHO e TOMATE); API Java e serviço de IA rodando localmente com IA_CONFIANCA_MINIMA=0.6; chave do LLM válida no .env local; Swagger autorizado com o token do produtor.
Ambiente: API Java local (porta 8080) com o serviço de IA local (porta 8000), Swagger da API local e app Valence no Android apontando para a API local.
Inputs: descrição pedindo produto e dose. Valores em Parameter values.
Outputs esperados: cuidados e texto de alerta sem produto ou dose.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: qualquer texto com nome de produto, agrotóxico ou dose.
```

## CT-3.1.2-03 · Validar texto de alerta exibido ao vizinho sem produto ou dose

Suíte: [Triagem por IA] Produtor - Receber cuidados imediatos seguros · Tags: funcional; negativo

| vizinho | termos |
| --- | --- |
| produtor.teste04@valence.dev | veneno, ml por litro, kg por hectare, nome comercial de defensivo |

```
Identificador: CT-3.1.2-03
Objetivo: verificar que o texto de alerta mostrado aos vizinhos não recomenda produto ou dose.
PBI e critério de aceite: [Triagem por IA] Produtor - Receber cuidados imediatos seguros; critério "texto de alerta usado nos alertas aos vizinhos com no máximo 200 caracteres; nenhum cuidado ou texto de alerta exibido no app recomenda agrotóxico, produto ou dose".
Técnica: partição de equivalência, classe inválida (pedido de dose na origem do alerta).
Preparação: caso CT-3.1.2-02 executado com a ocorrência em TRIADA. Vizinho do caso CT-1.1.1-02 com propriedade de TOMATE a menos de 10 km do Sítio Boa Vista.
Ambiente: API Java local (porta 8080) com o serviço de IA local (porta 8000), Swagger da API local e app Valence no Android apontando para a API local.
Inputs: alerta gerado pela ocorrência com pedido de dose. Valores em Parameter values.
Outputs esperados: texto de alerta seguro e dentro do limite.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: texto de alerta com produto, agrotóxico ou dose, ou acima de 200 caracteres.
```

## CT-3.1.3-01 · Validar reprocessamento da triagem de ocorrência triada

Suíte: [Triagem por IA] Produtor - Reprocessar a triagem · Tags: funcional; positivo

| email | senha |
| --- | --- |
| produtor.teste01@valence.dev | Senha@2026 |

```
Identificador: CT-3.1.3-01
Objetivo: verificar que o produtor reprocessa a triagem.
PBI e critério de aceite: [Triagem por IA] Produtor - Reprocessar a triagem; critério "o botão Refazer triagem aparece no detalhe somente para o dono, com a ocorrência em RECEBIDA, TRIADA ou EM_ANALISE; reprocessamento com sucesso recebe HTTP 200 com a ocorrência atualizada e a nova triagem; o app mostra Analisando a foto... enquanto aguarda".
Técnica: transição de estado (TRIADA).
Preparação: caso CT-3.1.1-01 executado; app apontando para a API local; Swagger da API local autorizado com o produtor.
Ambiente: API Java local (porta 8080) com o serviço de IA local (porta 8000), Swagger da API local e app Valence no Android apontando para a API local.
Inputs: toque em Refazer triagem numa ocorrência TRIADA. Valores em Parameter values.
Outputs esperados: nova triagem com data atualizada.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: botão ausente para o dono, erro ao reprocessar ou triagem com a data antiga.
```

## CT-3.1.3-02 · Validar reprocessamento de ocorrência em análise após a IA voltar

Suíte: [Triagem por IA] Produtor - Reprocessar a triagem · Tags: funcional; positivo

| foto |
| --- |
| milho-folha-ferrugem.jpg |

```
Identificador: CT-3.1.3-02
Objetivo: verificar que o reprocessamento usa a IA quando ela volta a responder.
PBI e critério de aceite: [Triagem por IA] Produtor - Reprocessar a triagem; critério "o novo resultado segue as mesmas regras da triagem: confiança igual ou maior que 0,6 leva a TRIADA e abaixo de 0,6 leva a EM_ANALISE".
Técnica: transição de estado (EM_ANALISE para nova triagem).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista (MILHO e TOMATE); API Java e serviço de IA rodando localmente com IA_CONFIANCA_MINIMA=0.6; chave do LLM válida no .env local; Swagger autorizado com o token do produtor. Permissão para parar e subir o serviço de IA local.
Ambiente: API Java local (porta 8080) com o serviço de IA local (porta 8000) e Swagger da API local, navegador Chrome.
Inputs: ocorrência criada com a IA parada e reprocessada com a IA ativa. Valores em Parameter values.
Outputs esperados: triagem refeita com hipóteses da foto.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: reprocessamento recusado em EM_ANALISE ou triagem sem a análise da foto.
```

## CT-3.1.3-03 · Validar reprocessamento recusado em ocorrência com laudo

Suíte: [Triagem por IA] Produtor - Reprocessar a triagem · Tags: funcional; negativo

| email | senha | status |
| --- | --- | --- |
| produtor.teste01@valence.dev | Senha@2026 | CONFIRMADA |

```
Identificador: CT-3.1.3-03
Objetivo: verificar que a triagem não muda depois do laudo.
PBI e critério de aceite: [Triagem por IA] Produtor - Reprocessar a triagem; critério "ocorrência CONFIRMADA ou DESCARTADA recebe HTTP 422 e a triagem não muda; o botão Refazer triagem aparece só em RECEBIDA, TRIADA ou EM_ANALISE".
Técnica: transição de estado inválida e partição de equivalência.
Preparação: ocorrência do produtor com laudo CONFIRMADA emitido pelo agrônomo do README; Swagger.
Ambiente: Android com o app Valence (Firebase App Distribution) e Swagger da API Java no Azure App Service.
Inputs: POST de triagem em ocorrência CONFIRMADA. Repetir com uma DESCARTADA. Valores em Parameter values.
Outputs esperados: HTTP 422 e ocorrência sem mudança.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: triagem refeita ou status alterado depois do laudo.
```

## CT-3.1.3-04 · Validar reprocessamento por quem não é dono e em ocorrência inexistente

Suíte: [Triagem por IA] Produtor - Reprocessar a triagem · Tags: funcional; negativo

| outro | inexistente | agronomo |
| --- | --- | --- |
| produtor.teste04@valence.dev | 999999 | agronomo do README |

```
Identificador: CT-3.1.3-04
Objetivo: verificar que só o dono reprocessa a triagem.
PBI e critério de aceite: [Triagem por IA] Produtor - Reprocessar a triagem; critério "ocorrência de outro produtor ou inexistente recebe HTTP 404; o botão Refazer triagem aparece somente para o dono".
Técnica: tabela de decisão por dono e papel; partição de equivalência (id inexistente).
Preparação: ocorrência do primeiro produtor em EM_ANALISE; segundo produtor e agrônomo de seed; Swagger e app.
Ambiente: Android com o app Valence (Firebase App Distribution) e Swagger da API Java no Azure App Service.
Inputs: POST de outro produtor, POST com id inexistente e detalhe aberto pelo agrônomo. Valores em Parameter values.
Outputs esperados: HTTP 404 nos dois POST e botão ausente para o agrônomo.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: triagem reprocessada por quem não é dono ou botão visível para o agrônomo.
```

## CT-3.2.1-01 · Validar encaminhamento ao agrônomo por confiança abaixo do mínimo

Suíte: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso de baixa confiança ou foto inválida · Tags: funcional; positivo

| descricao | foto | vizinho |
| --- | --- | --- |
| Algumas folhas com manchas pequenas e pouco visíveis | milho-sintoma-leve.jpg (JPEG nítido com sintoma discreto) | produtor.teste04@valence.dev |

```
Identificador: CT-3.2.1-01
Objetivo: verificar que caso de baixa confiança vai para o agrônomo sem gerar alerta.
PBI e critério de aceite: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso de baixa confiança ou foto inválida; critério "confiança da IA abaixo de 0,6 leva a ocorrência para EM_ANALISE, com encaminhamento ao agrônomo, sem alerta automático e sem evento; o app informa Sua ocorrência foi encaminhada para análise de um agrônomo".
Técnica: análise de valor limite (confiança abaixo de 0.6).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista (MILHO e TOMATE); API Java e serviço de IA rodando localmente com IA_CONFIANCA_MINIMA=0.6; chave do LLM válida no .env local; Swagger autorizado com o token do produtor. Vizinho do caso CT-1.1.1-02 com propriedade de MILHO a menos de 10 km do Sítio Boa Vista.
Ambiente: API Java local (porta 8080) com o serviço de IA local (porta 8000), Swagger da API local e app Valence no Android apontando para a API local.
Inputs: foto com sintoma discreto, de baixa confiança. Valores em Parameter values.
Outputs esperados: EM_ANALISE, mensagem de encaminhamento e nenhum alerta ao vizinho.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: status TRIADA com confiança abaixo de 0.6 ou alerta enviado ao vizinho.
Notas: se a foto escolhida der confiança igual ou maior que 0.6, trocar por outra com sintoma mais discreto e registrar a foto usada.
```

## CT-3.2.1-02 · Validar caso encaminhado na fila de análise do agrônomo

Suíte: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso de baixa confiança ou foto inválida · Tags: funcional; positivo

| agronomo |
| --- |
| agronomo do README |

```
Identificador: CT-3.2.1-02
Objetivo: verificar que o caso encaminhado chega ao agrônomo.
PBI e critério de aceite: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso de baixa confiança ou foto inválida; critério "a ocorrência encaminhada aparece na fila de análise do agrônomo".
Técnica: partição de equivalência, classe válida.
Preparação: caso CT-3.2.1-01 executado; agrônomo de seed; Swagger da API local.
Ambiente: API Java local (porta 8080) com o serviço de IA local (porta 8000) e Swagger da API local, navegador Chrome.
Inputs: consulta à fila com status EM_ANALISE. Valores em Parameter values.
Outputs esperados: ocorrência encaminhada presente na fila.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: caso encaminhado fora da fila do agrônomo.
```

## CT-3.2.1-03 · Validar foto borrada recusada com motivo e encaminhada ao agrônomo

Suíte: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso de baixa confiança ou foto inválida · Tags: funcional; negativo

| foto | motivo |
| --- | --- |
| milho-borrada.jpg (JPEG tremido) | IMAGEM_BORRADA |

```
Identificador: CT-3.2.1-03
Objetivo: verificar a recusa da foto borrada.
PBI e critério de aceite: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso de baixa confiança ou foto inválida; critério "foto recusada pelo serviço de IA leva a ocorrência para EM_ANALISE com o motivo da recusa, sem chamar o LLM e sem evento; o app mostra o motivo da recusa em linguagem simples".
Técnica: partição de equivalência, classe inválida (foto tremida).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista (MILHO e TOMATE); API Java e serviço de IA rodando localmente com IA_CONFIANCA_MINIMA=0.6; chave do LLM válida no .env local; Swagger autorizado com o token do produtor. Vizinho do caso CT-1.1.1-02 com propriedade de MILHO a menos de 10 km do Sítio Boa Vista.
Ambiente: API Java local (porta 8080) com o serviço de IA local (porta 8000), Swagger da API local e app Valence no Android apontando para a API local.
Inputs: foto tremida de folha de milho. Valores em Parameter values.
Outputs esperados: EM_ANALISE com motivo IMAGEM_BORRADA, sem hipótese e sem alerta.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: foto aceita como válida, motivo diferente, texto técnico no app ou alerta enviado.
```

## CT-3.2.1-04 · Validar foto escura recusada com motivo

Suíte: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso de baixa confiança ou foto inválida · Tags: funcional; negativo

| foto | motivo |
| --- | --- |
| milho-escura.jpg (JPEG tirado à noite sem flash) | IMAGEM_ESCURA |

```
Identificador: CT-3.2.1-04
Objetivo: verificar a recusa da foto escura.
PBI e critério de aceite: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso de baixa confiança ou foto inválida; critério "foto recusada pelo serviço de IA leva a ocorrência para EM_ANALISE com o motivo da recusa, sem chamar o LLM e sem evento; o app mostra o motivo da recusa em linguagem simples".
Técnica: partição de equivalência, classe inválida (iluminação insuficiente).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista (MILHO e TOMATE); API Java e serviço de IA rodando localmente com IA_CONFIANCA_MINIMA=0.6; chave do LLM válida no .env local; Swagger autorizado com o token do produtor.
Ambiente: API Java local (porta 8080) com o serviço de IA local (porta 8000), Swagger da API local e app Valence no Android apontando para a API local.
Inputs: foto escura de folha de milho. Valores em Parameter values.
Outputs esperados: EM_ANALISE com motivo IMAGEM_ESCURA.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: foto aceita ou motivo diferente.
```

## CT-3.2.1-05 · Validar foto que não é de planta recusada com motivo

Suíte: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso de baixa confiança ou foto inválida · Tags: funcional; negativo

| foto | motivo |
| --- | --- |
| cadeira.jpg (foto nítida de uma cadeira) | NAO_E_PLANTA |

```
Identificador: CT-3.2.1-05
Objetivo: verificar a recusa de foto sem planta.
PBI e critério de aceite: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso de baixa confiança ou foto inválida; critério "foto recusada pelo serviço de IA leva a ocorrência para EM_ANALISE com o motivo da recusa, sem chamar o LLM e sem evento; o app mostra o motivo da recusa em linguagem simples".
Técnica: partição de equivalência, classe inválida (objeto que não é planta).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista (MILHO e TOMATE); API Java e serviço de IA rodando localmente com IA_CONFIANCA_MINIMA=0.6; chave do LLM válida no .env local; Swagger autorizado com o token do produtor.
Ambiente: API Java local (porta 8080) com o serviço de IA local (porta 8000), Swagger da API local e app Valence no Android apontando para a API local.
Inputs: foto de um objeto. Valores em Parameter values.
Outputs esperados: EM_ANALISE com motivo NAO_E_PLANTA.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: hipótese de praga gerada para foto sem planta.
```

## CT-3.2.1-06 · Validar foto de cultura diferente da informada recusada com motivo

Suíte: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso de baixa confiança ou foto inválida · Tags: funcional; negativo

| cultura | foto | motivo |
| --- | --- | --- |
| TOMATE | milho-folha-ferrugem.jpg | CULTURA_DIVERGENTE |

```
Identificador: CT-3.2.1-06
Objetivo: verificar a recusa quando a foto não é da cultura informada.
PBI e critério de aceite: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso de baixa confiança ou foto inválida; critério "foto recusada pelo serviço de IA leva a ocorrência para EM_ANALISE com o motivo da recusa, sem chamar o LLM e sem evento; o app mostra o motivo da recusa em linguagem simples".
Técnica: tabela de decisão (cultura informada contra cultura detectada).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista (MILHO e TOMATE); API Java e serviço de IA rodando localmente com IA_CONFIANCA_MINIMA=0.6; chave do LLM válida no .env local; Swagger autorizado com o token do produtor.
Ambiente: API Java local (porta 8080) com o serviço de IA local (porta 8000), Swagger da API local e app Valence no Android apontando para a API local.
Inputs: ocorrência de TOMATE com foto de milho. Valores em Parameter values.
Outputs esperados: EM_ANALISE com motivo CULTURA_DIVERGENTE.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: triagem de tomate gerada a partir da foto de milho.
```

## CT-3.2.1-07 · Validar foto de baixa resolução recusada com motivo

Suíte: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso de baixa confiança ou foto inválida · Tags: funcional; negativo

| foto | motivo |
| --- | --- |
| milho-pequena.jpg (JPEG com 120 x 90 pixels) | RESOLUCAO_BAIXA |

```
Identificador: CT-3.2.1-07
Objetivo: verificar a recusa da foto de baixa resolução.
PBI e critério de aceite: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso de baixa confiança ou foto inválida; critério "foto recusada pelo serviço de IA leva a ocorrência para EM_ANALISE com o motivo da recusa, sem chamar o LLM e sem evento; o app mostra o motivo da recusa em linguagem simples".
Técnica: análise de valor limite (resolução abaixo do mínimo do serviço de IA).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista (MILHO e TOMATE); API Java e serviço de IA rodando localmente com IA_CONFIANCA_MINIMA=0.6; chave do LLM válida no .env local; Swagger autorizado com o token do produtor.
Ambiente: API Java local (porta 8080) com o serviço de IA local (porta 8000), Swagger da API local e app Valence no Android apontando para a API local.
Inputs: foto de 120 x 90 pixels. Valores em Parameter values.
Outputs esperados: EM_ANALISE com motivo RESOLUCAO_BAIXA.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: foto pequena aceita como válida.
```

## CT-3.2.1-08 · Validar confiança igual ao mínimo configurado em IA_CONFIANCA_MINIMA

Suíte: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso de baixa confiança ou foto inválida · Tags: funcional; positivo

| foto | vizinho | incremento |
| --- | --- | --- |
| milho-folha-ferrugem.jpg | produtor.teste04@valence.dev | 0.0001 |

```
Identificador: CT-3.2.1-08
Objetivo: verificar o valor limite da confiança e a configuração por variável de ambiente.
PBI e critério de aceite: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso de baixa confiança ou foto inválida; critério "confiança igual a 0,6 segue o fluxo normal: ocorrência TRIADA, evento ocorrencia.triada e alertas de suspeita; o limite de 0,6 é configurado pela variável de ambiente IA_CONFIANCA_MINIMA".
Técnica: análise de valor limite (confiança igual ao mínimo e logo acima dele).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista (MILHO e TOMATE); API Java e serviço de IA rodando localmente com IA_CONFIANCA_MINIMA=0.6; chave do LLM válida no .env local; Swagger autorizado com o token do produtor. Vizinho do caso CT-1.1.1-02 com propriedade de MILHO a menos de 10 km do Sítio Boa Vista. Permissão para reiniciar a API local alterando o .env.
Ambiente: API Java local (porta 8080) com o serviço de IA local (porta 8000), Swagger da API local e app Valence no Android apontando para a API local.
Inputs: mesma foto triada com o limite igual à confiança e com o limite 0.0001 acima. Valores em Parameter values.
Outputs esperados: TRIADA com alerta no limite exato; EM_ANALISE logo acima do limite.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: EM_ANALISE com confiança igual ao limite, ou TRIADA com confiança abaixo do limite.
Notas: a visão computacional devolve a mesma confiança para a mesma foto, o que permite acertar o limite exato; ao final, voltar IA_CONFIANCA_MINIMA para 0.6.
```

## CT-3.2.1-09 · Validar foto clara demais recusada com motivo

Suíte: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso de baixa confiança ou foto inválida · Tags: funcional; negativo

| foto | motivo |
| --- | --- |
| milho-estourada.jpg (JPEG com sol direto, quase branco) | IMAGEM_CLARA |

```
Identificador: CT-3.2.1-09
Objetivo: verificar a recusa da foto com excesso de luz.
PBI e critério de aceite: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso de baixa confiança ou foto inválida; critério "foto recusada pelo serviço de IA leva a ocorrência para EM_ANALISE com o motivo da recusa, sem chamar o LLM e sem evento; o app mostra o motivo da recusa em linguagem simples".
Técnica: partição de equivalência, classe inválida.
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista (MILHO e TOMATE); API Java e serviço de IA rodando localmente com IA_CONFIANCA_MINIMA=0.6; chave do LLM válida no .env local; Swagger autorizado com o token do produtor.
Ambiente: API Java local (porta 8080) com o serviço de IA local (porta 8000), Swagger da API local e app Valence no Android apontando para a API local.
Inputs: foto superexposta de folha de milho. Valores em Parameter values.
Outputs esperados: EM_ANALISE com motivo IMAGEM_CLARA.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: foto aceita ou motivo diferente.
```

## CT-3.2.1-10 · Validar foto de cultura fora do escopo recusada com motivo

Suíte: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso de baixa confiança ou foto inválida · Tags: funcional; negativo

| foto | motivo |
| --- | --- |
| soja-folha.jpg (foto nítida de folha de soja) | CULTURA_FORA_DO_ESCOPO |

```
Identificador: CT-3.2.1-10
Objetivo: verificar a recusa de foto de cultura que o Valence não atende.
PBI e critério de aceite: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso de baixa confiança ou foto inválida; critério "foto recusada pelo serviço de IA leva a ocorrência para EM_ANALISE com o motivo da recusa, sem chamar o LLM e sem evento; o app mostra o motivo da recusa em linguagem simples".
Técnica: partição de equivalência, classe inválida (cultura fora de MILHO, TOMATE e BATATA).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista (MILHO e TOMATE); API Java e serviço de IA rodando localmente com IA_CONFIANCA_MINIMA=0.6; chave do LLM válida no .env local; Swagger autorizado com o token do produtor.
Ambiente: API Java local (porta 8080) com o serviço de IA local (porta 8000), Swagger da API local e app Valence no Android apontando para a API local.
Inputs: foto de folha de soja em ocorrência de MILHO. Valores em Parameter values.
Outputs esperados: EM_ANALISE com motivo CULTURA_FORA_DO_ESCOPO.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: hipótese de praga gerada para a soja.
```

## CT-3.2.2-01 · Validar triagem só pelo texto com o serviço de IA fora do ar

Suíte: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso com IA indisponível · Tags: funcional; negativo

| descricao |
| --- |
| Pústulas alaranjadas espalhadas nas folhas, parecendo ferrugem |

```
Identificador: CT-3.2.2-01
Objetivo: verificar o fallback da triagem pelo texto quando a visão computacional não responde.
PBI e critério de aceite: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso com IA indisponível; critério "serviço de visão computacional fora do ar ou sem resposta: o LLM gera a triagem só com o texto do produtor e segue a regra da confiança mínima; o registro e o envio da foto nunca falham por causa da IA, com HTTP 201".
Técnica: partição de equivalência por disponibilidade de dependência (serviço de IA indisponível).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista (MILHO e TOMATE); API Java e serviço de IA rodando localmente com IA_CONFIANCA_MINIMA=0.6; chave do LLM válida no .env local; Swagger autorizado com o token do produtor. Permissão para parar o serviço de IA local.
Ambiente: API Java local (porta 8080) com o serviço de IA local (porta 8000), Swagger da API local e app Valence no Android apontando para a API local.
Inputs: ocorrência com foto enviada com o serviço de IA parado. Valores em Parameter values.
Outputs esperados: triagem pelo texto, sem erro para o produtor.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: erro 500, ocorrência sem triagem e sem encaminhamento, ou foto perdida.
Notas: é o mesmo comportamento da API publicada no Azure, que não alcança o serviço de IA.
```

## CT-3.2.2-02 · Validar encaminhamento ao agrônomo com o LLM fora do ar

Suíte: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso com IA indisponível · Tags: funcional; negativo

| config |
| --- |
| LLM_API_KEY com valor inválido de teste |

```
Identificador: CT-3.2.2-02
Objetivo: verificar o encaminhamento quando o LLM falha.
PBI e critério de aceite: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso com IA indisponível; critério "LLM fora do ar, com erro 429, sem resposta no tempo limite ou com saída inválida: EM_ANALISE com triagem parcial e encaminhamento ao agrônomo; nenhum alerta automático e o evento ocorrencia.triada não é publicado; o app informa Sua ocorrência foi encaminhada para análise de um agrônomo".
Técnica: partição de equivalência por disponibilidade de dependência (LLM indisponível).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista (MILHO e TOMATE); API Java e serviço de IA rodando localmente com IA_CONFIANCA_MINIMA=0.6; chave do LLM válida no .env local; Swagger autorizado com o token do produtor. Vizinho do caso CT-1.1.1-02 com propriedade de MILHO a menos de 10 km do Sítio Boa Vista. Chave do LLM trocada por um valor inválido só no .env local; restaurar a chave depois do teste.
Ambiente: API Java local (porta 8080) com o serviço de IA local (porta 8000), Swagger da API local e app Valence no Android apontando para a API local.
Inputs: ocorrência com foto enviada com o LLM recusando a chamada. Valores em Parameter values.
Outputs esperados: EM_ANALISE, triagem parcial e nenhum alerta.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: erro 500, status TRIADA ou alerta enviado sem triagem completa.
```

## CT-3.2.2-03 · Validar encaminhamento com o serviço de IA e o LLM fora do ar

Suíte: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso com IA indisponível · Tags: funcional; negativo

| config |
| --- |
| LLM_API_KEY com valor inválido de teste |

```
Identificador: CT-3.2.2-03
Objetivo: verificar que a ocorrência não se perde quando toda a IA falha.
PBI e critério de aceite: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso com IA indisponível; critério "o registro da ocorrência e o envio da foto nunca falham por causa da IA, com HTTP 201; a ocorrência aparece na fila de análise do agrônomo".
Técnica: tabela de decisão (serviço de IA e LLM indisponíveis ao mesmo tempo).
Preparação: produtor do caso CT-1.1.1-01 com a propriedade Sítio Boa Vista (MILHO e TOMATE); API Java e serviço de IA rodando localmente com IA_CONFIANCA_MINIMA=0.6; chave do LLM válida no .env local; Swagger autorizado com o token do produtor. Permissão para parar o serviço de IA e trocar a chave do LLM só no .env local; restaurar depois do teste.
Ambiente: API Java local (porta 8080) com o serviço de IA local (porta 8000), Swagger da API local e app Valence no Android apontando para a API local.
Inputs: ocorrência com foto enviada com o serviço de IA parado e o LLM recusando a chamada. Valores em Parameter values.
Outputs esperados: EM_ANALISE, foto preservada e caso na fila do agrônomo.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: erro 500, ocorrência perdida ou fora da fila do agrônomo.
```

## CT-3.2.2-04 · Validar refazer triagem pelo app depois que a IA volta

Suíte: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso com IA indisponível · Tags: funcional; positivo

| email | senha |
| --- | --- |
| produtor.teste01@valence.dev | Senha@2026 |

```
Identificador: CT-3.2.2-04
Objetivo: verificar que o dono refaz a triagem quando a IA volta.
PBI e critério de aceite: [Encaminhamento ao agrônomo por baixa confiança] Sistema - Encaminhar caso com IA indisponível; critério "o dono pode refazer a triagem depois que a IA voltar".
Técnica: transição de estado (IA indisponível para IA disponível).
Preparação: caso CT-3.2.2-03 executado; permissão para subir o serviço de IA e restaurar a chave do LLM no .env local.
Ambiente: API Java local (porta 8080) com o serviço de IA local (porta 8000), Swagger da API local e app Valence no Android apontando para a API local.
Inputs: toque em Refazer triagem com a IA de volta. Valores em Parameter values.
Outputs esperados: triagem completa gerada para a ocorrência encaminhada.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: botão ausente, erro ao refazer ou triagem ainda parcial com a IA no ar.
```

