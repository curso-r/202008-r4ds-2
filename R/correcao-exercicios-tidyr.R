library(dplyr)
library(tidyr)

pokemon <- readr::read_rds("data/pokemon.rds")
imdb <- readr::read_rds("data/imdb.rds")

# unite(), separate() -----------------------------------------------------

# 1. Junte as duas colunas de tipo em
# uma única coluna na base pokemon.

pokemon %>%
  unite(
    col = "tipo",
    sep = "|",
    tipo_1, tipo_2,
    remove = FALSE,
    na.rm = TRUE
  ) %>%
  View()

# 2. Junte as três colunas de cor em
# uma única coluna na base pokemon.
# Faça isso sem remover as 3 colunas
# originais.

pokemon %>%
  unite(
    col = "cor",
    sep = "|",
    cor_1, cor_2, cor_final,
    remove = FALSE
  ) %>%
  View()

#. 3 Crie 5 novas colunas de gêneros
# na base imdb, cada uma com um dos
# gêneros contidos na coluna generos.
# Para os filmes com menos de 5 gêneros,
# substitua os valores NA pela
# string "inexistente".

imdb %>%
  separate(
    col = generos,
    into = paste0("genero_", 1:5),
    sep = "\\|"
  ) %>%
  mutate(
    across(
      starts_with("genero_"),
      ~ replace_na(.x, "inexistente")
    )
  ) %>%
  View()


# pivot_longer(), pivot_wider() -------------------------------------------

# 4. Substitua os "????" no código abaixo
# para criar uma tabela do lucro
# médio dos filmes ao longo dos
# anos de 2000 a 2016, com cada
# ano sendo uma coluna da base.

imdb %>%
  mutate(lucro = receita - orcamento) %>%
  filter(ano %in% 2000:2016) %>%
  group_by(ano) %>%
  summarise(lucro_medio = mean(lucro, na.rm = TRUE)) %>%
  pivot_wider(names_from = ano, values_from = lucro_medio) %>%
  View


# 5.

# a. Utilize a função pivot_longer()
# para criar uma única coluna de tipo
# na base pokemon.

pokemon %>%
  pivot_longer(
    names_to = "relevancia",
    values_to = "tipo",
    cols = starts_with("tipo_")
  ) %>%
  View()


# b. Utilize a base criada no item a.
# e escreva um código para descobrir
# qual o tipo mais frequente na base,
# independentemente se ele é
# primário (tipo_1) ou secundário (tipo_2).

pokemon %>%
  pivot_longer(
    names_to = "relevancia",
    values_to = "tipo",
    cols = starts_with("tipo_")
  ) %>%
  group_by(relevancia) %>%
  count(tipo) %>%
  filter(!is.na(tipo)) %>%
  arrange(relevancia, desc(n)) %>%
  View()


#. 6. (DESAFIO)
# Escreva uma função que receba
# uma base qualquer e o nome
# de uma coluna numérica dessa base
# e retorne uma figura com
# um gráfico de dispersão da
# coluna escolhida contra cada
# uma das outras variáveis numéricas
# da base.

# Estrutura da função

library(ggplot2)

tabela_longa <-imdb %>%
  select(titulo, where(is.numeric)) %>%
  pivot_longer(
    names_to = "variavel_nome",
    values_to = "variavel_valor",
    cols = -c(receita, titulo)
  )


tabela_longa %>%
  ggplot(aes(x = variavel_valor, y = receita)) +
  geom_point() +
  facet_wrap(~variavel_nome, scales = "free")


{{}}

fazer_graficos_dispersao <- function(base, variavel) {

  tabela_longa <- base %>%
    select(titulo, where(is.numeric)) %>%
    rename(y = variavel) %>%
    pivot_longer(
      names_to = "variavel_nome",
      values_to = "variavel_valor",
      cols = -c(y, titulo)
    )

  tabela_longa %>%
    ggplot(aes(x = variavel_valor, y = y)) +
    geom_point() +
    facet_wrap(~variavel_nome, scales = "free")
}

fazer_graficos_dispersao(imdb, "receita")

# curly-curly

fazer_graficos_dispersao <- function(base, variavel) {

  tabela_longa <- base %>%
    select(titulo, where(is.numeric)) %>%
    pivot_longer(
      names_to = "variavel_nome",
      values_to = "variavel_valor",
      cols = -c({{variavel}}, titulo)
    )

  tabela_longa %>%
    ggplot(aes(x = variavel_valor, y = {{variavel}})) +
    geom_point() +
    facet_wrap(~variavel_nome, scales = "free")
}

fazer_graficos_dispersao(imdb, receita)

# Se você rodar fazer_graficos_dispersao(mtcars, mpg)
# deverá retornar uma imagem igual a figura
# exercicios/exemplo_grafico_dispersao.png
