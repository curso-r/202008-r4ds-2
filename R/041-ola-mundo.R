library(shiny)

ui <- fluidPage(
  shiny::tags$a(
    href = "https://www.curso-r.com", "site da curso-r"
  )
)

server <- function(input, output, session) {

}

shinyApp(ui, server)
