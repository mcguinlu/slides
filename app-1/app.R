library(shiny)
library(BristolVis)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
      shiny::selectInput(inputId = "fill", 
                            label = "Variable to fill by:",
                            choices = c("Health" = "health",
                                        "Treatment" = "treatment")),
      plotOutput("barPlot")
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   output$barPlot <- renderPlot({
      ggplot(data = med, aes(fill = get(input$fill))) +
         geom_histogram(aes(x = status), stat = "count") +
         labs(fill = "Fill")
      })
}

# Run the application 
shinyApp(ui = ui, server = server)

