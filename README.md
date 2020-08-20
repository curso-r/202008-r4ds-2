
<!-- README.md is generated from README.Rmd. Please edit that file -->

## Configuração inicial

#### Passo 1: Instalar pacotes

``` r
install.packages("remotes")

# instalar pacote da Curso-R
remotes::install_github("curso-r/CursoR")

# instalar pacotes que vamos usar durante o curso
CursoR::instalar_dependencias()
```

#### Passo 2: Criar um projeto do RStudio

Faça um projeto do RStudio para usar durante todo o curso e em seguida
abra-o.

#### Passo 3: Baixar o material

Certifique que você está dentro do projeto criado no passo 2 e rode o
código abaixo.

**Observação**: Assim que rodar o código abaixo, o programa vai pedir
uma escolha de opções. Escolha o número correspondente ao curso de R
para Ciência de Dados 2\!

``` r
# Baixar ou atualizar material do curso
CursoR::atualizar_material()
```

## Slides

| slide                                                 | link                                                                                         |
| :---------------------------------------------------- | :------------------------------------------------------------------------------------------- |
| slides/01-introducao-ao-curso.html                    | <https://curso-r.github.io/main-r4ds-2/slides/01-introducao-ao-curso.html>                   |
| slides/021-organizacao-de-projetos.html               | <https://curso-r.github.io/main-r4ds-2/slides/021-organizacao-de-projetos.html>              |
| slides/022-exemplo-analise-projeto.html               | <https://curso-r.github.io/main-r4ds-2/slides/022-exemplo-analise-projeto.html>              |
| slides/022-exemplo-analise-projeto\_files/figure-html | <https://curso-r.github.io/main-r4ds-2/slides/022-exemplo-analise-projeto_files/figure-html> |
| slides/023-exemplo-analise-pacote.html                | <https://curso-r.github.io/main-r4ds-2/slides/023-exemplo-analise-pacote.html>               |
| slides/023-exemplo-analise-pacote\_files/figure-html  | <https://curso-r.github.io/main-r4ds-2/slides/023-exemplo-analise-pacote_files/figure-html>  |
| slides/031-dplyr.html                                 | <https://curso-r.github.io/main-r4ds-2/slides/031-dplyr.html>                                |
| slides/032-tidyr.html                                 | <https://curso-r.github.io/main-r4ds-2/slides/032-tidyr.html>                                |
| slides/032-tidyr\_files/figure-html                   | <https://curso-r.github.io/main-r4ds-2/slides/032-tidyr_files/figure-html>                   |
| slides/08-shiny.html                                  | <https://curso-r.github.io/main-r4ds-2/slides/08-shiny.html>                                 |

## Scripts usados em aula

| script     | link                                                   |
| :--------- | :----------------------------------------------------- |
| 01-dplyr.R | <https://curso-r.github.io/202008-r4ds-2/R/01-dplyr.R> |
