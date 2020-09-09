library(dplyr)

ames <- readr::read_rds("data/ames.rds")

# across(), where() -------------------------------------------------------

# 1. Reescreva os códigos abaixo utilizando
# as funções across() e where().

# a)
ames %>%
  group_by(geral_qualidade) %>%
  summarise(
    acima_solo_area_media = mean(acima_solo_area, na.rm = TRUE),
    garagem_area_media = mean(garagem_area, na.rm = TRUE),
    valor_venda_medio = mean(venda_valor, na.rm = TRUE)
  )

ames %>%
  group_by(geral_qualidade) %>%
  summarise(
    across(
      .cols = c(acima_solo_area, garagem_area, venda_valor),
      .fns = mean,
      na.rm = TRUE,
      .names = "{col}_media"
    )
  )


# b)
ames %>%
  filter_at(
    vars(porao_qualidade, varanda_fechada_area, cerca_qualidade),
    ~!is.na(.x)
  )

avalia_se_nao_eh_NA <- function(.x) {
  !is.na(.x)
}

ames %>%
  filter(
    across(
      .cols = c(porao_qualidade, varanda_fechada_area, cerca_qualidade),
      .fns = ~!is.na(.x)
    )
  )



# c)
ames %>%
  mutate_if(is.character, ~tidyr::replace_na(.x, replace = "Não possui")) %>%
  View()

ames %>%
  mutate(
    across(
      .cols = where(is.character),
      .fns = ~tidyr::replace_na(.x, replace = "Não possui")
    )
  ) %>%
  View()


# 2.

# a. Usando o case_when() crie um código
# para categorizar a variável venda_valor da
# seguinte maneira

# 0 a 129500 ~ "barata"
# 129500 a 180796 ~ "preço mediano"
# 180796 a 213500 ~ "cara"
# > 213500 ~ "muito cara"

ames <- ames %>%
  mutate(
    venda_valor_cat = case_when(
      venda_valor < 129500 ~ "barata",
      venda_valor < 180796 ~ "preço mediano",
      venda_valor < 213500 ~ "cara",
      TRUE ~ "muito cara"
    )
  )


# b. Utilize o código feito na letra a.
# para agrupar a base ames pela
# variável venda_valor categorizada e
# calcular todas as áreas médias para
# cada uma dessas categorias.

ames %>%
  group_by(venda_valor_cat) %>%
  summarise(
    across(
      .cols = contains("area"),
      .fns = mean,
      na.rm = TRUE
    )
  )


# Sugestão:

ames %>%
  # código feito na letra a %>%
  group_by(venda_valor_categorizada) %>%
  summarise(
    across(
      # calcular média para todas as
      # colunas de área
    )
  )


# select(), rename() ------------------------------------------------------

# 3. Escreva um código que receba a base ames
# e retorne uma tabela com apenas

# a) as colunas referentes à garagem da casa.

ames %>%
  select(contains("garagem"))

# b) as colunas referentes a variáveis de
# qualidade.

ames %>%
  select(contains("qualidade"))

# c) colunas numéricas que representam
# áreas da casa e do terreno.

ames %>%
  select(where(is.numeric) & contains("area"))

# d) colunas numéricas.

ames %>%
  select(where(is.numeric))

# e) colunas referentes à piscina, porão e
# o valor de venda.

ames %>%
  select(contains("piscina"), contains("porao"), contains("venda"))


# 4. Usando a função rename_with(), troque
# todos os "_" dos nomes das colunas
# por um espaço " ".


# Dica: utilize a função stringr::str_replace_all()

stringr::str_replace_all("nome_com_underline", "_", " ")

ames %>%
  rename_with(
    .fn = stringr::str_replace_all,
    pattern = "_",
    replacement = " "
  )


# relocate() --------------------------------------------------------------

# 5. Escreva um código para colocar
# todas as colunas relativas
# a venda no começo da tabela ames.

ames %>%
  relocate(contains("venda"))


# 6. Escreva um código para colocar
# todas as colunas numéricas da
# base ames no começo da tabela e todas
# as colunas categóricas no final.

ames %>%
  relocate(where(is.numeric))
