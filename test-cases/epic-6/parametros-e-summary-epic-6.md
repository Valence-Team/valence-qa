# Feature epic.6 - Parameter values e Summary

## CT-6.1.1-01 · Validar publicação de post no mural do município

Suíte: [Posts e comentários] Usuário - Publicar post no mural do município · Tags: funcional; positivo

| email | senha | texto |
| --- | --- | --- |
| produtor.teste01@valence.dev | Senha@2026 | Alguém mais viu cigarrinha no milho perto da estrada velha? |

```
Identificador: CT-6.1.1-01
Objetivo: verificar a publicação de post no mural.
PBI e critério de aceite: [Posts e comentários] Usuário - Publicar post no mural do município; critério "publicação com sucesso recebe HTTP 201, o post nasce ATIVO e aparece no topo do mural".
Técnica: partição de equivalência, classe válida.
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: texto válido no mural do município. Valores em Parameter values.
Outputs esperados: post ATIVO no topo do mural.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: post ausente, fora do topo ou com outro status.
```

## CT-6.1.1-02 · Validar listagem do mural no município do perfil

Suíte: [Posts e comentários] Usuário - Publicar post no mural do município · Tags: funcional; positivo

| email | municipio |
| --- | --- |
| produtor.teste08@valence.dev | Ribeirão Preto/SP |

```
Identificador: CT-6.1.1-02
Objetivo: verificar a listagem do mural.
PBI e critério de aceite: [Posts e comentários] Usuário - Publicar post no mural do município; critério "o mural abre no município e na UF do perfil do usuário e lista somente posts ATIVO, paginados (10 por página), do mais recente para o mais antigo; cada post mostra texto, nome e papel do autor, data e quantidade de comentários; post de caso confirmado mostra a marca Caso confirmado pelo agrônomo".
Técnica: partição de equivalência, classe válida.
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Post de caso confirmado (CT-5.2.1-01) e um post OCULTO no município.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: mural de Ribeirão Preto. Valores em Parameter values.
Outputs esperados: lista ordenada, paginada, só com posts ATIVO e com a marca no caso confirmado.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: post OCULTO ou REMOVIDO na lista, ordem errada ou marca ausente.
```

## CT-6.1.1-03 · Validar post com 5 e com 1000 caracteres

Suíte: [Posts e comentários] Usuário - Publicar post no mural do município · Tags: funcional; positivo

| texto5 | tamanho |
| --- | --- |
| Chuva | 1000 |

```
Identificador: CT-6.1.1-03
Objetivo: verificar os limites válidos do texto do post.
PBI e critério de aceite: [Posts e comentários] Usuário - Publicar post no mural do município; critério "post exige texto de 5 a 1000 caracteres, município e UF".
Técnica: análise de valor limite (5 e 1000).
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Texto de 1000 caracteres preparado num editor.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: textos com 5 e 1000 caracteres. Valores em Parameter values.
Outputs esperados: HTTP 201 nos dois.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 400 em valor válido.
```

## CT-6.1.1-04 · Validar post com texto fora do limite e sem município ou UF

Suíte: [Posts e comentários] Usuário - Publicar post no mural do município · Tags: funcional; negativo

| texto4 | tamanho |
| --- | --- |
| Ajud | 1001 |

```
Identificador: CT-6.1.1-04
Objetivo: verificar a validação do post.
PBI e critério de aceite: [Posts e comentários] Usuário - Publicar post no mural do município; critério "post exige texto de 5 a 1000 caracteres, município e UF; fora do limite recebe HTTP 400 com a lista de campos".
Técnica: análise de valor limite (4 e 1001) e partição de equivalência (campos ausentes).
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Texto de 1001 caracteres preparado.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: texto com 4 e 1001 caracteres e post sem município e UF. Valores em Parameter values.
Outputs esperados: HTTP 400 com os campos.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: post criado com dado inválido.
```

## CT-6.1.1-05 · Validar acesso ao mural sem token

Suíte: [Posts e comentários] Usuário - Publicar post no mural do município · Tags: funcional; negativo

| texto |
| --- |
| Teste de post sem login |

```
Identificador: CT-6.1.1-05
Objetivo: verificar que o mural exige autenticação.
PBI e critério de aceite: [Posts e comentários] Usuário - Publicar post no mural do município; critério "somente usuário autenticado acessa o mural; requisição sem token recebe HTTP 401".
Técnica: partição de equivalência (sem token).
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: consulta e publicação sem token. Valores em Parameter values.
Outputs esperados: HTTP 401 nos dois.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: mural devolvido ou post criado sem token.
```

## CT-6.1.1-06 · Validar consulta de post oculto pelo autor e pelos moderadores

Suíte: [Posts e comentários] Usuário - Publicar post no mural do município · Tags: funcional; positivo

| autor | agronomo | gestor |
| --- | --- | --- |
| produtor.teste01@valence.dev | agrônomo do README | gestor do README |

