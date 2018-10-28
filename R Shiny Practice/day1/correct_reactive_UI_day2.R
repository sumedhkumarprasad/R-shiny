library(shiny)
library(dplyr)
library(ggplot2)

bcl <- read.csv('bcl-data.csv', stringsAsFactors = FALSE)
ui <- fluidPage(titlePanel('My First Shiny Dashboard'),
                sidebarLayout(sidebarPanel('This is Sidebar panel',
                                           sliderInput(inputId = 'PricesInput',
                                                       label = 'Price',
                                                       min = 0,
                                                       max = 100,
                                                       value = c(20,40)),
                                           br(),
                                           radioButtons(inputId = 'typeInput',
                                                        label = 'Product Type',
                                                        choices = c('Beer', 'Refreshment', 'SPIRITS', 'WINE'),
                                                        selected = 'WINE'),
                                           br(),
                                           # selectInput(inputId = 'countryInput',
                                           #             label = 'Country',
                                           #             choices = c('CANADA', 'FRANCE', 'ITALY'))
                                           uiOutput('countryOutput')
                ),
                mainPanel('This is Main panel',
                          br(),
                          plotOutput('coolplot'),
                          br(),
                          tableOutput('results')
                )
                )
)
server = function(input,output){
  filtered = reactive({
    bcl %>%
      filter(Price >= input$PricesInput[1],
             Price <= input$PricesInput[2],
             Type == input$typeInput,
             Country == input$countryInput
      )
    
  }
  )
  output$countryOutput = renderUI({
    selectInput(inputId = 'countryInput',
                label = 'Country',
                sort(unique(bcl$Country)),
                selected = 'CANADA')
    
  })
  output$coolplot = renderPlot({
    ggplot(filtered(), aes(Alcohol_Content)) + geom_histogram()
  })
}


shinyApp(ui, server)