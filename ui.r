library(shiny)
library(shinydashboard)

Academics_Data.csv <- read.csv(file = 'Data_Sets/Academics_Data.csv')
GPA_By_State_Data.csv <- read.csv(file = 'Data_Sets/GPA_By_State_Data.csv')
GPA_By_State_Data_2.csv <- read.csv(file = 'Data_Sets/GPA_By_State_Data_2.csv')
In_Out_of_State_Percent.csv <-read.csv(file = 'Data_Sets/In_Out_of_State_Percent.csv')
Major_Data_2.csv <- read.csv(file = 'Data_Sets/Major_Data_2.csv')
Percentages.csv <- read.csv(file = 'Data_Sets/Percentages.csv')
List_Data.csv <- read.csv(file = 'Data_Sets/List_Data.csv')

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
             p("On this page, you can input your own GPA and MCAT scores and see where 
                      you stand in relation to your selected schools of interest."),
             p("Your point will be generated as the cross section of GPA and MCAT 
                      shown by the black lines."),
             p("The bottom graph shows the percent of matriculated students both in 
                      state and out of state for each of your selected schools. This will 
                      help you determine how much state of residence matters for admission to these schools."),
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
                          choices = unique (Academics_Data.csv$Medical_School),
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
                 p("Here you can see information on each state's average MCAT and GPA, as well as how many people from each state apply to medical school."),
        fluidPage(
          sidebarLayout(
            sidebarPanel(
                selectInput(
                            inputId = "State_Input",
                            label = "Select Your State",
                            choices = unique (GPA_By_State_Data.csv$State_of_Legal_Residence),
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
                   p("See how different undergraduate majors fair on the MCAT, Science GPA, and overall GPA. Also see how this translates to admission to medical schools."),
                   plotOutput("MCAT_By_Major"),
                   plotOutput("Cumulative_GPA_By_Major"),
                   plotOutput("Science_GPA_By_Major")
                   ),
                  
          
          tabPanel("Target School List",
                   p("See a list of schools that your average MCAT and GPA are at or above the average MCAT and GPA for that school."),
          fluidPage(
          sidebarLayout(
            sidebarPanel(
                numericInput(
                            inputId = "GPA_Input_2",
                            label = "Enter GPA",
                            value = "0",
                            min = "0",
                            max = "4.0"
                            ),
              
               numericInput(
                           inputId = "MCAT_Input_2",
                           label = "Enter MCAT",
                           value = "472",
                           min = "472",
                           max = "528"
                           )
                       ),
              mainPanel(
                        tableOutput("Target_School_List")
                       )
                      )
                  )
                 )
          
)
