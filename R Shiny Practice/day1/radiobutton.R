library(shiny)
ui = fluidPage(
  h1("My First Shiny Page"),#HTML tag is used
  br(), #HTML tag is used
  strong("Prices") # HTML tag
)
server=function(input,output){}
shinyApp(ui,server)
library(shiny)
ui = fluidPage(
  titlePanel("My First Shiny Page")#HTML tag is used
 
)
server=function(input,output){}
shinyApp(ui,server)

ui = fluidPage(
  titlePanel("My First Shiny Page"),#HTML tag is used
  sidebarLayout(
    sidebarPanel("This is a Sidebar Panel"),
     mainPanel("This is Main Panel")
  )
)
server=function(input,output){}
shinyApp(ui,server)


## Sidebar panel part 2 adding shiny widgets


ui = fluidPage(
  titlePanel("My First Shiny Page"),#HTML tag is used
  sidebarLayout(
    sidebarPanel("This is a Sidebar Panel",
                 sliderInput(inputId = "priceInput",
                             label = "Price",
                             min = 0,
                             max=100,
                             value =20),
                 br(),
                 radioButtons(inputId = "typeInput",
                              label = "Product Type",
                              choices = c("BEER","REFRESHMENT","SPIRITS","WINE"),
                              selected = "WINE")
                ),
    mainPanel("This is Main Panel")
  )
)
server=function(input,output){}
shinyApp(ui,server)

## Part 3 radioButton

ui = fluidPage(
  titlePanel("My First Shiny Page"),#HTML tag is used
  sidebarLayout(
    sidebarPanel("This is a Sidebar Panel",
                 sliderInput(inputId = "priceInput",
                             label = "Price",
                             min = 0,
                             max=100,
                             value =20),
                 br(),
                 radioButtons(inputId = "typeInput",
                              label = "Product Type",
                              choices = c("BEER","REFRESHMENT","SPIRITS","WINE"),
                              selected = "WINE")
    ),
    mainPanel("This is Main Panel")
  )
)
server=function(input,output){}
shinyApp(ui,server)

###########################
###########################

## Part 4 

ui = fluidPage(
  titlePanel("My First Shiny Page"),#HTML tag is used
  sidebarLayout(
    sidebarPanel("This is a Sidebar Panel",
                 sliderInput(inputId = "priceInput",
                             label = "Price",
                             min = 0,
                             max=100,
                             value =20),
                 br(),
                 radioButtons(inputId = "typeInput",
                              label = "Product Type",
                              choices = c("BEER","REFRESHMENT","SPIRITS","WINE"),
                              selected = "WINE")
    ),
    mainPanel("This is Main Panel")
  )
)
server=function(input,output){}
shinyApp(ui,server)

#############
# Part- 5 selectInput()

ui = fluidPage(
  titlePanel("My First Shiny Page"),#HTML tag is used
  sidebarLayout(
    sidebarPanel("This is a Sidebar Panel",
                 sliderInput(inputId = "priceInput",
                             label = "Price",
                             min = 0,
                             max=100,
                             value =20),
                 
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
    mainPanel("This is Main Panel")
  )
)
server=function(input,output){}
shinyApp(ui,server)

#############
# Part 6 Main Panel
ui = fluidPage(
  titlePanel("My First Shiny Page"),#HTML tag is used
  sidebarLayout(
    sidebarPanel("This is a Sidebar Panel",
                 sliderInput(inputId = "priceInput",
                             label = "Price",
                             min = 0,
                             max=100,
                             value =20),
                 
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
server=function(input,output){}
shinyApp(ui,server)

#### Server part programming
ui = fluidPage(
  titlePanel("My First Shiny Page"),#HTML tag is used
  sidebarLayout(
    sidebarPanel("This is a Sidebar Panel",
                 sliderInput(inputId = "priceInput",
                             label = "Price",
                             min = 0,
                             max=100,
                             value =20),
                 
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
  output$coolplot=renderPlot(
    plot(rnorm(100)) # random number 1 to 100
  )
}
shinyApp(ui,server)

######## taken input from slider bar in server side programming
ui = fluidPage(
  titlePanel("My First Shiny Page"),#HTML tag is used
  sidebarLayout(
    sidebarPanel("This is a Sidebar Panel",
                 sliderInput(inputId = "priceInput",
                             label = "Price",
                             min = 0,
                             max=100,
                             value =20),
                 
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
  output$coolplot=renderPlot(
    plot(rnorm(input$priceInput)) # random number 1 to 100
  )
}
shinyApp(ui,server)

######
library(shiny)
library(ggplot2)
library(dplyr)
ui = fluidPage(
  titlePanel("My First Shiny Page"),#HTML tag is used
  sidebarLayout(
    sidebarPanel("This is a Sidebar Panel",
                 sliderInput(inputId = "priceInput",
                             label = "Price",
                             min = 0,
                             max=100,
                             value =20),
                 
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
  output$coolplot=renderPlot(
    plot(rnorm(input$priceInput)) # random number 1 to 100
  )
}
shinyApp(ui,server)
