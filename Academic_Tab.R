library(shiny)
library(dplyr)
library(ggplot2)
source()

#Code for the title of the tab

#Code for page title
titlePanel("Academics"),

#explanation of what this tab shows
p("This tab allows you to compare your personal academic data to the averages from selected 
  medical schools. You can select which schools you want to view, then see your information 
  side-by-side with the matriculated average. The in and out of state percent matriculated 
    per school is also shown."),

#school drop down bar
selectInput("Schools", ""
            unique(Academics_Data$`Medical School`))
  

#enter your own info


#MCAT/GPA chart data
ggplot(A1, aes ())

#in/out of state data



