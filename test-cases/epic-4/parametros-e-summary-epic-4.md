# Feature epic.4 - Parameter values e Summary

## CT-4.1.1-01 · Validar alerta de suspeita para propriedade vizinha com a mesma cultura

Suíte: [Alertas de suspeita para vizinhos] Produtor vizinho - Receber alerta de suspeita no raio · Tags: funcional; positivo

| vizinho | senha | distancia | propriedade |
| --- | --- | --- | --- |
| produtor.teste04@valence.dev | Senha@2026 | 5 km | Fazenda Vizinha |

```
Identificador: CT-4.1.1-01
Objetivo: verificar que o evento ocorrencia.triada gera alerta SUSPEITA para a propriedade vizinha com a mesma cultura.
PBI e critério de aceite: [Alertas de suspeita para vizinhos] Produtor vizinho - Receber alerta de suspeita no raio; critério "o evento ocorrencia.triada gera alerta de nível SUSPEITA para cada propriedade com a mesma cultura num raio de até 10 km; alerta mostra cultura, praga provável, severidade, distância aproximada em km inteiros, texto de alerta, data e o nome da propriedade do próprio usuário que recebeu".
Técnica: partição de equivalência, classe válida (mesma cultura dentro do raio).
Preparação: massa de alertas: Sítio Boa Vista do produtor.teste01@valence.dev (latitude -21.1775, longitude -47.8103, MILHO e TOMATE); Fazenda Vizinha do produtor.teste04@valence.dev a 5 km (latitude -21.1325339, longitude -47.8103, MILHO e TOMATE); produtor de apoio produtor.teste08@valence.dev, senha Senha@2026, com Chácara Limite a 10 km (latitude -21.0875679, MILHO), Sítio Além a 10,1 km (latitude -21.0866685, MILHO), Horta Perto a 3 km (latitude -21.1505204, só TOMATE) e Rancho Colado a 0,3 km (latitude -21.174802, MILHO), todas com longitude -47.8103. Ocorrência de MILHO do produtor.teste01 no Sítio Boa Vista em TRIADA (fluxo do CT-3.1.1-01).
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: ocorrência de MILHO triada a 5 km da Fazenda Vizinha. Valores em Parameter values.
Outputs esperados: alerta SUSPEITA com todos os campos para a Fazenda Vizinha.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: alerta ausente, nível diferente de SUSPEITA ou campo faltando.
Notas: distâncias calculadas pela fórmula de Haversine com raio da Terra de 6371 km; se a API usar outra fórmula, recalcular as latitudes com o Henrique.
```

## CT-4.1.1-02 · Validar alerta para propriedade a exatamente 10 km

Suíte: [Alertas de suspeita para vizinhos] Produtor vizinho - Receber alerta de suspeita no raio · Tags: funcional; positivo

| apoio | senha | propriedade | distancia |
| --- | --- | --- | --- |
| produtor.teste08@valence.dev | Senha@2026 | Chácara Limite | 10 km |

```
Identificador: CT-4.1.1-02
Objetivo: verificar que o limite do raio é inclusivo.
PBI e critério de aceite: [Alertas de suspeita para vizinhos] Produtor vizinho - Receber alerta de suspeita no raio; critério "propriedade a exatamente 10 km recebe o alerta".
Técnica: análise de valor limite (distância igual ao raio).
Preparação: massa de alertas: Sítio Boa Vista do produtor.teste01@valence.dev (latitude -21.1775, longitude -47.8103, MILHO e TOMATE); Fazenda Vizinha do produtor.teste04@valence.dev a 5 km (latitude -21.1325339, longitude -47.8103, MILHO e TOMATE); produtor de apoio produtor.teste08@valence.dev, senha Senha@2026, com Chácara Limite a 10 km (latitude -21.0875679, MILHO), Sítio Além a 10,1 km (latitude -21.0866685, MILHO), Horta Perto a 3 km (latitude -21.1505204, só TOMATE) e Rancho Colado a 0,3 km (latitude -21.174802, MILHO), todas com longitude -47.8103. Ocorrência de MILHO do produtor.teste01 no Sítio Boa Vista em TRIADA (fluxo do CT-3.1.1-01).
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: propriedade de MILHO a 10 km da ocorrência. Valores em Parameter values.
Outputs esperados: alerta SUSPEITA para a Chácara Limite.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: Chácara Limite sem alerta.
Notas: distâncias calculadas pela fórmula de Haversine com raio da Terra de 6371 km; se a API usar outra fórmula, recalcular as latitudes com o Henrique.
```

## CT-4.1.1-03 · Validar ausência de alerta para propriedade a mais de 10 km

Suíte: [Alertas de suspeita para vizinhos] Produtor vizinho - Receber alerta de suspeita no raio · Tags: funcional; negativo

| apoio | senha | propriedade |
| --- | --- | --- |
| produtor.teste08@valence.dev | Senha@2026 | Sítio Além |

