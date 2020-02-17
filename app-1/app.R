library(shiny)
library(ggplot2)

bmi2 <- read.csv("http://bit.ly/phd-intro-bmi2")

ui <- fluidPage(
   sidebarLayout(
      sidebarPanel(
         selectInput(
            inputId = "fill",
            label = "Variable to fill by:",
            choices = c("Health status" = "status",
                        "Diet" = "diet"))
      ),
      
      mainPanel(plotOutput("barPlot"))
      
   )
)

server <- function(input, output) {
   output$barPlot <- renderPlot({
      ggplot(data = bmi2) +
         aes(x = sex) +
         aes_string(fill = input$fill) +
         geom_histogram(stat = "count") +
         labs(fill = "Fill")
   })
}

# Run the application
shinyApp(ui = ui, server = server)
