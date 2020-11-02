library(shiny)
library(shinydashboard)
library(tidyverse)


function(input, output)
{
output$Academic_Plot <- renderPlot({Academics_Data %>% 
                          filter(Medical_School %in% input$Schools_Input) %>%
                          ggplot(aes(Avg_GPA, Avg_MCAT,
                                            color = Medical_School)) + 
                                 geom_point() +
                                  xlim(0, 4) + ylim(472, 528) +
                                  geom_hline(yintercept = input$MCAT_Input)+
                                  geom_vline(xintercept = input$GPA_Input)

                                     })
  

}
  