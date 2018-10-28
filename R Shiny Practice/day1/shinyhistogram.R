library(shiny)

ui<-fluidPage(
  
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "num",
                  label= "Number of bins:",
                  min=1,
                  max=100,
                  value=30),
      textInput(inputId = "title",
                label = "Write a title",
                value = "Histogram of Random Values")
      ),
    mainPanel(plotOutput("hist"))
    )
  )
  server=function(input,output){
    
    output$hist<-renderPlot({
      hist(rnorm(input$num),
           main=isolate({input$title}))
          })
  }
  # Run the application
  shinyApp(ui=ui,server=server)
  
  
