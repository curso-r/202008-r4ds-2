library(shiny)

covid <- readr::read_rds("../../data/covid.rds")

ui <- fluidPage(
  "Vários histogramas",
  selectInput(
    inputId = "variavel",
    label = "Selecione a variável",
    choices = names(covid)
  ),
  plotOutput("hist")
)


server <- function(input, output, session) {

  output$hist <- renderPlot({
    hist(covid[,input$variavel])
  })

}

shinyApp(ui, server)

p <- ggplot()
plotly::ggplotly(p)

CTRL + SHIFT + L