```
Identificador: CT-6.1.1-06
Objetivo: verificar quem pode ver um post oculto.
PBI e critério de aceite: [Posts e comentários] Usuário - Publicar post no mural do município; critério "post OCULTO só é visível ao autor, AGRONOMO e GESTOR".
Técnica: tabela de decisão por papel.
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Post do produtor.teste01 em OCULTO (fluxo do CT-6.2.2-03).
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: consulta do post oculto por autor, agrônomo e gestor. Valores em Parameter values.
Outputs esperados: HTTP 200 para os três.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: post negado ao autor ou aos moderadores.
```

## CT-6.1.1-07 · Validar consulta de post oculto por outro produtor, removido e inexistente

Suíte: [Posts e comentários] Usuário - Publicar post no mural do município · Tags: funcional; negativo

| outro | inexistente |
| --- | --- |
| produtor.teste08@valence.dev | 999999 |

```
Identificador: CT-6.1.1-07
Objetivo: verificar o bloqueio de posts ocultos, removidos e inexistentes.
PBI e critério de aceite: [Posts e comentários] Usuário - Publicar post no mural do município; critério "post OCULTO só é visível ao autor, AGRONOMO e GESTOR; post REMOVIDO ou inexistente recebe HTTP 404".
Técnica: partição de equivalência, classes inválidas.
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Um post OCULTO e um REMOVIDO.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: consultas a post oculto, removido e inexistente. Valores em Parameter values.
Outputs esperados: nenhum post devolvido; HTTP 404.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: post oculto ou removido devolvido.
```

## CT-6.1.2-01 · Validar comentário em post ativo

Suíte: [Posts e comentários] Usuário - Comentar post · Tags: funcional; positivo

| email | texto |
| --- | --- |
| produtor.teste08@valence.dev | Vi também, no talhão do lado da represa. |

```
Identificador: CT-6.1.2-01
Objetivo: verificar o comentário em post ativo.
PBI e critério de aceite: [Posts e comentários] Usuário - Comentar post; critério "comentário com sucesso recebe HTTP 201 e a quantidade de comentários do post aumenta em 1".
Técnica: partição de equivalência, classe válida.
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Post ATIVO do produtor.teste01.
Ambiente: Android com o app Valence (Firebase App Distribution) e API Java no Azure App Service.
Inputs: comentário válido. Valores em Parameter values.
Outputs esperados: comentário publicado e contador +1.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: comentário ausente ou contador sem mudança.
```

## CT-6.1.2-02 · Validar comentário com 1 e com 500 caracteres

Suíte: [Posts e comentários] Usuário - Comentar post · Tags: funcional; positivo

| texto1 | tamanho |
| --- | --- |
| K | 500 |

```
Identificador: CT-6.1.2-02
Objetivo: verificar os limites válidos do comentário.
PBI e critério de aceite: [Posts e comentários] Usuário - Comentar post; critério "comentário exige texto de 1 a 500 caracteres".
Técnica: análise de valor limite (1 e 500).
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Post ATIVO; texto de 500 caracteres preparado.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: comentários com 1 e 500 caracteres. Valores em Parameter values.
Outputs esperados: HTTP 201 nos dois.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 400 em valor válido.
```

## CT-6.1.2-03 · Validar comentário vazio e acima de 500 caracteres

Suíte: [Posts e comentários] Usuário - Comentar post · Tags: funcional; negativo

| tamanho |
| --- |
| 501 |

```
Identificador: CT-6.1.2-03
Objetivo: verificar a validação do comentário.
PBI e critério de aceite: [Posts e comentários] Usuário - Comentar post; critério "comentário vazio ou acima do limite recebe HTTP 400 com a mensagem do campo".
Técnica: análise de valor limite (0 e 501).
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Post ATIVO; texto de 501 caracteres preparado.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: comentários vazio e com 501 caracteres. Valores em Parameter values.
Outputs esperados: HTTP 400 nos dois.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: comentário gravado com dado inválido.
```

## CT-6.1.2-04 · Validar comentário em post oculto, removido e inexistente

Suíte: [Posts e comentários] Usuário - Comentar post · Tags: funcional; negativo

| outro | inexistente |
| --- | --- |
| produtor.teste08@valence.dev | 999999 |

```
Identificador: CT-6.1.2-04
Objetivo: verificar que só posts ativos recebem comentários.
PBI e critério de aceite: [Posts e comentários] Usuário - Comentar post; critério "comentário só é aceito em post ATIVO; post inexistente, OCULTO ou REMOVIDO recebe HTTP 404".
Técnica: partição de equivalência, classes inválidas.
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Um post OCULTO e um REMOVIDO.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: comentários em post oculto, removido e inexistente. Valores em Parameter values.
Outputs esperados: HTTP 404 nos três.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: comentário aceito fora de post ATIVO.
```

## CT-6.1.2-05 · Validar comentário sem token

Suíte: [Posts e comentários] Usuário - Comentar post · Tags: funcional; negativo

| texto |
| --- |
| Comentário sem login |

```
Identificador: CT-6.1.2-05
Objetivo: verificar que comentar exige autenticação.
PBI e critério de aceite: [Posts e comentários] Usuário - Comentar post; critério "somente usuário autenticado comenta; requisição sem token recebe HTTP 401".
Técnica: partição de equivalência (sem token).
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Post ATIVO.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: comentário sem token. Valores em Parameter values.
Outputs esperados: HTTP 401.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: comentário gravado sem token.
```

