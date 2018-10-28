library(shiny)

ui<-fluidPage(
  
  sidebarLayout(
    sidebarPanel("Convert Feet to Inches",
                 
                 numericInput(inputId = "number1",
                              label = "Enter Value in Feet:",
                              min = 20,
                              max = 100,
                              value = 40),
                 
                 actionButton(inputId = "button",label = "Calculate")
                 
    ),
    mainPanel("LAB EXERCISE 2 CONVERT FEET TO INCHES",
              br(),
              "Inches",
              br(),
              textOutput("total"))
  )
)
server<- function(input,output){
  calculate=eventReactive(input$button,input$number1*12)
  output$total<-renderText({calculate()})
}
shinyApp(ui,server)
