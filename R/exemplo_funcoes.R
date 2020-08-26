
library(dplyr)

imdb <- readr::read_rds("data/imdb.rds")

sum(is.na(imdb$"orcamento"))
sum(is.na(imdb[,"orcamento"]))

imdb %>%
  filter(is.na(orcamento)) %>%
  nrow()

orcamento2 <- 1

filter(imdb, is.na(orcamento3))

imdb %>%
  filter(is.na(orcamento)) %>%
  nrow()

imdb %>%
  select(y = orcamento) %>%
  filter(is.na(y)) %>%
  nrow()

pegar_nas <- function(tab, nome_coluna) {
  sum(is.na(tab[, nome_coluna]))
}

pegar_nas <- function(tab, nome_coluna) {
  tab %>%
    filter(is.na(nome_coluna)) %>%
    nrow()
}

pegar_nas(imdb, "orcamento")



