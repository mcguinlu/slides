library(shiny)
library(BristolVis)
library(ggplot2)

ui <- fluidPage(
   sidebarLayout(
      sidebarPanel(
         selectInput(
            inputId = "fill",
            label = "Variable to fill by:",
            choices = c("Health" = "health",
                        "Treatment" = "treatment"))
      ),
      mainPanel(
            plotOutput("barPlot")
            )
)
)

server <- function(input, output) {
   output$barPlot <- renderPlot({
      ggplot(data = med, aes_string(fill = input$fill)) +
         geom_histogram(aes(x = status), stat = "count") +
         labs(fill = "Fill")
   })
}

# Run the application
shinyApp(ui = ui, server = server)