## CT-6.1.2-06 · Validar ordem e paginação dos comentários

Suíte: [Posts e comentários] Usuário - Comentar post · Tags: funcional; positivo

| tamanho |
| --- |
| 20 |

```
Identificador: CT-6.1.2-06
Objetivo: verificar a listagem dos comentários.
PBI e critério de aceite: [Posts e comentários] Usuário - Comentar post; critério "comentários listados do mais antigo para o mais novo, paginados (20 por página), com texto, nome e papel do autor e data".
Técnica: partição de equivalência, classe válida.
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Post com pelo menos 3 comentários.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: lista de comentários. Valores em Parameter values.
Outputs esperados: lista ordenada e paginada.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: ordem inversa ou campo ausente.
```

## CT-6.1.3-01 · Validar edição do post pelo autor

Suíte: [Posts e comentários] Autor - Editar e remover meu post · Tags: funcional; positivo

| email | texto |
| --- | --- |
| produtor.teste01@valence.dev | Atualizando: a cigarrinha já apareceu em três talhões. |

```
Identificador: CT-6.1.3-01
Objetivo: verificar a edição do post pelo autor.
PBI e critério de aceite: [Posts e comentários] Autor - Editar e remover meu post; critério "os botões Editar e Remover aparecem somente nos posts do próprio autor; somente o autor edita o texto do post (5 a 1000 caracteres), com HTTP 200".
Técnica: partição de equivalência, classe válida.
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Post ATIVO do produtor.teste01.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: novo texto válido. Valores em Parameter values.
Outputs esperados: post editado.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: botões ausentes para o autor ou edição recusada.
```

## CT-6.1.3-02 · Validar edição do post por outro usuário

Suíte: [Posts e comentários] Autor - Editar e remover meu post · Tags: funcional; negativo

| outro |
| --- |
| produtor.teste08@valence.dev |

```
Identificador: CT-6.1.3-02
Objetivo: verificar que só o autor edita o post.
PBI e critério de aceite: [Posts e comentários] Autor - Editar e remover meu post; critério "outro usuário recebe HTTP 403 ao editar; os botões Editar e Remover aparecem somente nos posts do próprio autor".
Técnica: tabela de decisão por autor.
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Post ATIVO do produtor.teste01.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: edição por outro produtor. Valores em Parameter values.
Outputs esperados: HTTP 403 e texto sem mudança.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: post editado por quem não é autor.
```

## CT-6.1.3-03 · Validar edição do post com texto fora do limite

Suíte: [Posts e comentários] Autor - Editar e remover meu post · Tags: funcional; negativo

| texto4 | tamanho |
| --- | --- |
| Erro | 1001 |

```
Identificador: CT-6.1.3-03
Objetivo: verificar a validação na edição.
PBI e critério de aceite: [Posts e comentários] Autor - Editar e remover meu post; critério "somente o autor edita o texto do post (5 a 1000 caracteres)".
Técnica: análise de valor limite (4 e 1001).
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Post ATIVO do produtor.teste01; texto de 1001 caracteres preparado.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: edições com 4 e 1001 caracteres. Valores em Parameter values.
Outputs esperados: HTTP 400 nos dois.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: post salvo com texto inválido.
```

## CT-6.1.3-04 · Validar remoção do post pelo autor com confirmação

Suíte: [Posts e comentários] Autor - Editar e remover meu post · Tags: funcional; positivo

| email |
| --- |
| produtor.teste01@valence.dev |

```
Identificador: CT-6.1.3-04
Objetivo: verificar a remoção lógica pelo autor.
PBI e critério de aceite: [Posts e comentários] Autor - Editar e remover meu post; critério "o app pede confirmação antes de remover: Deseja remover este post?; remoção pelo autor recebe HTTP 204; o post passa a REMOVIDO e some do mural".
Técnica: transição de estado (ATIVO para REMOVIDO).
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Post ATIVO do produtor.teste01.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: remoção confirmada pelo autor. Valores em Parameter values.
Outputs esperados: post REMOVIDO e fora do mural.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: remoção sem confirmação ou post ainda no mural.
```

## CT-6.1.3-05 · Validar remoção de post pelo agrônomo e pelo gestor

Suíte: [Posts e comentários] Autor - Editar e remover meu post · Tags: funcional; positivo

| agronomo | gestor |
| --- | --- |
| agrônomo do README | gestor do README |

```
Identificador: CT-6.1.3-05
Objetivo: verificar a remoção por moderadores.
PBI e critério de aceite: [Posts e comentários] Autor - Editar e remover meu post; critério "AGRONOMO e GESTOR veem o botão Remover em qualquer post; remoção pelo AGRONOMO ou GESTOR recebe HTTP 204".
Técnica: tabela de decisão por papel.
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Dois posts ATIVO do produtor.teste01.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: remoções feitas por agrônomo e gestor. Valores em Parameter values.
Outputs esperados: posts REMOVIDO.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: botão ausente ou remoção recusada para moderador.
```

