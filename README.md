
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

| slide                                   | link                                                                            |
| :-------------------------------------- | :------------------------------------------------------------------------------ |
| slides/01-introducao-ao-curso.html      | <https://curso-r.github.io/main-r4ds-2/slides/01-introducao-ao-curso.html>      |
| slides/021-organizacao-de-projetos.html | <https://curso-r.github.io/main-r4ds-2/slides/021-organizacao-de-projetos.html> |
| slides/022-exemplo-analise-projeto.html | <https://curso-r.github.io/main-r4ds-2/slides/022-exemplo-analise-projeto.html> |
| slides/023-exemplo-analise-pacote.html  | <https://curso-r.github.io/main-r4ds-2/slides/023-exemplo-analise-pacote.html>  |
| slides/031-dplyr.html                   | <https://curso-r.github.io/main-r4ds-2/slides/031-dplyr.html>                   |
| slides/032-tidyr.html                   | <https://curso-r.github.io/main-r4ds-2/slides/032-tidyr.html>                   |
| slides/041-stringr.html                 | <https://curso-r.github.io/main-r4ds-2/slides/041-stringr.html>                 |
| slides/042-lubridate.html               | <https://curso-r.github.io/main-r4ds-2/slides/042-lubridate.html>               |
| slides/043-purrr.html                   | <https://curso-r.github.io/main-r4ds-2/slides/043-purrr.html>                   |
| slides/05-ggplot2-plus.html             | <https://curso-r.github.io/main-r4ds-2/slides/05-ggplot2-plus.html>             |
| slides/06-shiny.html                    | <https://curso-r.github.io/main-r4ds-2/slides/06-shiny.html>                    |

## Scripts usados em aula

| script              | link                                                            |
| :------------------ | :-------------------------------------------------------------- |
| 01-dplyr.R          | <https://curso-r.github.io/202008-r4ds-2/R/01-dplyr.R>          |
| 02-tidyr.R          | <https://curso-r.github.io/202008-r4ds-2/R/02-tidyr.R>          |
| 041-ola-mundo.R     | <https://curso-r.github.io/202008-r4ds-2/R/041-ola-mundo.R>     |
| 042-output.R        | <https://curso-r.github.io/202008-r4ds-2/R/042-output.R>        |
| 043-output-input.R  | <https://curso-r.github.io/202008-r4ds-2/R/043-output-input.R>  |
| 3-ggplot2.R         | <https://curso-r.github.io/202008-r4ds-2/R/3-ggplot2.R>         |
| duvidas\_aula\_3.R  | <https://curso-r.github.io/202008-r4ds-2/R/duvidas_aula_3.R>    |
| exemplo\_funcoes.R  | <https://curso-r.github.io/202008-r4ds-2/R/exemplo_funcoes.R>   |
| exemplo-shinydash.R | <https://curso-r.github.io/202008-r4ds-2/R/exemplo-shinydash.R> |
| extra-curly-curly.R | <https://curso-r.github.io/202008-r4ds-2/R/extra-curly-curly.R> |
