# Load shiny package
library(shiny)

# Define UI for application that adds two numbers
ui <- fluidPage(

  # Allow user to define two numbers
  numericInput("add_1", "Number:", value = 0),
  numericInput("add_2", "Number:", value = 0),

  # Display the output
  textOutput("sum")
    
)

# Define server logic required to add numbers
server <- function(input, output) {
  
  
  output$sum <- renderText({

    input$add_1 + input$add_2
    
  })
}

# Run the application 
shinyApp(ui = ui, server = server)