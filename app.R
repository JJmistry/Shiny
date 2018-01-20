
library(shiny)
library(ggplot2)

# Define UI 
ui <- fluidPage(
     # Application title
   titlePanel(h1("Practicing Shiny with the mtcars dataset and ggplot2", windowTitle = "Shiny demo")),
  
   # Sidebar with inputs 
      sidebarPanel(h2("Inputs"),
                                    selectInput(inputId = "X",
                               label = "X - axis", 
                               choices = c("Miles per gallon" ="mpg",
                                           "Number of cylinders" = "cyl",
                                           "Displacement (cu.in.)" = "disp",
                                           "Gross horsepower" ="hp",
                                           "Rear axle ratio" = "drat",
                                           "Weight (1000 lbs)" = "wt",
                                           "1/4 mile time" = "qsec",
                                           "V/S" = "vs",
                                           "Number of forward gears" = "gear",
                                           "Number of carburetors" ="carb"),
                               selected = "cyl"),
                    
                    selectInput(inputId = "Y",
                                label = "Y - axis",
                                choices = c("Miles per gallon" ="mpg",
                                            "Number of cylinders" = "cyl",
                                            "Displacement (cu.in.)" = "disp",
                                            "Gross horsepower" ="hp",
                                            "Rear axle ratio" = "drat",
                                            "Weight (1000 lbs)" = "wt",
                                            "1/4 mile time" = "qsec",
                                            "V/S" = "vs",
                                            "Number of forward gears" = "gear",
                                            "Number of carburetors" ="carb", 
                                selected = "disp")
      ),
      sliderInput(inputId = "alpha", 
                  label = "Alpha:", 
                  min = 0, max = 1, 
                  value = 0.5),
      
      # Set point size
      sliderInput(inputId = "size", 
                  label = "Size:", 
                  min = 0, max = 5, 
                  value = 2)
      ),
      
      # Main panel, title, scatter graph and text merged.
        mainPanel(
          h2(" Scatterplot"),
                br(),
         plotOutput(outputId = "Plot"),
     
          # Text output of variables included
        textOutput(outputId = "text")
      )
)

# Define server logic required to draw plot
server <- function(input, output) {

   output$Plot <- renderPlot({
      # generate plot
           ggplot(data =mtcars,
                  aes_string(x = input$X, y = input$Y)) + 
                  geom_point(alpha = input$alpha, size = input$size)
                    })
   
  output$text <-renderText({
    paste("This scatterplot shows the relationship between",input$X, "and", input$Y)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

