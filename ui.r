library(shiny)
library(shinydashboard)
#code to load tables

navbarPage("Medical School Admissions",

          tabPanel("About",
                   img(src= "Accepted_Image.jpg", align = "center"),
                   p("Our app aims to porvide a general picture of your odds of being accepted
                     into chosen schools based on past applicant and matriculant data. Here you 
                     visualize your statistics compared to your schools of interest and gauge 
                     your likelihood of acceptance.")
                   ),
          
           tabPanel("Academics",
                    p("On this page, you can input your own GPA and MCAT scores and see where you stand in relation to your selected schools of interest."),
                    p("Your point will be generated as the cross section of GPA and MCAT shown by the black lines.")),
                    p("The bottom graph shows the percent of matriculated students both in state and out of state for each of your selected schools. This will help you determine how much state of residence matters for admission to these schools."),
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
                          choices = unique (Academics_Data$Medical_School),
                          multiple = TRUE
                          )
                       ),
              mainPanel(
                        plotOutput("Academic_Plot"),
                        plotOutput("State_Percentages")
                       )
                     )
                   )
                 ),
           
  
        tabPanel("By State",
                 p("")
        fluidPage(
          sidebarLayout(
            sidebarPanel(
                selectInput(
                            inputId = "State_Input",
                            label = "Select Your State",
                            choices = unique (GPA_By_State_Data$State_of_Legal_Residence),
                            multiple = TRUE
                           )
                        ),
             mainPanel(
                        plotOutput("Academics_By_State_Graph"),
                        plotOutput("Applicants_By_State_Graph")
                       )
                      )
                )
               ),
        
          tabPanel("By Major",
                   plotOutput("MCAT_By_Major"),
                   plotOutput("Cumulative_GPA_By_Major"),
                   plotOutput("Science_GPA_By_Major")
                   ),
                  
          
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
       
