

library(shiny)

shinyUI(fluidPage(
    
    # Application title
    titlePanel("Titanic Survival Rate"),
    
    # Sidebar with radio buttons for the user profile
    sidebarLayout(
        sidebarPanel(
            radioButtons("sex",
                         "What is your Gender?",
                         choices = c("Male", "Female")),
            radioButtons("age",
                         "Are you an Adult or Child?",
                         choices = list("Adult -- I wanted to be a part of history." = "Adult", "Child -- My parents made me come.." = "Child")),
            radioButtons("class",
                          "What ticket did you buy?",
                         choices = list("1st Class"="1st", "2nd Class" = "2nd", "3rd Class" = "3rd", "I was a crewmember" = "Crew"))
        ),
        
        # Displays the survival probability
        mainPanel(
            h4('The probability of you surviving the ride on the Titanic is:'),
            textOutput("probability", container = h3)
        )
    )
))
