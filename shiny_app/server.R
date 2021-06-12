#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    fit <- lm(waiting ~ eruptions, data = faithful)
    prediction <- reactive({
        predict(fit, newdata = data.frame(eruptions = c(input$eruptionTime)));
    })
    
    output$prediction <- renderText(paste("The predicted waiting time after an eruption of",
                                          format(input$eruptionTime, digits = 2, nsmall = 0), 
                                          "seconds is",
                                          format(prediction(), digits = 2, nsmall = 0),
                                          "seconds!"))
    output$predictionPlot <- renderPlot({
        predValue <- prediction()
        
        plot(append(faithful$eruptions, c(input$eruptionTime)), 
             append(faithful$waiting, predValue), 
             xlab = "Eruption Time (s)", ylab = "Waiting Time (s)", 
             main = "Waiting Time depending on the Eruption Time of a Geyser")
        abline(fit, col = "blue", lwd = 1)
        points(c(input$eruptionTime), predValue, type = "p", pch = 19, cex = 2, col = "orange")
    })

})
