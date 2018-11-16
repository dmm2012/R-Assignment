server <- function(input, output, session) {
  filtered_data <- reactive({filter(medals_by_demographic, Sex == input$cb)})
  observe({
    updateSelectInput(session,"si", choices = unique(filtered_data()$Year))
  })
  
  
  filtered_data_2 <- reactive({filter(filtered_data(), Year == input$si, Age <= input$sl)})
  
  filtered_data_3 <- reactive({filter(medals_by_demographic, Event == input$si2)})
  
  output$hist <- renderPlotly(
    {
      p <- ggplot(filtered_data_2(), aes(x =Sex, fill = Sex))+geom_histogram(stat = "count", width = .3)+theme_bw()
      ggplotly(p)    
    }
  )
  
  output$hist2 <- renderPlotly(
    {
      q <- ggplot(filtered_data_2(), aes(x =Age))+geom_histogram(stat = "count", width = .3)+theme_bw()
      ggplotly(q)    
    }
  )
  
  output$table <- renderDataTable(
    {
      select(filtered_data_3(),c("Name","Year","Event","Age","Sex", "Medal"))
    }
  )
  output$to <- renderText({
    paste("This app allows users to explore the competitors, events and results of 120 years of Olympic history.  The dataset comes from Kaggle (https://www.kaggle.com/heesoo37/120-years-of-olympic-history-athletes-and-results).  ")
  }
  )
  output$to2 <- renderText({
    paste("_____________________________________________________________________")
  }
  )
  output$to3 <- renderText({
    paste("The features included in the dataset are listed below...")
  }
  )
  output$to2 <- renderText({
    paste("_____________________________________________________________________")
  }
  )
  output$to4 <- renderText({
    paste("* Name - Athlete Name")
  }
  )
  output$to5 <- renderText({
    paste("* Sex - Athlete Sex")
  }
  )
  output$to6 <- renderText({
    paste("* Age - Athlete Age")
  }
  )
  output$to7 <- renderText({
    paste("* Height - Athlete Height")
  }
  )
  output$to8 <- renderText({
    paste("* Weight - Athlete Weight")
  }
  )
  output$to9 <- renderText({
    paste("* Team - Athlete Team")
  }
  )
  output$to10 <- renderText({
    paste("* NOC - National Olympics Comittee 3-letter code")
  }
  )
  output$to11 <- renderText({
    paste("* Year - Year and season of Olympics")
  }
  )
  output$to12 <- renderText({
    paste("* Year")
  }
  )
  output$to13 <- renderText({
    paste("* Season - Season of Olympics")
  }
  )
  output$to14 <- renderText({
    paste("* City - City the games were hosted in")
  }
  )
  output$to15 <- renderText({
    paste("* Sport - Category of Sport")
  }
  )
  output$to16 <- renderText({
    paste("* Event - Specific event the athlete competed in")
  }
  )
  output$to17 <- renderText({
    paste("* Medal - Gold, Silver, Bronze, None")
  }
  )
}