```
Identificador: CT-4.1.1-03
Objetivo: verificar que propriedade fora do raio não recebe alerta.
PBI e critério de aceite: [Alertas de suspeita para vizinhos] Produtor vizinho - Receber alerta de suspeita no raio; critério "propriedade a mais de 10 km não recebe o alerta".
Técnica: análise de valor limite (10,1 km, logo acima do raio).
Preparação: massa de alertas: Sítio Boa Vista do produtor.teste01@valence.dev (latitude -21.1775, longitude -47.8103, MILHO e TOMATE); Fazenda Vizinha do produtor.teste04@valence.dev a 5 km (latitude -21.1325339, longitude -47.8103, MILHO e TOMATE); produtor de apoio produtor.teste08@valence.dev, senha Senha@2026, com Chácara Limite a 10 km (latitude -21.0875679, MILHO), Sítio Além a 10,1 km (latitude -21.0866685, MILHO), Horta Perto a 3 km (latitude -21.1505204, só TOMATE) e Rancho Colado a 0,3 km (latitude -21.174802, MILHO), todas com longitude -47.8103. Ocorrência de MILHO do produtor.teste01 no Sítio Boa Vista em TRIADA (fluxo do CT-3.1.1-01).
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: propriedade de MILHO a 10,1 km da ocorrência. Valores em Parameter values.
Outputs esperados: nenhum alerta para o Sítio Além.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: alerta criado para o Sítio Além.
Notas: distâncias calculadas pela fórmula de Haversine com raio da Terra de 6371 km; se a API usar outra fórmula, recalcular as latitudes com o Henrique.
```

## CT-4.1.1-04 · Validar ausência de alerta para propriedade sem a cultura da ocorrência

Suíte: [Alertas de suspeita para vizinhos] Produtor vizinho - Receber alerta de suspeita no raio · Tags: funcional; negativo

| apoio | propriedade |
| --- | --- |
| produtor.teste08@valence.dev | Horta Perto |

```
Identificador: CT-4.1.1-04
Objetivo: verificar que só propriedades com a mesma cultura recebem o alerta.
PBI e critério de aceite: [Alertas de suspeita para vizinhos] Produtor vizinho - Receber alerta de suspeita no raio; critério "propriedade sem a cultura da ocorrência não recebe o alerta, mesmo dentro do raio".
Técnica: tabela de decisão (dentro do raio e cultura diferente).
Preparação: massa de alertas: Sítio Boa Vista do produtor.teste01@valence.dev (latitude -21.1775, longitude -47.8103, MILHO e TOMATE); Fazenda Vizinha do produtor.teste04@valence.dev a 5 km (latitude -21.1325339, longitude -47.8103, MILHO e TOMATE); produtor de apoio produtor.teste08@valence.dev, senha Senha@2026, com Chácara Limite a 10 km (latitude -21.0875679, MILHO), Sítio Além a 10,1 km (latitude -21.0866685, MILHO), Horta Perto a 3 km (latitude -21.1505204, só TOMATE) e Rancho Colado a 0,3 km (latitude -21.174802, MILHO), todas com longitude -47.8103. Ocorrência de MILHO do produtor.teste01 no Sítio Boa Vista em TRIADA (fluxo do CT-3.1.1-01).
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: propriedade só de TOMATE a 3 km de uma ocorrência de MILHO. Valores em Parameter values.
Outputs esperados: nenhum alerta para a Horta Perto.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: alerta criado para a Horta Perto.
```

## CT-4.1.1-05 · Validar que a propriedade de origem não recebe alerta

Suíte: [Alertas de suspeita para vizinhos] Produtor vizinho - Receber alerta de suspeita no raio · Tags: funcional; negativo

| email | senha | propriedade |
| --- | --- | --- |
| produtor.teste01@valence.dev | Senha@2026 | Sítio Boa Vista |

```
Identificador: CT-4.1.1-05
Objetivo: verificar que quem registrou não recebe alerta da própria ocorrência.
PBI e critério de aceite: [Alertas de suspeita para vizinhos] Produtor vizinho - Receber alerta de suspeita no raio; critério "a propriedade de origem da ocorrência não recebe alerta".
Técnica: partição de equivalência, classe inválida (propriedade de origem).
Preparação: massa de alertas: Sítio Boa Vista do produtor.teste01@valence.dev (latitude -21.1775, longitude -47.8103, MILHO e TOMATE); Fazenda Vizinha do produtor.teste04@valence.dev a 5 km (latitude -21.1325339, longitude -47.8103, MILHO e TOMATE); produtor de apoio produtor.teste08@valence.dev, senha Senha@2026, com Chácara Limite a 10 km (latitude -21.0875679, MILHO), Sítio Além a 10,1 km (latitude -21.0866685, MILHO), Horta Perto a 3 km (latitude -21.1505204, só TOMATE) e Rancho Colado a 0,3 km (latitude -21.174802, MILHO), todas com longitude -47.8103. Ocorrência de MILHO do produtor.teste01 no Sítio Boa Vista em TRIADA (fluxo do CT-3.1.1-01).
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: lista de alertas do produtor que registrou a ocorrência. Valores em Parameter values.
Outputs esperados: nenhum alerta da própria ocorrência.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: alerta da ocorrência para o Sítio Boa Vista.
```

## CT-4.1.1-06 · Validar ausência de alerta automático para ocorrência em análise

Suíte: [Alertas de suspeita para vizinhos] Produtor vizinho - Receber alerta de suspeita no raio · Tags: funcional; negativo

| foto | vizinho |
| --- | --- |
| milho-borrada.jpg | produtor.teste04@valence.dev |

