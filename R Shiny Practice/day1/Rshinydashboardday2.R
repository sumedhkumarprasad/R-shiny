library(shiny)
library(shinydashboard)
ui = shinyUI(
  dashboardPage(
    dashboardHeader(title = "R shiny First Dashboard"),
    dashboardSidebar(
      sliderInput(inputId = "bins",
                  label = "Number of Bins",
                  min = 1,
                  max = 50,
                  value = 20),
      sidebarMenu(
        menuItem("Item 1", tabName = "item1"),
        
        menuItem("Item 2", tabName = "item2")
      ))
    
)
)

server=function(input,output){
  output$histogram=renderPlot({
    hist(faithful$eruptions,iris$Sepal.Length)
  })
  
}

shinyApp(ui,server)