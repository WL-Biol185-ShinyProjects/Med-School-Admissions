library(markdown)

navbarPage("Medical School Admissions",
          tabPanel("About"),
          p("Write stuff for about here")
           tabPanel("Academics"),
            sidebarLayout(
              sidebarPanel(
                radioButtons("plotType", "select schools",
                             c("Scatter"="p")
                )
          ),
          mainPanel(
            plotOutput("plot")
          )
            )
),
        tabPanel("By state")
          sidebarLayout(
            sidebarPanel(
                radioButtons("plotType", "choose your state",
                              c("Scatter"="p")
                )
            ),
                 tabPanel("By Major")
                  sidebarLayout(
                    sidebarPanel()
                  )
          ),
          tabPanel("Target School List")
          sidebarLayout(
            sidebarPanel(
            )
          ),
          

