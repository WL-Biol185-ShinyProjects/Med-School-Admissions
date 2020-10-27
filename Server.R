library(shiny)
library(shinydashboard)

function(input, output)
{
output$'Academic_Plot' <- renderPlot({GPA_Input %>% 
                          filter(GPA_Input==input$GPA_Input)%>%
                          ggplot(Academics_Data, aes(GPA , MCAT))
                              +geom_point()
                                 
                                    })

  
}
  