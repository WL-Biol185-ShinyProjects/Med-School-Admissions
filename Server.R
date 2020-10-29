library(shiny)
library(shinydashboard)

function(input, output)
{
output$'Academic_Plot' <- renderPlot({Academics_Data %>% 
                          filter(GPA_Input==input$GPA_Input)%>%
<<<<<<< HEAD
                          filter(MCAT_Input==input$MCAT_Input)%>%
                          ggplot(aes_string("GPA_Input" , "MCAT_Input", fill = "Schools_Input"))
                                +geom_point()
  
=======
                          ggplot(aes(GPA , MCAT))
                              +geom_point()
                                 
>>>>>>> 69fad4be0606856520bd6d8c233fddb6c263003a
                                    })
  


  
}
  