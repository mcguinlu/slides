
library(shiny)
library(BristolVis)
library(ggplot2)

ui <- fluidPage(
  sidebarLayout(
  sidebarPanel(  
  h2("Please complete the options below."),
  p("This information will be used to update the graph"),
  selectInput(inputId = "fill",
              label = "Variable to fill by:",
              choices = c("health","treatment")),
  sliderInput("slider", label = "Number of rows", min = 2,max=6, value = 3)),
  mainPanel(
  plotOutput("barPlot"),
  tableOutput("table")
  )
)
)

server <- function(input, output) {
  
  output$table <- renderTable({
    head(med)
  })
  
  
  data <- reactive({
        head(med, n = input$slider) 
  })
  
 output$barPlot <- renderPlot({
 
    fill <- switch(input$fill, 
                     "treatment" = data()$treatment,
                     "health" = data()$health)
    
    ggplot(data = data(), aes(fill = fill)) +
      geom_histogram(aes(x = status), stat = "count") 
  })
}

shinyApp(ui = ui, server = server)
