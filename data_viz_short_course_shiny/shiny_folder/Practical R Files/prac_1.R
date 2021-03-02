############################################
# LOAD EXTERNAL PACKAGES, SCRIPTS AND DATA #
############################################

library(shiny)
library(ggplot2)

bmi <- read.csv("http://bit.ly/bris-data-viz-bmi")

##################
# USER INTERFACE #
##################

ui <- fluidPage(
  titlePanel("This is the title"),
  sidebarLayout(
    sidebarPanel(
      # Define number of observations to plot in the figure
      sliderInput(
        inputId = "numberofpoints",
        label = "Number of points to plot in figure",
        value = 100,
        min = 50,
        max = 150
      ),
    ), 
    mainPanel(
      plotOutput("barPlot")
      )
    )
  )

##########
# SERVER #
##########

server <- function(input, output) {
  
  # Create plot object
  output$barPlot <- renderPlot({
    
    # Restrict the bmi dataset to the number of rows defined by the slider
    bmi_plot <- head(x = bmi,
                      n = input$numberofpoints)
    
    # Create plot using the restricted dataset
    ggplot(data = bmi_plot, aes_string(color = "diet")) +
      geom_point(aes(x = age, y= bmi)) +
      labs(title = "Plot title")
    
  })
}

#############################
# CALL TO shinyApp FUNCTION #
#############################

shinyApp(ui = ui, server = server)