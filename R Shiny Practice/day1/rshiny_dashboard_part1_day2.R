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
      menuSubItem("SubItem A"),
      menuSubItem("SubItem B"),
    menuItem("Item 2", tabName = "item2"),
    menuItem("Item 3",tabName = "item3")
    )),
  dashboardBody(
    tabItems(
    tabItem(tabName = "item1",
    fluidRow(
      box(plotOutput("histogram"))
    )
    ),
   tabItem(tabName = "item2",
          h1("Item 2 DashBoard")),
    tabItem(tabName = "item3",
          h1("Item 3 dashboard"))
 )
))
)


server=function(input,output){
  output$histogram=renderPlot({
    hist(faithful$eruptions,breaks = input$bins)
  })
  
}

shiny::shinyApp(ui=ui,server=server)