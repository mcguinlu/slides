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
  titlePanel(title = "Demo of a shiny app"), 
  
  # Define sidebar layout
  sidebarLayout(
    sidebarPanel(  
      # Define number of observations to plot in the figure
      sliderInput(inputId = "numberofrowsplot",
                  label = "Number of rows to plot in figure",
                  value = 100,
                  min = 50,
                  max = 150),
      
      # Define number of observations to show in the table
      numericInput(inputId = "numberofrowstable",
                   label = "Number of rows to show in table",
                   value = 10,
                   min = 5,
                   max = 20,
                   step = 5),
      
      # Define the variable that is used to colour the points
      selectInput(inputId = "pointcolour",
                  label = "Variable to fill by:",
                  choices = c("sex","diet","status")),
      
      # Define the plot's title
      textInput(inputId = "titletext",
                label = "Plot title:"),
      
      p("This data set describes a population of participants.")
    ),
    
    mainPanel(
      h2("Plot"),
      
      plotOutput("barPlot"),
      
      h2("Table"),
      p("This table shows more detailed on the participants in the dataset."),
      p(em("The number of rows shown is controlled by the slider on the left.")),
      
      tableOutput("table")
      
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
                     n = input$numberofrowsplot)
    
    # Create plot using the restricted dataset
    ggplot(data = bmi_plot, aes_string(color = input$pointcolour)) +
      geom_point(aes(x = age, y= bmi)) +
      labs(title = input$titletext)
    
  })
  
  # Create table object
  output$table <- renderTable({
    head(x = bmi,
         n = input$numberofrowstable)
  })
  
}

#############################
# CALL TO shinyApp FUNCTION #
#############################

shinyApp(ui = ui, server = server)