## CT-6.1.3-06 · Validar remoção de post por outro produtor

Suíte: [Posts e comentários] Autor - Editar e remover meu post · Tags: funcional; negativo

| outro |
| --- |
| produtor.teste08@valence.dev |

```
Identificador: CT-6.1.3-06
Objetivo: verificar que outro produtor não remove o post.
PBI e critério de aceite: [Posts e comentários] Autor - Editar e remover meu post; critério "outro produtor que tenta remover recebe HTTP 403".
Técnica: tabela de decisão por papel e autor.
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Post ATIVO do produtor.teste01.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: DELETE por outro produtor. Valores em Parameter values.
Outputs esperados: HTTP 403 e post mantido.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: post removido por outro produtor.
```

## CT-6.1.3-07 · Validar comentário e consulta em post removido

Suíte: [Posts e comentários] Autor - Editar e remover meu post · Tags: funcional; negativo

| outro |
| --- |
| produtor.teste08@valence.dev |

```
Identificador: CT-6.1.3-07
Objetivo: verificar que post removido fica inacessível.
PBI e critério de aceite: [Posts e comentários] Autor - Editar e remover meu post; critério "post removido não aceita comentário e sua consulta pelo id recebe HTTP 404".
Técnica: partição de equivalência, classe inválida (post REMOVIDO).
Preparação: caso CT-6.1.3-04 executado.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: comentário e consulta em post removido. Valores em Parameter values.
Outputs esperados: HTTP 404 nos dois.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: comentário aceito ou post devolvido.
```

## CT-6.2.1-01 · Validar denúncia de post de outro usuário

Suíte: [Denúncia com análise de IA] Usuário - Denunciar post · Tags: funcional; positivo

| email | motivo |
| --- | --- |
| produtor.teste08@valence.dev | O post indica produto e dose sem orientação técnica. |

```
Identificador: CT-6.2.1-01
Objetivo: verificar a denúncia de post.
PBI e critério de aceite: [Denúncia com análise de IA] Usuário - Denunciar post; critério "o botão Denunciar aparece nos posts de outros usuários e abre um campo para o motivo; denúncia com sucesso recebe HTTP 201 e o app mostra Denúncia enviada para análise.".
Técnica: partição de equivalência, classe válida.
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. LLM disponível na API (chave válida). Post ATIVO do produtor.teste01.
Ambiente: Android com o app Valence (Firebase App Distribution) e API Java no Azure App Service.
Inputs: motivo válido. Valores em Parameter values.
Outputs esperados: denúncia registrada e mensagem exibida.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: botão ausente, mensagem diferente ou erro.
```

## CT-6.2.1-02 · Validar motivo da denúncia com 10 e com 500 caracteres

Suíte: [Denúncia com análise de IA] Usuário - Denunciar post · Tags: funcional; positivo

| outro | motivo10 | tamanho |
| --- | --- | --- |
| produtor.teste08@valence.dev | Spam aqui! | 500 |

```
Identificador: CT-6.2.1-02
Objetivo: verificar os limites válidos do motivo.
PBI e critério de aceite: [Denúncia com análise de IA] Usuário - Denunciar post; critério "denúncia exige motivo de 10 a 500 caracteres".
Técnica: análise de valor limite (10 e 500).
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. LLM disponível na API (chave válida). Dois posts ATIVO do produtor.teste01; texto de 500 caracteres preparado.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: motivos com 10 e 500 caracteres. Valores em Parameter values.
Outputs esperados: HTTP 201 nos dois.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: HTTP 400 em valor válido.
```

## CT-6.2.1-03 · Validar denúncia sem motivo, com 9 e com 501 caracteres

Suíte: [Denúncia com análise de IA] Usuário - Denunciar post · Tags: funcional; negativo

| motivo9 | tamanho |
| --- | --- |
| Spam aqui | 501 |

```
Identificador: CT-6.2.1-03
Objetivo: verificar a validação do motivo.
PBI e critério de aceite: [Denúncia com análise de IA] Usuário - Denunciar post; critério "motivo ausente ou fora do limite recebe HTTP 400 com a mensagem do campo".
Técnica: análise de valor limite (9 e 501) e partição de equivalência (ausente).
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Post ATIVO; texto de 501 caracteres preparado.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: motivo ausente, com 9 e com 501 caracteres. Valores em Parameter values.
Outputs esperados: HTTP 400 nos três.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: denúncia gravada com motivo inválido.
```

## CT-6.2.1-04 · Validar denúncia em post oculto, removido e inexistente

Suíte: [Denúncia com análise de IA] Usuário - Denunciar post · Tags: funcional; negativo

| outro | inexistente |
| --- | --- |
| produtor.teste08@valence.dev | 999999 |

```
Identificador: CT-6.2.1-04
Objetivo: verificar que só posts ativos recebem denúncia.
PBI e critério de aceite: [Denúncia com análise de IA] Usuário - Denunciar post; critério "denúncia só é aceita em post ATIVO; post inexistente, OCULTO ou REMOVIDO recebe HTTP 404".
Técnica: partição de equivalência, classes inválidas.
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Um post OCULTO e um REMOVIDO.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: denúncias em post oculto, removido e inexistente. Valores em Parameter values.
Outputs esperados: HTTP 404 nos três.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: denúncia aceita fora de post ATIVO.
```

