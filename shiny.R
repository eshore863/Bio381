# Shiny App
# November 28 2018
# EAS

# Shinyapp is an R package that builds interactive web apps
# ui - stands for user interface: this control/apperance the app
# server - the coding instructions for the shiny app
# control widgets: web elements that users will interact with

library(shiny)

# define ui
#ui <- fluidPage(
#  titlePanel(""),
#  sidebarLayout(
#    sidebarPanel(),
#    mainPanel()))

# Define server
#server <- function(input,output){
#}

# run the app
#shinyApp(ui=ui,server=server)

ui <- fluidPage(
  
  #add a title
  titlePanel("This is a test shiny"),
  
  # create sidebar
  sidebarLayout(position = "right",
                sidebarPanel(
                  # add a header in side panel
                  h1("This is my first header"),
                  h2("This is my second header"),
                  h3("third"),
                  selectInput("x", label = "X", names(trees)),
                  selectInput("Y", label = "Y", names(trees))),
                  mainPanel(
                    #add a header
                    h1("header"),
                    strong("this is important text"),
                    # add a paragraph
                    p("this is a paragraph"),
                    br(),
                    # add an image
                    img(src = "ant.jpg", height = 75, width = 75),
                    plotOutput("TreePlot")
                  )
                )
  )

  
server <- function(input,output){
  
  selectedData <- reactive({
    trees[,c(input$X,input$Y)]
  })
  
  # use render plot to add reactive elements to the plot
  output$TreePlot <- renderPlot({
    # basic plot function that built into r
    plot(selectedData(),
         type = "p",
         
         # change point: pch values stored plot: 21.25 - color and fill points, 19-point
         pch = 21.25,
         col = "black",
         bg = "blue",
         
         # add main title to the graph
         main = "this is the title",
         
         #subtitle
         sub = "This is a place to put a caption")
  }
  )
}

# call to shiny app
shinyApp(ui=ui,server=server)

         
  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  




































