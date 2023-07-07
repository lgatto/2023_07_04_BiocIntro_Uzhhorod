## Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  ## Application title
  titlePanel("My Shiny App"),
  
  ## Sidebar with text, slide bar and menu selection inputs
  sidebarLayout(
    sidebarPanel(
      textInput("textInput", "Enter text here:"),
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30),
      selectInput("col", "Select a colour:",
                  choices = c("steelblue", "darkgray", "orange"))
    ),
    
    ## Main panel showing user-entered text, a reactive plot and a
    ## dynamic table
    mainPanel(
      textOutput("textOutput"),
      plotOutput("distPlot"),
      dataTableOutput("dataTable")
    )
  )
))