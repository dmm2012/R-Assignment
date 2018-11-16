ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      tabsetPanel(
        tabPanel("Gender Filter",
                 checkboxGroupInput("cb", "Select Gender", choices = unique(medals_by_demographic$Sex),selected = unique(medals_by_demographic$Sex)[1:2],inline = FALSE)
                 
        ),
        tabPanel("Year Filter",
                 selectInput("si","Select Year",choices = unique(medals_by_demographic$Year)
                 )
        ),
        tabPanel("Age Filter",
                 sliderInput("sl", "Age Range", min = +10, max = +97, value =97)),
        tabPanel("Event Filter",
                 selectInput("si2", "Select Event", choices = unique(medals_by_demographic$Event), multiple = TRUE
                 )
        )
      )
      
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Gender Histogram",
                 h2("Total Medals per Year by Gender"),
                 plotlyOutput("hist")
        ),
        tabPanel("Age Histogram",
                 h2("Total Medals per Year by Age Range"),
                 plotlyOutput(outputId = "hist2")
        ),
        tabPanel("Discontinued Sports Data Table",
                 h3("Past Medal Winners-Discontinued Sports"),
                 dataTableOutput(outputId = "table")
        ),
        tabPanel("ReadMe",
                 h4("Olympic Games 1896-2016"),
                 textOutput("to"),
                 textOutput("to2"),
                 textOutput("to3"),
                 textOutput("to4"),
                 textOutput("to5"),
                 textOutput("to6"),
                 textOutput("to7"),
                 textOutput("to8"),
                 textOutput("to9"),
                 textOutput("to10"),
                 textOutput("to11"),
                 textOutput("to12"),
                 textOutput("to13"),
                 textOutput("to14"),
                 textOutput("to15"),
                 textOutput("to16"),
                 textOutput("to17")
        )
        
      )
      
    )
  )
  
  
)