```
Identificador: CT-4.1.1-06
Objetivo: verificar que caso encaminhado ao agrônomo não dispara alerta.
PBI e critério de aceite: [Alertas de suspeita para vizinhos] Produtor vizinho - Receber alerta de suspeita no raio; critério "ocorrência que vai para EM_ANALISE não gera alerta automático".
Técnica: partição de equivalência, classe inválida (ocorrência sem triagem confiável).
Preparação: massa de alertas: Sítio Boa Vista do produtor.teste01@valence.dev (latitude -21.1775, longitude -47.8103, MILHO e TOMATE); Fazenda Vizinha do produtor.teste04@valence.dev a 5 km (latitude -21.1325339, longitude -47.8103, MILHO e TOMATE); produtor de apoio produtor.teste08@valence.dev, senha Senha@2026, com Chácara Limite a 10 km (latitude -21.0875679, MILHO), Sítio Além a 10,1 km (latitude -21.0866685, MILHO), Horta Perto a 3 km (latitude -21.1505204, só TOMATE) e Rancho Colado a 0,3 km (latitude -21.174802, MILHO), todas com longitude -47.8103. Ambiente da triagem com foto (como no CT-3.2.1-03).
Ambiente: API Java local (porta 8080) ligada ao RabbitMQ do CloudAMQP, Swagger da API local e app Valence no Android apontando para a API local.
Inputs: ocorrência que termina em EM_ANALISE. Valores em Parameter values.
Outputs esperados: nenhum alerta para a Fazenda Vizinha.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: alerta criado para ocorrência em EM_ANALISE.
```

## CT-4.1.1-07 · Validar distância mínima de 1 km no alerta

Suíte: [Alertas de suspeita para vizinhos] Produtor vizinho - Receber alerta de suspeita no raio · Tags: funcional; positivo

| apoio | senha | propriedade | distancia |
| --- | --- | --- | --- |
| produtor.teste08@valence.dev | Senha@2026 | Rancho Colado | 1 km |

```
Identificador: CT-4.1.1-07
Objetivo: verificar o arredondamento da distância com mínimo de 1 km.
PBI e critério de aceite: [Alertas de suspeita para vizinhos] Produtor vizinho - Receber alerta de suspeita no raio; critério "distância aproximada em km inteiros, mínimo 1 km".
Técnica: análise de valor limite (0,3 km, abaixo do mínimo exibido).
Preparação: massa de alertas: Sítio Boa Vista do produtor.teste01@valence.dev (latitude -21.1775, longitude -47.8103, MILHO e TOMATE); Fazenda Vizinha do produtor.teste04@valence.dev a 5 km (latitude -21.1325339, longitude -47.8103, MILHO e TOMATE); produtor de apoio produtor.teste08@valence.dev, senha Senha@2026, com Chácara Limite a 10 km (latitude -21.0875679, MILHO), Sítio Além a 10,1 km (latitude -21.0866685, MILHO), Horta Perto a 3 km (latitude -21.1505204, só TOMATE) e Rancho Colado a 0,3 km (latitude -21.174802, MILHO), todas com longitude -47.8103. Ocorrência de MILHO do produtor.teste01 no Sítio Boa Vista em TRIADA (fluxo do CT-3.1.1-01).
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: propriedade de MILHO a 0,3 km da ocorrência. Valores em Parameter values.
Outputs esperados: distância de 1 km no alerta.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: distância 0 km, com casas decimais ou ausente.
```

## CT-4.1.1-08 · Validar que o alerta não expõe dados do produtor de origem

Suíte: [Alertas de suspeita para vizinhos] Produtor vizinho - Receber alerta de suspeita no raio · Tags: funcional; negativo

| vizinho | origem |
| --- | --- |
| produtor.teste04@valence.dev | Sítio Boa Vista, produtor.teste01@valence.dev, -21.1775, -47.8103, nome do produtor de origem |

```
Identificador: CT-4.1.1-08
Objetivo: verificar a privacidade do produtor que registrou a ocorrência.
PBI e critério de aceite: [Alertas de suspeita para vizinhos] Produtor vizinho - Receber alerta de suspeita no raio; critério "alerta nunca mostra coordenada exata, nome, e-mail, telefone ou propriedade do produtor de origem".
Técnica: partição de equivalência, classe inválida (dado pessoal no alerta).
Preparação: massa de alertas: Sítio Boa Vista do produtor.teste01@valence.dev (latitude -21.1775, longitude -47.8103, MILHO e TOMATE); Fazenda Vizinha do produtor.teste04@valence.dev a 5 km (latitude -21.1325339, longitude -47.8103, MILHO e TOMATE); produtor de apoio produtor.teste08@valence.dev, senha Senha@2026, com Chácara Limite a 10 km (latitude -21.0875679, MILHO), Sítio Além a 10,1 km (latitude -21.0866685, MILHO), Horta Perto a 3 km (latitude -21.1505204, só TOMATE) e Rancho Colado a 0,3 km (latitude -21.174802, MILHO), todas com longitude -47.8103. Ocorrência de MILHO do produtor.teste01 no Sítio Boa Vista em TRIADA (fluxo do CT-3.1.1-01).
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: alerta recebido pelo vizinho. Valores em Parameter values.
Outputs esperados: alerta sem dados do produtor de origem.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: qualquer dado de Parameter values no alerta.
```

## CT-4.1.1-09 · Validar evento repetido descartado sem duplicar alerta

