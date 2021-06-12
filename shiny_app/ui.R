#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Prediction of the Waiting Time after a Geyser Eruption"),

    # Sidebar with a slider input to select the number of seconds eruption time
    sidebarLayout(
        sidebarPanel(
            h3("Eruption time"),
            p("The waiting time until the next geyser eruption will be predicted for the selected eruption time 
              and the used data plus the predicted value (orange dot) will be displayed on a scatter plot."),
            p("Now select the eruption time (seconds) for which the waiting time should be predicted:"),
            sliderInput("eruptionTime", "Selected Eruption time",
                        min = 1, max = 15, value = 5, step = 1),
            hr()
        ),

        # Show the plotted data set and the predicted waiting time
        mainPanel(
            h3("Predicted waiting time"),
            strong(textOutput("prediction")),
            plotOutput("predictionPlot")
        )
    )
))