## CT-6.2.1-05 · Validar denúncia do próprio post

Suíte: [Denúncia com análise de IA] Usuário - Denunciar post · Tags: funcional; negativo

| autor |
| --- |
| produtor.teste01@valence.dev |

```
Identificador: CT-6.2.1-05
Objetivo: verificar o bloqueio de denúncia do próprio post.
PBI e critério de aceite: [Denúncia com análise de IA] Usuário - Denunciar post; critério "o autor que denuncia o próprio post recebe HTTP 422 com a mensagem Não é possível denunciar o próprio post.".
Técnica: tabela de decisão (denunciante igual ao autor).
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Post ATIVO do produtor.teste01.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: denúncia feita pelo autor. Valores em Parameter values.
Outputs esperados: HTTP 422 com a mensagem.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: denúncia aceita ou mensagem diferente.
```

## CT-6.2.1-06 · Validar segunda denúncia do mesmo usuário no mesmo post

Suíte: [Denúncia com análise de IA] Usuário - Denunciar post · Tags: funcional; negativo

| outro |
| --- |
| produtor.teste08@valence.dev |

```
Identificador: CT-6.2.1-06
Objetivo: verificar o bloqueio de denúncia repetida.
PBI e critério de aceite: [Denúncia com análise de IA] Usuário - Denunciar post; critério "segunda denúncia do mesmo usuário no mesmo post recebe HTTP 409 com a mensagem Você já denunciou este post.".
Técnica: partição de equivalência, classe inválida (denúncia duplicada).
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. LLM disponível na API (chave válida). Post ATIVO do produtor.teste01 com conteúdo inofensivo.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: duas denúncias iguais. Valores em Parameter values.
Outputs esperados: HTTP 201 e depois HTTP 409.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: segunda denúncia aceita.
```

## CT-6.2.1-07 · Validar denúncia sem token

Suíte: [Denúncia com análise de IA] Usuário - Denunciar post · Tags: funcional; negativo

| motivo |
| --- |
| Denúncia sem login no sistema |

```
Identificador: CT-6.2.1-07
Objetivo: verificar que denunciar exige autenticação.
PBI e critério de aceite: [Denúncia com análise de IA] Usuário - Denunciar post; critério "somente usuário autenticado denuncia; requisição sem token recebe HTTP 401".
Técnica: partição de equivalência (sem token).
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Post ATIVO.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: denúncia sem token. Valores em Parameter values.
Outputs esperados: HTTP 401.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: denúncia gravada sem token.
```

## CT-6.2.1-08 · Validar que o autor não vê quem denunciou

Suíte: [Denúncia com análise de IA] Usuário - Denunciar post · Tags: funcional; negativo

| autor | denunciante |
| --- | --- |
| produtor.teste01@valence.dev | produtor.teste08@valence.dev e o nome do produtor de apoio |

```
Identificador: CT-6.2.1-08
Objetivo: verificar o sigilo do denunciante.
PBI e critério de aceite: [Denúncia com análise de IA] Usuário - Denunciar post; critério "o autor do post nunca vê quem fez a denúncia".
Técnica: partição de equivalência, classe inválida (dado do denunciante exposto).
Preparação: caso CT-6.2.1-06 executado.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: post denunciado visto pelo autor. Valores em Parameter values.
Outputs esperados: nenhum dado do denunciante.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: nome ou e-mail do denunciante exibido.
```

## CT-6.2.2-01 · Validar classificação de recomendação perigosa com gravidade alta

Suíte: [Denúncia com análise de IA] Sistema - Classificar denúncia e ocultar gravidade alta · Tags: funcional; positivo

| autor | texto |
| --- | --- |
| produtor.teste01@valence.dev | Para a lagarta, misturem 500 ml de inseticida por litro de água e apliquem sem equipamento. |

```
Identificador: CT-6.2.2-01
Objetivo: verificar a classificação da IA e a ocultação por gravidade alta.
PBI e critério de aceite: [Denúncia com análise de IA] Sistema - Classificar denúncia e ocultar gravidade alta; critério "a IA classifica cada denúncia com categoria, gravidade, ação e justificativa; gravidade ALTA sempre muda o post para OCULTO; ele some do mural e entra na fila de moderação".
Técnica: partição de equivalência (conteúdo de risco alto).
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. LLM disponível na API (chave válida).
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: denúncia de post com dose perigosa. Valores em Parameter values.
Outputs esperados: classificação ALTA, post OCULTO e na fila.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: post continua ATIVO ou classificação ausente.
Notas: a categoria depende do LLM; se vier outra categoria com gravidade ALTA, o caso passa, mas registrar a categoria obtida.
```

## CT-6.2.2-02 · Validar denúncia de baixa gravidade mantendo o post ativo

Suíte: [Denúncia com análise de IA] Sistema - Classificar denúncia e ocultar gravidade alta · Tags: funcional; positivo

