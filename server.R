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

output$MCAT_By_Major <- renderPlot({Major_Data_2 %>%
                                          ggplot(aes(Major, Total_MCAT,
                                                     fill = Applicant_or_Matriculant)) +
                                          geom_bar(stat = 'identity',
                                                   position = 'dodge')
                                        })

output$Cumulative_GPA_By_Major <- renderPlot({Major_Data_2 %>%
                                   ggplot(aes(Major, Total_GPA_Mean,
                                              fill = Applicant_or_Matriculant)) +
                                   geom_bar(stat = 'identity',
                                            position = 'dodge')
                                  })

output$Science_GPA_By_Major <- renderPlot({Major_Data_2 %>%
                                           ggplot(aes(Major, Science_GPA_Mean,
                                                      fill = Applicant_or_Matriculant)) +
                                           geom_bar(stat = 'identity',
                                                    position = 'dodge')
                                          })

output$State_Percentages <- renderPlot({Percentages %>%
                                        filter(Medical_School %in% input$Schools_Input) %>%
                                        ggplot(aes(In_or_Out, Matriculants_Percent,
                                                   fill = Medical_School)) +
                                        geom_bar(stat = 'identity',
                                                 position = 'dodge')
                                      })


}
  