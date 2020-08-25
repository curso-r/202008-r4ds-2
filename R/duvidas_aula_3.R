library(dplyr)
library(ggplot2)

imdb <- readr::read_rds("data/imdb.rds")

imdb$orcamento

pegar_nas <- function(tab, nome_coluna) {
  sum(is.na(tab[,nome_coluna]))
}

pegar_nas <- function(tab, nome_coluna) {
  imdb %>%
    filter_at(vars(nome_coluna), is.na) %>%
    nrow()
}

pegar_nas(imdb, "ano")

sum(is.na(imdb[,"orcamento"]))

imdb %>%
  select(y = "orcamento") %>%
  filter(is.na(y)) %>%
  nrow()

imdb %>%
  filter_at(vars("orcamento"), is.na) %>%
  nrow()

imdb %>%
  filter(ano > 2010) %>%
  mutate(ano = as.character(ano)) %>%
  group_by(ano) %>%
  summarise(receita_media = mean(receita, na.rm = TRUE)) %>%
  ggplot(aes(x = ano, y = receita_media, fill = ano)) +
  geom_col() +
  labs(fill = "Ano")

0: pc = github
1: trabalhando
2: pc > github
2.5: stage
3: commit
4: push
5: pc = github
