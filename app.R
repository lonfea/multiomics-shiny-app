# app.R
library(shiny)
library(DT)
library(ComplexHeatmap)
library(ggplot2)
library(plotly)
library(tidyverse)

ui <- fluidPage(
  titlePanel("Multi-Omics Data Explorer"),
  sidebarLayout(
    sidebarPanel(
      fileInput("omicsfile", "Upload Omics Data (CSV)", accept = ".csv"),
      selectInput("norm_method", "Normalization Method", choices = c("None", "Z-score", "Min-Max")),
      actionButton("run_analysis", "Run Analysis"),
      hr(),
      downloadButton("download_norm", "Download Normalized Data")
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Data Preview", DTOutput("data_preview")),
        tabPanel("PCA Plot", plotlyOutput("pca_plot")),
        tabPanel("Heatmap", plotOutput("heatmap", height = "600px"))
      )
    )
  )
)

server <- function(input, output, session) {
  # Reactive: Load data
  omics_data <- reactive({
    req(input$omicsfile)
    df <- read.csv(input$omicsfile$datapath, row.names = 1, check.names = FALSE)
    df
  })
  
  # Reactive: Normalized data
  norm_data <- eventReactive(input$run_analysis, {
    df <- omics_data()
    if (input$norm_method == "Z-score") {
      df <- scale(df)
    } else if (input$norm_method == "Min-Max") {
      df <- apply(df, 2, function(x) (x - min(x)) / (max(x) - min(x)))
    }
    as.data.frame(df)
  })
  
  # Data preview
  output$data_preview <- renderDT({
    req(omics_data())
    datatable(head(omics_data(), 10), options = list(pageLength = 5))
  })
  
  # PCA plot
  output$pca_plot <- renderPlotly({
    req(norm_data())
    df <- norm_data()
    pca <- prcomp(df, center = TRUE, scale. = FALSE)
    pca_df <- as.data.frame(pca$x)
    p <- ggplot(pca_df, aes(x = PC1, y = PC2)) +
      geom_point(size = 3, color = "blue") +
      labs(title = "PCA: PC1 vs PC2")
    ggplotly(p)
  })
  
  # Heatmap
  output$heatmap <- renderPlot({
    req(norm_data())
    Heatmap(as.matrix(norm_data()), name = "Normalized", show_row_names = FALSE, show_column_names = TRUE)
  })
  
  # Download normalized data
  output$download_norm <- downloadHandler(
    filename = function() { "normalized_omics_data.csv" },
    content = function(file) {
      write.csv(norm_data(), file)
    }
  )
}

shinyApp(ui, server)
