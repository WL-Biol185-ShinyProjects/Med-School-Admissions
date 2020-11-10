library(shiny)
library(shinydashboard)
library(tidyverse)
library(tibble)

Academics_Data.csv <- read.csv(file = 'Data_Sets/Academics_Data.csv')
GPA_By_State_Data.csv <- read.csv(file = 'Data_Sets/GPA_By_State_Data.csv')
GPA_By_State_Data_2.csv <- read.csv(file = 'Data_Sets/GPA_By_State_Data_2.csv')
In_Out_of_State_Percent.csv <-read.csv(file = 'Data_Sets/In_Out_of_State_Percent.csv')
Major_Data_2.csv <- read.csv(file = 'Data_Sets/Major_Data_2.csv')
Percentages.csv <- read.csv(file = 'Data_Sets/Percentages.csv')

function(input, output)
{
output$Academic_Plot <- renderPlot({Academics_Data.csv %>% 
                                    filter(Medical_School %in% input$Schools_Input) %>%
                                    ggplot(aes(Avg_GPA, Avg_MCAT,
                                               color = Medical_School)) + 
                                    geom_point() +
                                    xlim(0, 4) + ylim(472, 528) +
                                    geom_hline(yintercept = input$MCAT_Input)+
                                    geom_vline(xintercept = input$GPA_Input)
                                   })

output$Academics_By_State_Graph <- renderPlot({GPA_By_State_Data.csv %>%
                                              filter(State_of_Legal_Residence %in% input$State_Input) %>%
                                              ggplot(aes(Total_GPA_Mean, State_Avg_MCAT,
                                                         color = State_of_Legal_Residence)) +
                                              geom_point() +
                                              xlim(0, 4) + ylim(472, 528)
                                              })

output$Applicants_By_State_Graph <- renderPlot({GPA_By_State_Data_2.csv %>%
                                                filter(State_of_Legal_Residence %in% input$State_Input) %>%
                                                ggplot(aes(State_of_Legal_Residence, Total_Applicants,
                                                           fill = State_of_Legal_Residence)) +
                                                geom_bar(stat = 'identity')
                                              })

output$MCAT_By_Major <- renderPlot({Major_Data_2.csv %>%
                                          ggplot(aes(Major, Total_MCAT,
                                                     fill = Applicant_or_Matriculant)) +
                                          geom_bar(stat = 'identity',
                                                   position = 'dodge')
                                        })

output$Cumulative_GPA_By_Major <- renderPlot({Major_Data_2.csv %>%
                                   ggplot(aes(Major, Total_GPA_Mean,
                                              fill = Applicant_or_Matriculant)) +
                                   geom_bar(stat = 'identity',
                                            position = 'dodge')
                                  })

output$Science_GPA_By_Major <- renderPlot({Major_Data_2.csv %>%
                                           ggplot(aes(Major, Science_GPA_Mean,
                                                      fill = Applicant_or_Matriculant)) +
                                           geom_bar(stat = 'identity',
                                                    position = 'dodge')
                                          })

output$State_Percentages <- renderPlot({Percentages.csv %>%
                                        filter(Medical_School %in% input$Schools_Input) %>%
                                        ggplot(aes(In_or_Out, Matriculants_Percent,
                                                   fill = Medical_School)) +
                                        geom_bar(stat = 'identity',
                                                 position = 'dodge')
                                      })

output$Target_School_List <- renderTable({filter(List_Data.csv, Avg_GPA <= input$GPA_Input,
                                                 Avg_MCAT <= input$MCAT_Input)
                                        })


}
  