| autor | texto |
| --- | --- |
| produtor.teste01@valence.dev | Bom dia, pessoal. A chuva de ontem ajudou bastante o milho. |

```
Identificador: CT-6.2.2-02
Objetivo: verificar que denúncia sem gravidade alta não oculta o post.
PBI e critério de aceite: [Denúncia com análise de IA] Sistema - Classificar denúncia e ocultar gravidade alta; critério "gravidade BAIXA ou MEDIA mantém o post ATIVO, com a denúncia pendente na fila de moderação".
Técnica: partição de equivalência (conteúdo inofensivo).
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. LLM disponível na API (chave válida).
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: denúncia de post inofensivo. Valores em Parameter values.
Outputs esperados: post ATIVO e denúncia na fila.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: post ocultado ou fora da fila.
```

## CT-6.2.2-03 · Validar post com dados pessoais ocultado sem chamar o LLM

Suíte: [Denúncia com análise de IA] Sistema - Classificar denúncia e ocultar gravidade alta · Tags: funcional; negativo

| config | autor | texto |
| --- | --- | --- |
| LLM_API_KEY com valor inválido de teste | produtor.teste01@valence.dev | Vendo semente de milho, chamem no 16 99999-0000 ou vendas.teste@valence.dev |

```
Identificador: CT-6.2.2-03
Objetivo: verificar a regra de dados pessoais sem depender do LLM.
PBI e critério de aceite: [Denúncia com análise de IA] Sistema - Classificar denúncia e ocultar gravidade alta; critério "post com e-mail, telefone ou CPF no texto é classificado como DADOS_PESSOAIS, gravidade ALTA e ação OCULTAR_E_REVISAR sem chamar o LLM".
Técnica: partição de equivalência, classe inválida (dado pessoal no post), com o LLM indisponível.
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. API local com chave do LLM inválida só no .env; restaurar ao final.
Ambiente: API Java local (porta 8080) com o LLM configurado no .env, Swagger da API local e app Valence no Android apontando para a API local.
Inputs: post com telefone e e-mail fictícios e LLM indisponível. Valores em Parameter values.
Outputs esperados: DADOS_PESSOAIS, ALTA e post OCULTO.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: post continua ATIVO ou classificação diferente.
```

## CT-6.2.2-04 · Validar denúncia pendente quando o LLM não responde

Suíte: [Denúncia com análise de IA] Sistema - Classificar denúncia e ocultar gravidade alta · Tags: funcional; negativo

| config | texto |
| --- | --- |
| LLM_API_KEY com valor inválido de teste | Esse adubo da cooperativa não presta, não comprem. |

```
Identificador: CT-6.2.2-04
Objetivo: verificar o comportamento sem resposta do LLM.
PBI e critério de aceite: [Denúncia com análise de IA] Sistema - Classificar denúncia e ocultar gravidade alta; critério "sem resposta do LLM, o post continua ATIVO e a denúncia fica pendente para moderação humana".
Técnica: partição de equivalência por disponibilidade de dependência (LLM indisponível).
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. API local com chave do LLM inválida só no .env; restaurar ao final.
Ambiente: API Java local (porta 8080) com o LLM configurado no .env, Swagger da API local e app Valence no Android apontando para a API local.
Inputs: denúncia com o LLM indisponível. Valores em Parameter values.
Outputs esperados: post ATIVO e denúncia pendente na fila.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: post ocultado, erro 500 ou denúncia fora da fila.
```

## CT-6.2.2-05 · Validar que a IA não remove post mesmo em caso grave

Suíte: [Denúncia com análise de IA] Sistema - Classificar denúncia e ocultar gravidade alta · Tags: funcional; negativo

| autor | texto |
| --- | --- |
| produtor.teste01@valence.dev | Quem não aplicar veneno forte agora vai perder tudo, usem o dobro da dose da bula. |

```
Identificador: CT-6.2.2-05
Objetivo: verificar que só a moderação humana remove.
PBI e critério de aceite: [Denúncia com análise de IA] Sistema - Classificar denúncia e ocultar gravidade alta; critério "a IA nunca devolve a ação de remover; só a moderação humana remove".
Técnica: partição de equivalência, classe inválida (conteúdo grave).
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. LLM disponível na API (chave válida).
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: denúncia de post grave. Valores em Parameter values.
Outputs esperados: post OCULTO aguardando moderação.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: post REMOVIDO sem decisão humana.
```

## CT-6.2.2-06 · Validar que a análise da IA não expõe dados pessoais

Suíte: [Denúncia com análise de IA] Sistema - Classificar denúncia e ocultar gravidade alta · Tags: funcional; negativo

| autor | texto | dados |
| --- | --- | --- |
| produtor.teste01@valence.dev | Meu CEP é 14000-000 e estou na coordenada -21.17, -47.81, venham ver a praga. | 14000-000, -21.17, -47.81, nome do autor, nome do denunciante |

