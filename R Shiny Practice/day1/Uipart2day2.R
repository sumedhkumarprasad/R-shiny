library(shiny)
library(ggplot2)
library(dplyr)


bcl = read.csv("bcl-data.csv",stringsAsFactors = FALSE)

ui = fluidPage(
  titlePanel("My First Shiny Page"),#HTML tag is used
  sidebarLayout(
    sidebarPanel("This is a Sidebar Panel",
                 sliderInput(inputId = "priceInput",
                             label = "Price",
                             min = 0,
                             max=100,
                             value =c(100,500)),
                 
                 br(),
                 
                 radioButtons(inputId = "typeInput",
                              label = "Product Type",
                              choices = c("BEER","REFRESHMENT","SPIRITS","WINE"),
                              selected = "WINE"),
                 
                 br(),
                 
                 uiOutput("countryOutput")
                 
                 #selectInput(inputId = "CountryInput",
                 #            label = "Country",
                 #           choices = c("CANADA","FRANCE","ITALY"))
    ),
    mainPanel("This is Main Panel",
              br(),
              plotOutput("coolplot"),
              br(),
              tableOutput("results"))
  )
)
server=function(input,output){
  filtered = reactive({
    bcl %>%
      filter(Price >= input$priceInput[1],
             Price <= input$priceInput[2],
             Type == input$typeInput,
             Country == input$countryInput
      )
  })
  
  output$countryOutput=renderUI({
    selectInput(inputId = "country",
                label = "Country",
                sort(unique(bcl$Country)),
                selected = "CANADA")
  })
  
  
  
  
  output$coolplot=renderPlot({
    ggplot(filtered(),aes(Alcohol_Content)) + geom_histogram()
  })
  
  output$results=renderTable({
    filtered()
  })
  
}

shinyApp(ui,server)