Suíte: [Alertas de suspeita para vizinhos] Produtor vizinho - Receber alerta de suspeita no raio · Tags: funcional; negativo

| eventoId | vizinho |
| --- | --- |
| 3f6c1e2a-8b4d-4e9a-9c1f-2d7e5a6b8c91 | produtor.teste04@valence.dev |

```
Identificador: CT-4.1.1-09
Objetivo: verificar a idempotência do consumidor de alertas.
PBI e critério de aceite: [Alertas de suspeita para vizinhos] Produtor vizinho - Receber alerta de suspeita no raio; critério "no máximo 1 alerta por ocorrência e propriedade; evento repetido é descartado pelo eventoId".
Técnica: partição de equivalência, classe inválida (mensagem duplicada).
Preparação: massa de alertas: Sítio Boa Vista do produtor.teste01@valence.dev (latitude -21.1775, longitude -47.8103, MILHO e TOMATE); Fazenda Vizinha do produtor.teste04@valence.dev a 5 km (latitude -21.1325339, longitude -47.8103, MILHO e TOMATE); produtor de apoio produtor.teste08@valence.dev, senha Senha@2026, com Chácara Limite a 10 km (latitude -21.0875679, MILHO), Sítio Além a 10,1 km (latitude -21.0866685, MILHO), Horta Perto a 3 km (latitude -21.1505204, só TOMATE) e Rancho Colado a 0,3 km (latitude -21.174802, MILHO), todas com longitude -47.8103. Ocorrência de MILHO do produtor.teste01 no Sítio Boa Vista em TRIADA (fluxo do CT-3.1.1-01). Acesso ao painel do CloudAMQP; corpo do evento conforme a seção 8 do contrato.
Ambiente: API Java no Azure App Service, painel de gerenciamento do CloudAMQP (RabbitMQ), Swagger da API e app Valence no Android.
Inputs: mesma mensagem publicada duas vezes. Valores em Parameter values.
Outputs esperados: um alerta só por propriedade.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: alerta duplicado para a mesma ocorrência e propriedade.
Notas: o corpo do evento não leva dados pessoais; usar municipio e uf da propriedade de origem.
```

## CT-4.1.1-10 · Validar raio dos alertas configurado por ALERTA_RAIO_KM

Suíte: [Alertas de suspeita para vizinhos] Produtor vizinho - Receber alerta de suspeita no raio · Tags: funcional; positivo

| raio | vizinho |
| --- | --- |
| 4 | produtor.teste04@valence.dev |

```
Identificador: CT-4.1.1-10
Objetivo: verificar que o raio vem da variável de ambiente.
PBI e critério de aceite: [Alertas de suspeita para vizinhos] Produtor vizinho - Receber alerta de suspeita no raio; critério "raio de até 10 km definido pela variável ALERTA_RAIO_KM".
Técnica: partição de equivalência por configuração (raio menor que a distância do vizinho).
Preparação: massa de alertas: Sítio Boa Vista do produtor.teste01@valence.dev (latitude -21.1775, longitude -47.8103, MILHO e TOMATE); Fazenda Vizinha do produtor.teste04@valence.dev a 5 km (latitude -21.1325339, longitude -47.8103, MILHO e TOMATE); produtor de apoio produtor.teste08@valence.dev, senha Senha@2026, com Chácara Limite a 10 km (latitude -21.0875679, MILHO), Sítio Além a 10,1 km (latitude -21.0866685, MILHO), Horta Perto a 3 km (latitude -21.1505204, só TOMATE) e Rancho Colado a 0,3 km (latitude -21.174802, MILHO), todas com longitude -47.8103. Permissão para reiniciar a API local alterando o .env; voltar ALERTA_RAIO_KM para 10 ao final.
Ambiente: API Java local (porta 8080) ligada ao RabbitMQ do CloudAMQP, Swagger da API local e app Valence no Android apontando para a API local.
Inputs: raio de 4 km e ocorrência triada. Valores em Parameter values.
Outputs esperados: alerta só para propriedades a até 4 km com MILHO.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: Fazenda Vizinha alertada com raio de 4 km.
```

## CT-4.1.2-01 · Validar lista paginada de alertas do produtor logado

Suíte: [Alertas de suspeita para vizinhos] Produtor - Listar alertas e marcar como lido · Tags: funcional; positivo

| apoio | tamanho |
| --- | --- |
| produtor.teste08@valence.dev | 10 |

```
Identificador: CT-4.1.2-01
Objetivo: verificar a lista de alertas do produtor.
PBI e critério de aceite: [Alertas de suspeita para vizinhos] Produtor - Listar alertas e marcar como lido; critério "lista paginada (10 por página), da mais recente para a mais antiga, somente com os alertas das propriedades do produtor logado; cada item mostra nível, cultura, praga provável, severidade, distância, propriedade que recebeu e data".
Técnica: partição de equivalência, classe válida.
Preparação: massa de alertas: Sítio Boa Vista do produtor.teste01@valence.dev (latitude -21.1775, longitude -47.8103, MILHO e TOMATE); Fazenda Vizinha do produtor.teste04@valence.dev a 5 km (latitude -21.1325339, longitude -47.8103, MILHO e TOMATE); produtor de apoio produtor.teste08@valence.dev, senha Senha@2026, com Chácara Limite a 10 km (latitude -21.0875679, MILHO), Sítio Além a 10,1 km (latitude -21.0866685, MILHO), Horta Perto a 3 km (latitude -21.1505204, só TOMATE) e Rancho Colado a 0,3 km (latitude -21.174802, MILHO), todas com longitude -47.8103. Casos CT-4.1.1-01, 02 e 07 executados.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: consulta da lista de alertas. Valores em Parameter values.
Outputs esperados: lista ordenada, paginada e só com alertas do produtor.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: alerta de outro produtor na lista, ordem errada ou campo ausente.
```

