library(shiny)
library(shinydashboard)

#code to load data sets
Academics_Data.csv <- read.csv(file = 'Data_Sets/Academics_Data.csv')
GPA_By_State_Data.csv <- read.csv(file = 'Data_Sets/GPA_By_State_Data.csv')
GPA_By_State_Data_2.csv <- read.csv(file = 'Data_Sets/GPA_By_State_Data_2.csv')
In_Out_of_State_Percent.csv <-read.csv(file = 'Data_Sets/In_Out_of_State_Percent.csv')
Major_Data_2.csv <- read.csv(file = 'Data_Sets/Major_Data_2.csv')
Percentages.csv <- read.csv(file = 'Data_Sets/Percentages.csv')
List_Data.csv <- read.csv(file = 'Data_Sets/List_Data.csv')

#create the dashboard setup
navbarPage("Medical School Admissions",

          #code for each tab and what it will display
          tabPanel("Introduction",
                   p(h1(("Welcome!"),
                        style = "color: blue",
                        align = "center"
                        )),
                   img(src= "Accepted_Image.jpg", align = "center"),
                   p(h3(("Our app aims to provide a general picture of your odds of being accepted
                     into chosen allopathic medical schools based on past applicant and matriculant data. Here, you
                     can visualize your statistics compared to your schools of interest and gauge 
                     your likelihood of acceptance."),
                        align = "center"
                        ))
                   ),
          
           tabPanel("Academics",
                    
            fluidPage(
              p(h3("On this page, you can input your own GPA and MCAT scores and see where 
                      you stand in relation to your selected schools of interest.")),
              sidebarLayout(
                sidebarPanel(
                    #code for inputs
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
                #code to show what we want in the main panel
                mainPanel(p("Your point will be generated as the cross section of GPA and MCAT 
                            shown by the black lines."),
                          plotOutput("Academic_Plot"),
                          p("This graph shows the percent of matriculated students both in 
                            state and out of state for each of your selected schools. This will 
                            help you determine how much state of residence matters for admission 
                            to these schools."),
                          plotOutput("State_Percentages")
                         )
                       )
                     )
                   ),
             
    
          tabPanel("By State",
                   p(h3("Here you can see information on each state's average MCAT and GPA, as well 
                     as how many people from each state apply to medical school.")),
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
                     p(h3("See how different undergraduate majors fair on the MCAT, Science GPA, 
                       and overall GPA. Also see how this translates to admission to medical schools.")),
              fluidPage(
                 sidebarLayout(
                   sidebarPanel(
                        radioButtons(
                                     inputId = "Matriculant_or_Applicant",
                                     label = "Select Matriculants or Applicants",
                                     choices = unique (Major_Data_2.csv$Applicant_or_Matriculant),
                                     )
                               ),
                   mainPanel(
                            plotOutput("MCAT_GPA_Scatterplot"),
                            plotOutput("MCAT_By_Major"),
                            plotOutput("Cumulative_GPA_By_Major"),
                            plotOutput("Science_GPA_By_Major")
                            )
                             )
                        )
                     ),
                    
            
            tabPanel("Target School List",
                     p(h3("See a list of schools that your average MCAT and GPA are at or above 
                       the average MCAT and GPA for that school.")),
              fluidPage(
                sidebarLayout(
                  sidebarPanel(
                      numericInput(
                                  inputId = "GPA_Input_2",
                                  label = "Enter GPA",
                                  value = "3.75",
                                  min = "0",
                                  max = "4.0"
                                  ),
                    
                     numericInput(
                                 inputId = "MCAT_Input_2",
                                 label = "Enter MCAT",
                                 value = "510",
                                 min = "472",
                                 max = "528"
                                 )
                             ),
                    mainPanel(
                              tableOutput("Target_School_List")
                             )
                            )
                        )
                      ),
          
          tabPanel("About",
                   p(h1(("About the Creators"), 
                        style = "color: blue",
                        align = "center"
                        )),
                   p(h3(("The creators of this shiny app are Grace Amaden '21, Hal Fant '22 and 
                         Annie Furr '22. All three of us are pre-medical students which inspired the 
                         idea for this app."), 
                        align = "center"
                        )),
                   p(h3(("We could not have done this without help from our professor, Dr. Gregg 
                         Whitworth!"),
                        align = "center"
                        )),
                   p(h3(("We hope you find this app useful when looking to apply to medical school!"),
                     align = "center"
                     )),
                   p(h1(("Sources"), 
                        style = "color: blue",
                        align = "center"
                        )),
                   p(h3(("Tables A1, A17, A19, from AAMC 2020 Facts Page: https://www.aamc.org/
                         data-reports/students-residents/interactive-data/2020-facts-applicants-and-
                         matriculants-data"),
                     align = "center"
                     )),
                   p(h3(("MCAT Test Scores: https://www.mcattestscores.com/usmedicalschoolsmcat
                         scoresGPA.html#Newyork"),
                     align = "center"
                     ))
                  )
              
        )
