# app.R
library(shiny)

x <- predictions
y <- y

# Define UI
ui <- fluidPage(
  titlePanel("Actual vs. Predicted Scatter Plot"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("input_actual", "Input Actual Value", min = min(y), max = max(y), value = mean(y), step = 0.1)
    ),
    mainPanel(
      plotOutput("scatter_plot")
    )
  )
)

# Define Server
server <- function(input, output) {
  output$scatter_plot <- renderPlot({
    plot(x, y, main = "Actual vs. Predicted", xlab = "Predicted", ylab = "Actual", pch = 16, col = "blue")
    abline(h = input$input_actual, col = "red", lty = 2)
  })
}

# Run the app
shinyApp(ui = ui, server = server)
