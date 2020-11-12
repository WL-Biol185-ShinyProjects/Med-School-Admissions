library(shiny)
library(shinydashboard)
library(tidyverse)
library(tibble)
library(ggplot2)

#load necessary data sets
Academics_Data.csv <- read.csv(file = 'Data_Sets/Academics_Data.csv')
GPA_By_State_Data.csv <- read.csv(file = 'Data_Sets/GPA_By_State_Data.csv')
GPA_By_State_Data_2.csv <- read.csv(file = 'Data_Sets/GPA_By_State_Data_2.csv')
In_Out_of_State_Percent.csv <-read.csv(file = 'Data_Sets/In_Out_of_State_Percent.csv')
Major_Data_2.csv <- read.csv(file = 'Data_Sets/Major_Data_2.csv')
Percentages.csv <- read.csv(file = 'Data_Sets/Percentages.csv')
List_Data.csv <- read.csv(file = 'Data_Sets/List_Data.csv')

#creating each graph that is shown in the app
function(input, output)
{
output$Academic_Plot <- renderPlot({
                                    if (is.numeric(input$GPA_Input) & is.numeric(input$MCAT_Input)) 
                                      {
                                    Academics_Data.csv %>% 
                                    filter(Medical_School %in% input$Schools_Input) %>%
                                      ggplot(aes(Avg_GPA, Avg_MCAT,
                                                 color = Medical_School)) + 
                                        geom_point() +
                                        xlim(0, 4) + ylim(472, 528) +
                                        geom_hline(yintercept = input$MCAT_Input) +
                                        geom_vline(xintercept = input$GPA_Input) +
                                        labs(x = "GPA", y = "MCAT")
                                      }
                                   })
                        
output$Academics_By_State_Graph <- renderPlot({GPA_By_State_Data.csv %>%
                                              filter(State_of_Legal_Residence %in% input$State_Input) %>%
                                                ggplot(aes(Total_GPA_Mean, State_Avg_MCAT,
                                                           color = State_of_Legal_Residence)) +
                                                geom_point() +
                                              xlim(3, 4) + ylim(490, 528) +
                                              labs(x = "GPA", y = "MCAT")
                                              })

output$Applicants_By_State_Graph <- renderPlot({GPA_By_State_Data_2.csv %>%
                                                filter(State_of_Legal_Residence %in% input$State_Input) %>%
                                                  ggplot(aes(State_of_Legal_Residence, Total_Applicants,
                                                             fill = State_of_Legal_Residence)) +
                                                    geom_bar(stat = 'identity') +
                                                 labs(x = "State", y = "Total Applicants")
                                              })

output$MCAT_GPA_Scatterplot <- renderPlot({Major_Data_2.csv %>%
                                              filter(Applicant_or_Matriculant %in% input$Matriculant_or_Applicant) %>%
                                                ggplot(aes(Total_GPA_Mean, Total_MCAT, color = Major)) +
                                                  geom_point(size = 3) +
                                              labs(x = "GPA", y = "MCAT")
                                          })

output$MCAT_By_Major <- renderPlot({Major_Data_2.csv %>%
                                          ggplot(aes(Major, Total_MCAT,
                                                     fill = Applicant_or_Matriculant)) +
                                            geom_bar(stat = 'identity',
                                                    position = 'dodge') +
                                                theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
                                            labs(x = "Major", y = "MCAT")
                                        })

output$Cumulative_GPA_By_Major <- renderPlot({Major_Data_2.csv %>%
                                   ggplot(aes(Major, Total_GPA_Mean,
                                              fill = Applicant_or_Matriculant)) +
                                     geom_bar(stat = 'identity',
                                              position = 'dodge') +
                                          theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
                                      labs(x = "Major", y = "Cumulative GPA")
                                  })

output$Science_GPA_By_Major <- renderPlot({Major_Data_2.csv %>%
                                           ggplot(aes(Major, Science_GPA_Mean,
                                                      fill = Applicant_or_Matriculant)) +
                                             geom_bar(stat = 'identity',
                                                      position = 'dodge') +
                                               theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
                                              labs(x = "Major", y = "Science GPA")
                                          })

output$State_Percentages <- renderPlot({Percentages.csv %>%
                                        filter(Medical_School %in% input$Schools_Input) %>%
                                          ggplot(aes(In_or_Out, Matriculants_Percent,
                                                     fill = Medical_School)) +
                                            geom_bar(stat = 'identity',
                                                     position = 'dodge') +
                                              labs(x = "In or Out of State", y = "Percent of Matriculants")
                                      })

output$Target_School_List <- renderTable({List_Data.csv %>%
                                          filter(input$MCAT_Input_2 >= Avg_MCAT,
                                                 input$GPA_Input_2 >= Avg_GPA
                                                 )
                                        }) 
}

  