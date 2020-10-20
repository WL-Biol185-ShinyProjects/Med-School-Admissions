library(shiny)


navbarPage("Medical School Admissions",
          tabPanel("About")
)
          
           tabPanel("Academics")
           fluidPage(
            sidebarLayout(
              sidebarPanel(
                numericInput("plotType", "Enter GPA",
                             c("Scatter"="p"),
                numericInput("plotType", "Enter MCAT score",
                             c("Scatter"="p"),
               selectInput("plotType", "Select schools",
                                          c("Scatter"="p")
                          )
                            )
                            )
                          ),
                       mainPanel()
                          )
                    )
          
            
  
        tabPanel("By state")
        fluidPage(
          sidebarLayout(
            sidebarPanel(
                selectInput("plotType", "choose your state",
                              c("Scatter"="p")
                )
            )))
                 tabPanel("By Major")
                  
                  
          
          tabPanel("Target School List")
          fluidPage(
          sidebarLayout(
            sidebarPanel(
              numericInput("plotType", "Enter GPA",
                                      c("Scatter"="p"),
                                      numericInput("plotType", "Enter MCAT score",
                                                   c("Scatter"="p"),
                                                  )
                           )
                         )
                        )
                    )
      
          
#enter main panel argument for each tab-put inside sidebar layout
