library(shiny)
library(shinydashboard)

navbarPage("Medical School Admissions",

          tabPanel("About",
                   img(src= "Accepted_Image.jpg", align = "center"),
                   p("Our app aims to porvide a general picture of your odds of being accepted
                     into chosen schools based on past applicant and matriculant data. Here you 
                     visualize your statistics compared to your schools of interest and gauge 
                     your likelihood of acceptance.")
                   ),
          
           tabPanel("Academics",
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
                          choices = unique (School_Scores_Data $ 'Medical School'),
                          multiple = TRUE
                          )
                       ),
                 mainPanel()
                     )
                   )
                 ),
           
  
        tabPanel("By state",
        fluidPage(
          sidebarLayout(
            sidebarPanel(
                selectInput(
                            inputId = "State_Input",
                            label = "Select Your State",
                            choices = unique (GPA_By_State_Data $ 
                                           'State of Legal Residence'),
                            multiple = TRUE
                           )
                        ),
                  mainPanel()
                      )
                )
               ),
        
          tabPanel("By Major"),
                  
          
          tabPanel("Target School List",
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
                           )
                       ),
                      mainPanel()
                      )
                    )
              )
          )