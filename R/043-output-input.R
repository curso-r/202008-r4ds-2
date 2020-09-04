library(shiny)

ui <- fluidPage(
  "Vários  histogramas",
  selectInput(
    inputId = "variavel",
    label = "Selecione uma variável",
    choices = names(mtcars)
  ),
  plotOutput(outputId = "hist")
)

server <- function(input, output, session) {

  output$hist <- renderPlot({

    # if() {
    #
    # } else {
    #
    # }
    #
    # a <- 1
    #
    # b <- 2

    mtcars %>%
      dplyr::select(var = input$variavel) %>%
      ggplot2::ggplot() +
      ggplot2::geom_histogram(ggplot2::aes(x = var))
  })

}

shinyApp(ui, server)


# library(shiny)
#
# ui <- fluidPage(
#   "Vários histogramas",
#   selectInput(
#     inputId = "variavel",
#     label = "Selecione a variável",
#     choices = names(mtcars)
#   ),
#   plotOutput("hist")
# )
#
# server <- function(input, output, session) {
#
#   output$hist <- renderPlot({
#     hist(mtcars[,input$variavel])
#   })
#
# }
#
# shinyApp(ui, server)
