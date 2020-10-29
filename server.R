library(shiny)
library(shinydashboard)


function(input, output)
{
output$'Academic_Plot' <- renderPlot({Academics_Data %>% 
                          filter(Avg_GPA == input $ "GPA_Input",
                                 Avg_MCAT == input $ "MCAT_Input") %>%
                          ggplot(aes('Avg_GPA' , 'Avg_MCAT',
                                            fill = "Schools_Input"))
                                +geom_point()
  


                                     })
  

}
  