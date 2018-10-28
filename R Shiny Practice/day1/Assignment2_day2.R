ui=shinyUI(
  dashboardPage(
    dashboardHeader(title="HEADER"),
    dashboardSidebar(
      
      sidebarMenu(
        menuItem("Item 1",tabName = "item1"),
        menuSubItem("Sub Item A"),
        menuSubItem("Sub Item B"),
        menuItem("Item 2",tabName = "item2"),
        menuItem("Item 3",tabName = "item3")
      )),
    dashboardBody(
      tabItems(
        tabItem(tabName = "item1",
                
                fluidRow(
                  box(plotOutput("histogram")),
                  box(plotOutput("IRIS"))
                )
        ),
        tabItem(tabName = "item2",h1("DASHBOARD1")),
        tabItem(tabName = "item3",h2("DASHBOARD2"))
        
      )
    )
  )
)
server=function(input,output){
  output$histogram=renderPlot({
    hist(faithful$eruption)
  })
  output$IRIS=renderPlot({
    plot(iris$Species,iris$Sepal.Length)
  })
}
shinyApp(ui,server)
