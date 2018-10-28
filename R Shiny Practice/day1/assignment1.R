library(shiny)

ui<-fluidPage(
  
  sidebarLayout(
    sidebarPanel("Add Two Numbers",
      
      numericInput(inputId = "number1",
                   label = "First Number",
                   min = 20,
                   max = 100,
                   value = 40),
      
      
      numericInput(inputId = "number2",
                   label = "Second Number",
                   min = 40,
                   max=100,
                   value = 50),
      actionButton(inputId = "button",label = "Calculate")
      
    ),
    mainPanel("Lab Excercise 1 ADD TWO NUMBERS",
              br(),
              textOutput("total"))
  )
)
server<- function(input,output){
  calculate=eventReactive(input$button,input$number1+input$number2)
  output$total<-renderText({calculate()})
}
shinyApp(ui,server)
