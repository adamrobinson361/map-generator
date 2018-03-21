#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(readr)

source("R/data_loading.R")
source("R/map.R")

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
   
  df <- reactive({
    
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, head of that data file by default,
    # or all rows if selected, will be shown.
    
    req(input$file1)
    
    read_csv(input$file1$datapath)
    
  })

  output$contents <- renderTable({
    
    req(input$file1)
    
    df()
  })
  
  observeEvent(input$generate_map, {
    
    req(input$la_code_input)
    
    req(input$plot_var_input)
    
    output$map <- renderPlot({
      
      lad_map(df(), input$la_code_input, input$plot_var_input)
      
    })
    
  })
  
  observe({
      updateSelectizeInput(
        session = session, 
        inputId = 'la_code_input',
        choices = colnames(df()),
        server = TRUE)
  })

  observe({
    updateSelectizeInput(
      session = session, 
      inputId = 'plot_var_input',
      choices = colnames(df()),
      server = TRUE)
  })
  
  
})