## CT-4.1.2-02 · Validar destaque e contador de alertas não lidos

Suíte: [Alertas de suspeita para vizinhos] Produtor - Listar alertas e marcar como lido · Tags: funcional; positivo

| vizinho | senha |
| --- | --- |
| produtor.teste04@valence.dev | Senha@2026 |

```
Identificador: CT-4.1.2-02
Objetivo: verificar a indicação de alertas não lidos.
PBI e critério de aceite: [Alertas de suspeita para vizinhos] Produtor - Listar alertas e marcar como lido; critério "alerta não lido aparece destacado e o app mostra a quantidade de alertas não lidos".
Técnica: partição de equivalência, classe válida.
Preparação: massa de alertas: Sítio Boa Vista do produtor.teste01@valence.dev (latitude -21.1775, longitude -47.8103, MILHO e TOMATE); Fazenda Vizinha do produtor.teste04@valence.dev a 5 km (latitude -21.1325339, longitude -47.8103, MILHO e TOMATE); produtor de apoio produtor.teste08@valence.dev, senha Senha@2026, com Chácara Limite a 10 km (latitude -21.0875679, MILHO), Sítio Além a 10,1 km (latitude -21.0866685, MILHO), Horta Perto a 3 km (latitude -21.1505204, só TOMATE) e Rancho Colado a 0,3 km (latitude -21.174802, MILHO), todas com longitude -47.8103. Vizinho com pelo menos 2 alertas não lidos.
Ambiente: Android com o app Valence (Firebase App Distribution) e API Java no Azure App Service.
Inputs: vizinho com alertas não lidos. Valores em Parameter values.
Outputs esperados: contador e destaque corretos.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: contador ausente ou diferente do número de alertas destacados.
```

## CT-4.1.2-03 · Validar marcar alerta como lido

Suíte: [Alertas de suspeita para vizinhos] Produtor - Listar alertas e marcar como lido · Tags: funcional; positivo

| vizinho |
| --- |
| produtor.teste04@valence.dev |

```
Identificador: CT-4.1.2-03
Objetivo: verificar a marcação de leitura.
PBI e critério de aceite: [Alertas de suspeita para vizinhos] Produtor - Listar alertas e marcar como lido; critério "marcar como lido recebe HTTP 200 e o alerta deixa de ser destacado".
Técnica: transição de estado (não lido para lido).
Preparação: caso CT-4.1.2-02 executado.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: abertura de alerta no app e PATCH no Swagger. Valores em Parameter values.
Outputs esperados: alertas marcados como lidos e contador atualizado.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: alerta continua destacado ou PATCH com código diferente de 200.
```

## CT-4.1.2-04 · Validar marcar como lido alerta de outro produtor e inexistente

Suíte: [Alertas de suspeita para vizinhos] Produtor - Listar alertas e marcar como lido · Tags: funcional; negativo

| apoio | inexistente |
| --- | --- |
| produtor.teste08@valence.dev | 999999 |

```
Identificador: CT-4.1.2-04
Objetivo: verificar que só o dono marca o alerta como lido.
PBI e critério de aceite: [Alertas de suspeita para vizinhos] Produtor - Listar alertas e marcar como lido; critério "alerta de outro produtor ou inexistente recebe HTTP 404 ao marcar como lido".
Técnica: partição de equivalência, classes inválidas (outro dono e id inexistente).
Preparação: massa de alertas: Sítio Boa Vista do produtor.teste01@valence.dev (latitude -21.1775, longitude -47.8103, MILHO e TOMATE); Fazenda Vizinha do produtor.teste04@valence.dev a 5 km (latitude -21.1325339, longitude -47.8103, MILHO e TOMATE); produtor de apoio produtor.teste08@valence.dev, senha Senha@2026, com Chácara Limite a 10 km (latitude -21.0875679, MILHO), Sítio Além a 10,1 km (latitude -21.0866685, MILHO), Horta Perto a 3 km (latitude -21.1505204, só TOMATE) e Rancho Colado a 0,3 km (latitude -21.174802, MILHO), todas com longitude -47.8103. Alerta não lido do produtor.teste04.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: PATCH em alerta de outro produtor e em id inexistente. Valores em Parameter values.
Outputs esperados: HTTP 404 nos dois casos e alerta do vizinho sem mudança.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: alerta de outro produtor marcado como lido.
```

## CT-4.1.2-05 · Validar consulta de alertas por agrônomo e gestor

Suíte: [Alertas de suspeita para vizinhos] Produtor - Listar alertas e marcar como lido · Tags: funcional; negativo

| agronomo | gestor |
| --- | --- |
| agronomo do README | gestor do README |

