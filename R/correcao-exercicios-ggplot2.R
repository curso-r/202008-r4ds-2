library(dplyr)
library(ggplot2)

# mapas -------------------------------------------------------------------

# a. Escolha um estado brasileiro e
# utilize o pacote geobr para baixar
# os limites geográficos dos municípios
# desse estado.

# Exemplo Acre
acre <-  geobr::read_municipality(code_muni = "AC")
acre %>% ggplot() + geom_sf()

# b. Manipule a base "covid" para gerar
# uma tabela com as informações de óbitos
# acumulados no dia 01/06/2020 apenas para os
# municípios do estado escolhido no item a.

covid <- readr::read_rds("data/covid.rds")

covid <- covid %>%
  filter(estado == "AC", !is.na(codmun), data == "2020-06-01")

# c. Na base acre, crie uma nova coluna chamada
# "codmun"  que possua apenas os 6 primeiros caracteres
# da coluna code_muni.

acre <- acre %>%
  mutate(
    codmun = stringr::str_sub(code_muni, 1, 6),
    codmun = as.numeric(codmun)
  )

# d. Junte as bases covid e acre utilizando a função
# left_join e usando a coluna "codmun" como chave.

base <- left_join(
  acre,
  covid,
  by = "codmun"
)


# e. Faça um mapa dos municípios do Estado
# escolhido no item a., mapeando o número
# de óbitos acumulados à cor de cada município.

base %>%
  ggplot() +
  geom_sf(aes(fill = obitosAcumulado)) +
  geom_sf_text(aes(label = name_muni), size = 2, color = "white")


# temas -------------------------------------------------------------------

# Construa um tema no ggplot que
# corresponda à identidade visual das
# seguintes marcas

# a. Twitter

# b. Porta dos fundos

# c. The Simpsons


# extensões ---------------------------------------------------------------

# a. Entre na página https://exts.ggplot2.tidyverse.org/gallery/
# e escolha uma extensão do ggplot que você
# ainda não conhece.


# b. Instale o pacote e tente rodar alguns
# dos exemplos apresentados na documentação
# ou no Github do pacote.


# c. Tente utilizar o pacote para um novo
# conjunto de dados.


# Sugestão para quem não quiser procurar: ggtext
# https://wilkelab.org/ggtext/
