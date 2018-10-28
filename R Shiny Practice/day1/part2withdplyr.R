library(shiny)
library(ggplot2)
library(dplyr)
## load data
bcl = read.csv("bcl-data.csv",stringsAsFactors = FALSE)

ui = fluidPage(
  titlePanel("My First Shiny Page"),#HTML tag is used
  sidebarLayout(
    sidebarPanel("This is a Sidebar Panel",
                 sliderInput(inputId = "priceInput",
                             label = "Price",
                             min = 0,
                             max=100,
                             value =c(60,80)),
                 
                 br(),
                 
                 radioButtons(inputId = "typeInput",
                              label = "Product Type",
                              choices = c("BEER","REFRESHMENT","SPIRITS","WINE"),
                              selected = "WINE"),
                 
                 br(),
                 
                 selectInput(inputId = "CountryInput",
                             label = "Country",
                             choices = c("CANADA","FRANCE","ITALY"))
    ),
    mainPanel("This is Main Panel",
              br(),
              plotOutput("coolplot"),
              br(),
              tableOutput("results"))
  )
)
server=function(input,output){
  output$coolplot=renderPlot({
    filtered = bcl %>%
      filter(Price >= input$priceInput[1],
             Price <= input$priceInput[2],
             Type == input$typeInput,
             Country == input$CountryInput
             )
    ggplot(filtered,aes(Alcohol_Content)) + geom_histogram()
  })
observe({
  print(input$priceInput[1]) 
})
priceDiff = reactive({
  diff(input$priceInput)
})
observe({
  print(priceDiff())
})

}

shinyApp(ui,server)