```
Identificador: CT-4.1.2-05
Objetivo: verificar que só o produtor consulta alertas.
PBI e critério de aceite: [Alertas de suspeita para vizinhos] Produtor - Listar alertas e marcar como lido; critério "somente o papel PRODUTOR consulta alertas; AGRONOMO e GESTOR recebem HTTP 403".
Técnica: tabela de decisão por papel.
Preparação: usuários de seed do README; Swagger.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: consulta de alertas com papéis AGRONOMO e GESTOR. Valores em Parameter values.
Outputs esperados: HTTP 403 nos dois papéis.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: lista devolvida para agrônomo ou gestor.
```

## CT-4.1.2-06 · Validar mensagem de lista vazia de alertas

Suíte: [Alertas de suspeita para vizinhos] Produtor - Listar alertas e marcar como lido · Tags: funcional; positivo

| email | senha |
| --- | --- |
| produtor.teste09@valence.dev | Senha@2026 |

```
Identificador: CT-4.1.2-06
Objetivo: verificar a mensagem quando não há alertas.
PBI e critério de aceite: [Alertas de suspeita para vizinhos] Produtor - Listar alertas e marcar como lido; critério "lista vazia mostra Nenhum alerta para as suas propriedades.".
Técnica: partição de equivalência (lista vazia).
Preparação: e-mail produtor.teste09@valence.dev ainda não cadastrado; app e API online.
Ambiente: Android com o app Valence (Firebase App Distribution) e API Java no Azure App Service.
Inputs: produtor novo sem propriedades. Valores em Parameter values.
Outputs esperados: mensagem de lista vazia.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: tela em branco, erro ou mensagem diferente.
```

## CT-4.2.1-01 · Validar alerta confirmado pelo laudo do agrônomo

Suíte: [Confirmação e encerramento de alertas] Produtor vizinho - Ver alerta confirmado pelo laudo · Tags: funcional; positivo

| vizinho | praga | parecer |
| --- | --- | --- |
| produtor.teste04@valence.dev | Ferrugem-comum | Pústulas típicas de ferrugem-comum confirmadas pela foto e pela descrição. |

```
Identificador: CT-4.2.1-01
Objetivo: verificar a mudança do alerta para CONFIRMADO após o laudo.
PBI e critério de aceite: [Confirmação e encerramento de alertas] Produtor vizinho - Ver alerta confirmado pelo laudo; critério "laudo CONFIRMADA muda todos os alertas SUSPEITA da ocorrência para CONFIRMADO e mostra a praga confirmada; mudança para CONFIRMADO volta a marcar o alerta como não lido; o app mostra Confirmado pelo agrônomo; a propriedade de origem continua sem alerta".
Técnica: transição de estado (SUSPEITA para CONFIRMADO).
Preparação: massa de alertas: Sítio Boa Vista do produtor.teste01@valence.dev (latitude -21.1775, longitude -47.8103, MILHO e TOMATE); Fazenda Vizinha do produtor.teste04@valence.dev a 5 km (latitude -21.1325339, longitude -47.8103, MILHO e TOMATE); produtor de apoio produtor.teste08@valence.dev, senha Senha@2026, com Chácara Limite a 10 km (latitude -21.0875679, MILHO), Sítio Além a 10,1 km (latitude -21.0866685, MILHO), Horta Perto a 3 km (latitude -21.1505204, só TOMATE) e Rancho Colado a 0,3 km (latitude -21.174802, MILHO), todas com longitude -47.8103. Ocorrência de MILHO do produtor.teste01 no Sítio Boa Vista em TRIADA (fluxo do CT-3.1.1-01). Alerta SUSPEITA para a Fazenda Vizinha; agrônomo do README; Swagger autorizado com o token do agrônomo.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: laudo CONFIRMADA para ocorrência com alerta SUSPEITA. Valores em Parameter values.
Outputs esperados: alerta CONFIRMADO, não lido e com a praga confirmada.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: alerta continua SUSPEITA, fica como lido ou mostra outra praga.
```

## CT-4.2.1-02 · Validar criação de alerta confirmado para propriedade sem alerta anterior

Suíte: [Confirmação e encerramento de alertas] Produtor vizinho - Ver alerta confirmado pelo laudo · Tags: funcional; positivo

| praga | vizinho |
| --- | --- |
| Ferrugem-comum | produtor.teste04@valence.dev |

```
Identificador: CT-4.2.1-02
Objetivo: verificar que o laudo confirmado cria os alertas que faltam no raio.
PBI e critério de aceite: [Confirmação e encerramento de alertas] Produtor vizinho - Ver alerta confirmado pelo laudo; critério "laudo CONFIRMADA cria alertas CONFIRMADO para as propriedades com a mesma cultura no raio de 10 km que ainda não tinham alerta, inclusive quando a ocorrência não gerou alerta automático; a propriedade de origem continua sem alerta".
Técnica: tabela de decisão (laudo CONFIRMADA e ocorrência sem alerta).
Preparação: massa de alertas: Sítio Boa Vista do produtor.teste01@valence.dev (latitude -21.1775, longitude -47.8103, MILHO e TOMATE); Fazenda Vizinha do produtor.teste04@valence.dev a 5 km (latitude -21.1325339, longitude -47.8103, MILHO e TOMATE); produtor de apoio produtor.teste08@valence.dev, senha Senha@2026, com Chácara Limite a 10 km (latitude -21.0875679, MILHO), Sítio Além a 10,1 km (latitude -21.0866685, MILHO), Horta Perto a 3 km (latitude -21.1505204, só TOMATE) e Rancho Colado a 0,3 km (latitude -21.174802, MILHO), todas com longitude -47.8103. Caso CT-4.1.1-06 executado; agrônomo do README; Swagger autorizado com o token do agrônomo.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: laudo CONFIRMADA para ocorrência em EM_ANALISE. Valores em Parameter values.
Outputs esperados: alerta CONFIRMADO criado para a Fazenda Vizinha.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: nenhum alerta criado ou alerta para a propriedade de origem.
```

