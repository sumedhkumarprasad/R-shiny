library(shiny)
bcl = read.csv("bcl-data.csv",stringsAsFactors = FALSE)

ui=fluidPage(
  numericInput(inputId = "num",
               label = "Maximum slider value",
               value = 5),
  uiOutput("slider")
  
)
server= function(input,output){
  output$slider=renderUI({
    sliderInput(inputId = "slider",
                label = "Slider",
                min = 0,
                max=input$num,
                value = 0)
  })
}
shinyApp(ui,server)