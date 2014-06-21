

library(shiny)
library(datasets)
library(plyr)
titanic <- adply(Titanic, c(1,2,3))

shinyServer(function(input, output) {

    output$probability <- renderText({
        sex <- input$sex
        age <- input$age
        class <- input$class
        yes <- titanic$Yes[titanic$Class == class & titanic$Sex == sex & titanic$Age == age]
        no <- titanic$No[titanic$Class == class & titanic$Sex == sex & titanic$Age == age]
        prob <- yes / (yes + no)
        if (is.na(prob)) {
            paste("No children were employed in the crew of the Titanic")
        }
        else {
            paste(round(100*prob, 2), "%", sep = "")
        }
    })
    
})