```
Identificador: CT-6.2.2-06
Objetivo: verificar o mascaramento dos dados enviados ao LLM.
PBI e critério de aceite: [Denúncia com análise de IA] Sistema - Classificar denúncia e ocultar gravidade alta; critério "os dados enviados ao LLM têm e-mail, telefone, CPF, CEP e coordenadas mascarados e não contêm o nome do autor nem do denunciante".
Técnica: partição de equivalência, classe inválida (dado pessoal no texto).
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. LLM disponível na API (chave válida).
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: post com CEP e coordenadas. Valores em Parameter values.
Outputs esperados: justificativa sem dados pessoais.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: CEP, coordenada ou nome na justificativa.
```

## CT-6.3.1-01 · Validar fila de moderação com posts ocultos primeiro

Suíte: [Moderação] Agrônomo ou gestor - Ver fila de moderação · Tags: funcional; positivo

| agronomo | gestor |
| --- | --- |
| agrônomo do README | gestor do README |

```
Identificador: CT-6.3.1-01
Objetivo: verificar a fila de moderação.
PBI e critério de aceite: [Moderação] Agrônomo ou gestor - Ver fila de moderação; critério "a fila mostra os posts ATIVO e OCULTO com denúncia pendente, primeiro os OCULTO, paginada (10 por página); cada item mostra texto do post, município, UF, status, data, nome do autor, quantidade de denúncias e a análise da IA".
Técnica: partição de equivalência, classe válida.
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Casos CT-6.2.2-01 e CT-6.2.2-02 executados.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: fila com posts OCULTO e ATIVO denunciados. Valores em Parameter values.
Outputs esperados: fila ordenada e completa.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: post OCULTO depois de ATIVO ou campo ausente.
```

## CT-6.3.1-02 · Validar acesso à fila de moderação por produtor e sem token

Suíte: [Moderação] Agrônomo ou gestor - Ver fila de moderação · Tags: funcional; negativo

| produtor |
| --- |
| produtor.teste08@valence.dev |

```
Identificador: CT-6.3.1-02
Objetivo: verificar que só moderadores acessam a fila.
PBI e critério de aceite: [Moderação] Agrônomo ou gestor - Ver fila de moderação; critério "somente AGRONOMO e GESTOR acessam a fila; PRODUTOR recebe HTTP 403 e requisição sem token recebe HTTP 401".
Técnica: tabela de decisão por papel e autenticação.
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: acesso como produtor e sem token. Valores em Parameter values.
Outputs esperados: HTTP 403 e 401.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: fila devolvida para produtor ou sem token.
```

## CT-6.3.1-03 · Validar que a fila não identifica os denunciantes

Suíte: [Moderação] Agrônomo ou gestor - Ver fila de moderação · Tags: funcional; negativo

| denunciante |
| --- |
| produtor.teste08@valence.dev e o nome do produtor de apoio |

```
Identificador: CT-6.3.1-03
Objetivo: verificar o sigilo do denunciante para os moderadores.
PBI e critério de aceite: [Moderação] Agrônomo ou gestor - Ver fila de moderação; critério "a fila nunca identifica quem fez as denúncias".
Técnica: partição de equivalência, classe inválida (dado do denunciante exposto).
Preparação: caso CT-6.2.1-06 executado.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: item da fila com denúncia. Valores em Parameter values.
Outputs esperados: nenhum dado do denunciante.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: nome ou e-mail do denunciante na fila.
```

## CT-6.3.1-04 · Validar que post já decidido não aparece na fila

Suíte: [Moderação] Agrônomo ou gestor - Ver fila de moderação · Tags: funcional; negativo

| decisao |
| --- |
| MANTER |

```
Identificador: CT-6.3.1-04
Objetivo: verificar a saída do post decidido.
PBI e critério de aceite: [Moderação] Agrônomo ou gestor - Ver fila de moderação; critério "post já decidido não aparece na fila".
Técnica: transição de estado (pendente para decidido).
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Pelo menos um item na fila.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: decisão sobre um item. Valores em Parameter values.
Outputs esperados: item fora da fila.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: post decidido ainda na fila.
```

## CT-6.3.1-05 · Validar mensagem de fila de moderação vazia

Suíte: [Moderação] Agrônomo ou gestor - Ver fila de moderação · Tags: funcional; positivo

| gestor |
| --- |
| gestor do README |

```
Identificador: CT-6.3.1-05
Objetivo: verificar a mensagem de fila vazia.
PBI e critério de aceite: [Moderação] Agrônomo ou gestor - Ver fila de moderação; critério "fila vazia mostra Nenhum post aguardando moderação.".
Técnica: partição de equivalência (lista vazia).
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo.
Ambiente: Android com o app Valence (Firebase App Distribution) e API Java no Azure App Service.
Inputs: fila sem itens. Valores em Parameter values.
Outputs esperados: mensagem de fila vazia.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: tela em branco, erro ou mensagem diferente.
```

## CT-6.3.2-01 · Validar decisão manter devolvendo post oculto ao mural

Suíte: [Moderação] Agrônomo ou gestor - Manter ou remover post · Tags: funcional; positivo

| agronomo |
| --- |
| agrônomo do README |

