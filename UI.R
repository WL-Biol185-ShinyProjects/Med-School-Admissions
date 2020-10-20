library(markdown)

navbarPage("Medical School Admissions",
          tabPanel("About"),
          p("Write stuff for about here"),
          
           tabPanel("Academics"),
           fluidpage(
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
          )
            )
           ),
          mainPanel(
            plotOutput("plot")
          )
            )
  
        tabPanel("By state")
        fluidpage(
          sidebarLayout(
            sidebarPanel(
                selectInput("plotType", "choose your state",
                              c("Scatter"="p")
                )
            )))
                 tabPanel("By Major")
                  
                  
          
          tabPanel("Target School List")
          fluidpage(
          sidebarLayout(
            sidebarPanel(
              numericInput("plotType", "Enter GPA",
                                      c("Scatter"="p"),
                                      numericInput("plotType", "Enter MCAT score",
                                                   c("Scatter"="p"),
            )
          ))))
          