## CT-4.2.1-03 · Validar que pedido de mais informações mantém o alerta como suspeita

Suíte: [Confirmação e encerramento de alertas] Produtor vizinho - Ver alerta confirmado pelo laudo · Tags: funcional; negativo

| vizinho | decisao |
| --- | --- |
| produtor.teste04@valence.dev | MAIS_INFORMACOES |

```
Identificador: CT-4.2.1-03
Objetivo: verificar que o pedido de mais informações não confirma o alerta.
PBI e critério de aceite: [Confirmação e encerramento de alertas] Produtor vizinho - Ver alerta confirmado pelo laudo; critério "laudo MAIS_INFORMACOES mantém os alertas como SUSPEITA".
Técnica: tabela de decisão por tipo de laudo.
Preparação: massa de alertas: Sítio Boa Vista do produtor.teste01@valence.dev (latitude -21.1775, longitude -47.8103, MILHO e TOMATE); Fazenda Vizinha do produtor.teste04@valence.dev a 5 km (latitude -21.1325339, longitude -47.8103, MILHO e TOMATE); produtor de apoio produtor.teste08@valence.dev, senha Senha@2026, com Chácara Limite a 10 km (latitude -21.0875679, MILHO), Sítio Além a 10,1 km (latitude -21.0866685, MILHO), Horta Perto a 3 km (latitude -21.1505204, só TOMATE) e Rancho Colado a 0,3 km (latitude -21.174802, MILHO), todas com longitude -47.8103. Nova ocorrência de MILHO do produtor.teste01 em TRIADA com alerta SUSPEITA; agrônomo do README; Swagger autorizado com o token do agrônomo.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: laudo MAIS_INFORMACOES. Valores em Parameter values.
Outputs esperados: alerta SUSPEITA sem mudança.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: alerta muda para CONFIRMADO ou ENCERRADO.
```

## CT-4.2.1-04 · Validar que alerta confirmado não volta a suspeita

Suíte: [Confirmação e encerramento de alertas] Produtor vizinho - Ver alerta confirmado pelo laudo · Tags: funcional; negativo

| eventoId | vizinho |
| --- | --- |
| 7a1d2e3f-4b5c-4d6e-8f70-91a2b3c4d5e6 | produtor.teste04@valence.dev |

```
Identificador: CT-4.2.1-04
Objetivo: verificar que a confirmação do agrônomo não é desfeita.
PBI e critério de aceite: [Confirmação e encerramento de alertas] Produtor vizinho - Ver alerta confirmado pelo laudo; critério "alerta CONFIRMADO nunca volta a SUSPEITA".
Técnica: transição de estado inválida (CONFIRMADO para SUSPEITA).
Preparação: caso CT-4.2.1-01 executado; acesso ao painel do CloudAMQP.
Ambiente: API Java no Azure App Service, painel de gerenciamento do CloudAMQP (RabbitMQ), Swagger da API e app Valence no Android.
Inputs: novo evento de triagem e pedido de reprocessamento depois do laudo. Valores em Parameter values.
Outputs esperados: alerta mantido como CONFIRMADO.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: alerta volta a SUSPEITA.
```

## CT-4.2.2-01 · Validar alerta encerrado pelo laudo de descarte

Suíte: [Confirmação e encerramento de alertas] Produtor vizinho - Ver alerta encerrado por descarte · Tags: funcional; positivo

| vizinho | parecer |
| --- | --- |
| produtor.teste04@valence.dev | Manchas causadas por deficiência nutricional, sem sinal de praga ou doença. |

```
Identificador: CT-4.2.2-01
Objetivo: verificar o encerramento do alerta quando o caso é descartado.
PBI e critério de aceite: [Confirmação e encerramento de alertas] Produtor vizinho - Ver alerta encerrado por descarte; critério "laudo DESCARTADA muda todos os alertas SUSPEITA da ocorrência para ENCERRADO; mudança para ENCERRADO volta a marcar o alerta como não lido; o app mostra Encerrado: caso descartado".
Técnica: transição de estado (SUSPEITA para ENCERRADO).
Preparação: massa de alertas: Sítio Boa Vista do produtor.teste01@valence.dev (latitude -21.1775, longitude -47.8103, MILHO e TOMATE); Fazenda Vizinha do produtor.teste04@valence.dev a 5 km (latitude -21.1325339, longitude -47.8103, MILHO e TOMATE); produtor de apoio produtor.teste08@valence.dev, senha Senha@2026, com Chácara Limite a 10 km (latitude -21.0875679, MILHO), Sítio Além a 10,1 km (latitude -21.0866685, MILHO), Horta Perto a 3 km (latitude -21.1505204, só TOMATE) e Rancho Colado a 0,3 km (latitude -21.174802, MILHO), todas com longitude -47.8103. Nova ocorrência de MILHO do produtor.teste01 em TRIADA com alerta SUSPEITA; agrônomo do README; Swagger autorizado com o token do agrônomo.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: laudo DESCARTADA. Valores em Parameter values.
Outputs esperados: alerta ENCERRADO e não lido.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: alerta continua SUSPEITA ou fica como lido.
```

