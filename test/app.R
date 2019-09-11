library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

textInput("textin", label = ""),
textOutput("textout")

)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$textout <- renderText({
        input$textin
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