```
Identificador: CT-6.3.2-01
Objetivo: verificar a decisão MANTER.
PBI e critério de aceite: [Moderação] Agrônomo ou gestor - Manter ou remover post; critério "decisão MANTER muda o post para ATIVO e ele continua ou volta ao mural; a decisão é registrada como decisão final em todas as denúncias pendentes do post e o post sai da fila".
Técnica: transição de estado (OCULTO para ATIVO).
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Post OCULTO na fila (CT-6.2.2-01).
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: decisão MANTER em post oculto. Valores em Parameter values.
Outputs esperados: post ATIVO no mural e fora da fila.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: post continua OCULTO ou na fila.
```

## CT-6.3.2-02 · Validar decisão remover com confirmação

Suíte: [Moderação] Agrônomo ou gestor - Manter ou remover post · Tags: funcional; positivo

| gestor |
| --- |
| gestor do README |

```
Identificador: CT-6.3.2-02
Objetivo: verificar a decisão REMOVER.
PBI e critério de aceite: [Moderação] Agrônomo ou gestor - Manter ou remover post; critério "cada item da fila tem os botões Manter e Remover; o app pede confirmação antes de remover; decisão REMOVER muda o post para REMOVIDO e ele nunca mais aparece no mural".
Técnica: transição de estado (para REMOVIDO).
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Post na fila.
Ambiente: Android com o app Valence (Firebase App Distribution), API Java no Azure App Service e Swagger da API.
Inputs: decisão REMOVER confirmada. Valores em Parameter values.
Outputs esperados: post REMOVIDO e fora do mural.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: remoção sem confirmação ou post ainda visível.
```

## CT-6.3.2-03 · Validar decisão manter em post ativo com denúncia pendente

Suíte: [Moderação] Agrônomo ou gestor - Manter ou remover post · Tags: funcional; positivo

| decisao |
| --- |
| MANTER |

```
Identificador: CT-6.3.2-03
Objetivo: verificar MANTER em post que já estava ativo.
PBI e critério de aceite: [Moderação] Agrônomo ou gestor - Manter ou remover post; critério "decisão MANTER muda o post para ATIVO e ele continua no mural; o post sai da fila".
Técnica: transição de estado (ATIVO com denúncia para ATIVO sem pendência).
Preparação: caso CT-6.2.2-02 executado.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: decisão MANTER em post ativo. Valores em Parameter values.
Outputs esperados: post no mural e fora da fila.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: post some do mural ou fica na fila.
```

## CT-6.3.2-04 · Validar decisão de moderação pelo produtor

Suíte: [Moderação] Agrônomo ou gestor - Manter ou remover post · Tags: funcional; negativo

| produtor |
| --- |
| produtor.teste08@valence.dev |

```
Identificador: CT-6.3.2-04
Objetivo: verificar que só moderadores decidem.
PBI e critério de aceite: [Moderação] Agrônomo ou gestor - Manter ou remover post; critério "somente AGRONOMO e GESTOR decidem; PRODUTOR recebe HTTP 403".
Técnica: tabela de decisão por papel.
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Post na fila.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: decisão enviada por produtor. Valores em Parameter values.
Outputs esperados: HTTP 403 e post na fila.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: post decidido por produtor.
```

## CT-6.3.2-05 · Validar decisão de moderação com valor inválido

Suíte: [Moderação] Agrônomo ou gestor - Manter ou remover post · Tags: funcional; negativo

| decisao |
| --- |
| OCULTAR |

```
Identificador: CT-6.3.2-05
Objetivo: verificar a validação da decisão.
PBI e critério de aceite: [Moderação] Agrônomo ou gestor - Manter ou remover post; critério "a decisão aceita somente MANTER ou REMOVER; outro valor recebe HTTP 400".
Técnica: partição de equivalência, classe inválida.
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Post na fila.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: decisão OCULTAR. Valores em Parameter values.
Outputs esperados: HTTP 400.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: decisão aceita com valor inválido.
```

## CT-6.3.2-06 · Validar decisão sobre post inexistente ou fora da fila

Suíte: [Moderação] Agrônomo ou gestor - Manter ou remover post · Tags: funcional; negativo

| inexistente |
| --- |
| 999999 |

```
Identificador: CT-6.3.2-06
Objetivo: verificar decisão fora da fila.
PBI e critério de aceite: [Moderação] Agrônomo ou gestor - Manter ou remover post; critério "decisão sobre post inexistente ou que não está na fila recebe HTTP 404".
Técnica: partição de equivalência, classes inválidas.
Preparação: produtor.teste01@valence.dev e produtor.teste08@valence.dev, os dois com perfil em Ribeirão Preto/SP; agrônomo e gestor de seed do README; app e API online; Swagger autorizado com o token indicado em cada passo. Post ATIVO sem denúncia.
Ambiente: Swagger da API Java no Azure App Service (/swagger-ui.html), navegador Chrome.
Inputs: decisão sobre post inexistente e sobre post fora da fila. Valores em Parameter values.
Outputs esperados: HTTP 404 nos dois.
Critério de saída: todos os passos com o resultado obtido igual ao esperado.
Condições de falha: post fora da fila removido.
```