## CT-4.2.2-02 · Validar alerta encerrado pela exclusão da ocorrência pelo dono

Suíte: [Confirmação e encerramento de alertas] Produtor vizinho - Ver alerta encerrado por descarte · Tags: funcional; positivo

| email | vizinho |
| --- | --- |
| produtor.teste01@valence.dev | produtor.teste04@valence.dev |

```
Identificador: CT-4.2.2-02
Objetivo: verificar o encerramento do alerta quando o dono exclui a ocorrência.
PBI e critério de aceite: [Confirmação e encerramento de alertas] Produtor vizinho - Ver alerta encerrado por descarte; critério "exclusão da ocorrência pelo dono também muda os alertas SUSPEITA para ENCERRADO".
Técnica: transição de estado (SUSPEITA para ENCERRADO por exclusão).
Preparação: massa de alertas: Sítio Boa Vista do produtor.teste01@valence.dev (latitude -21.1775, longitude -47.8103, MILHO e TOMATE); Fazenda Vizinha do produtor.teste04@valence.dev a 5 km (latitude -21.1325339, longitude -47.8103, MILHO e TOMATE); produtor de apoio produtor.teste08@valence.dev, senha Senha@2026, com Chácara Limite a 10 km (latitude -21.0875679, MILHO), Sítio Além a 10,1 km (latitude -21.0866685, MILHO), Horta Perto a 3 km (latitude -21.1505204, só TOMATE) e Rancho Colado a 0,3 km (latitude -21.174802, MILHO), todas com longitude -47.8103. Nova ocorrência de MILHO do produtor.teste01 em TRIADA com alerta SUSPEITA.
Ambiente: Android com o app Valence (Firebase App Distribution) e API Java no Azure App Service.
Inputs: exclusão da ocorrência TRIADA. Valores em Parameter values.
Outputs esperados: alerta ENCERRADO para o vizinho.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: alerta continua SUSPEITA depois da exclusão.
```

## CT-4.2.2-03 · Validar que pedido de mais informações não encerra o alerta

Suíte: [Confirmação e encerramento de alertas] Produtor vizinho - Ver alerta encerrado por descarte · Tags: funcional; negativo

| decisao | vizinho |
| --- | --- |
| MAIS_INFORMACOES | produtor.teste04@valence.dev |

```
Identificador: CT-4.2.2-03
Objetivo: verificar que o pedido de mais informações não encerra o alerta.
PBI e critério de aceite: [Confirmação e encerramento de alertas] Produtor vizinho - Ver alerta encerrado por descarte; critério "laudo MAIS_INFORMACOES não encerra os alertas".
Técnica: tabela de decisão por tipo de laudo.
Preparação: massa de alertas: Sítio Boa Vista do produtor.teste01@valence.dev (latitude -21.1775, longitude -47.8103, MILHO e TOMATE); Fazenda Vizinha do produtor.teste04@valence.dev a 5 km (latitude -21.1325339, longitude -47.8103, MILHO e TOMATE); produtor de apoio produtor.teste08@valence.dev, senha Senha@2026, com Chácara Limite a 10 km (latitude -21.0875679, MILHO), Sítio Além a 10,1 km (latitude -21.0866685, MILHO), Horta Perto a 3 km (latitude -21.1505204, só TOMATE) e Rancho Colado a 0,3 km (latitude -21.174802, MILHO), todas com longitude -47.8103. Nova ocorrência de MILHO do produtor.teste01 em TRIADA com alerta SUSPEITA; agrônomo do README; Swagger autorizado com o token do agrônomo.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: laudo MAIS_INFORMACOES. Valores em Parameter values.
Outputs esperados: alerta sem encerramento.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: alerta ENCERRADO depois de MAIS_INFORMACOES.
```

## CT-4.2.2-04 · Validar que alerta encerrado não volta a suspeita

Suíte: [Confirmação e encerramento de alertas] Produtor vizinho - Ver alerta encerrado por descarte · Tags: funcional; negativo

| eventoId | vizinho |
| --- | --- |
| 9b8c7d6e-5f40-4a3b-9c2d-1e0f9a8b7c6d | produtor.teste04@valence.dev |

```
Identificador: CT-4.2.2-04
Objetivo: verificar que o encerramento não é desfeito.
PBI e critério de aceite: [Confirmação e encerramento de alertas] Produtor vizinho - Ver alerta encerrado por descarte; critério "alerta ENCERRADO nunca volta a SUSPEITA".
Técnica: transição de estado inválida (ENCERRADO para SUSPEITA).
Preparação: caso CT-4.2.2-01 executado; acesso ao painel do CloudAMQP.
Ambiente: API Java no Azure App Service, painel de gerenciamento do CloudAMQP (RabbitMQ), Swagger da API e app Valence no Android.
Inputs: novo evento de triagem e pedido de reprocessamento depois do descarte. Valores em Parameter values.
Outputs esperados: alerta mantido como ENCERRADO.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: alerta volta a SUSPEITA.
```

