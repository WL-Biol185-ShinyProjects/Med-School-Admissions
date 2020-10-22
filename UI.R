library(shiny)


navbarPage("Medical School Admissions")

          tabPanel("About")
          
           tabPanel("Academics")
           fluidPage(
            sidebarLayout(
              sidebarPanel(
                numericInput(
                             inputId = "GPA_Input",
                             label = "Enter GPA",
                             value = "0",
                             min = "0",
                             max = "4.0"
                             ),
                            
                numericInput(
                            inputId = "MCAT_Input",
                            label = "Enter MCAT",
                            value = "472",
                            min = "472",
                            max = "528"
                            ),
                            
               selectInput(
                          inputId = "Schools_Input",
                          label = "Select Schools",
                          choices = list("School_Scores_Data$'Medical School'"),
                          multiple = TRUE
                          ),
                 
                       ),
              mainPanel()
                     )
                   )
           
  
        tabPanel("By state")
        fluidPage(
          sidebarLayout(
            sidebarPanel(
                selectInput(
                            inputId = "State_Input",
                            label = "Select Your State",
                            choices = list("$''"),
                            multiple = TRUE
                ),
                      mainPanel()
            
        
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
                         ),
                      mainPanel()
                        )
                    )
      
          