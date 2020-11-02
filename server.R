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

output$Academics_By_State_Graph <- renderPlot({GPA_By_State_Data %>%
                                              filter(State_of_Legal_Residence %in% input$State_Input) %>%
                                              ggplot(aes(Total_GPA_Mean, State_Avg_MCAT,
                                                         color = State_of_Legal_Residence)) +
                                              geom_point() +
                                              xlim(0, 4) + ylim(472, 528)
                                              })

output$Applicants_By_State_Graph <- renderPlot({GPA_By_State_Data %>%
                                                filter(State_of_Legal_Residence %in% input$State_Input) %>%
                                                ggplot(aes(State_of_Legal_Residence, Total_Applicants,
                                                           fill = State_of_Legal_Residence)) +
                                                geom_bar(stat = 'identity')
                                              })
  

}
  