#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Local Authority Mapping Tool"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      # Input: Select a file ----
      fileInput("file1", "Choose CSV File",
                multiple = TRUE,
                accept = c("text/csv",
                           "text/comma-separated-values,text/plain",
                           ".csv")),
      
      selectizeInput(
        "la_code_input",
        label = "Select LA Code field from dataset",
        choices = NULL
        ),
      
      selectizeInput(
        "plot_var_input",
        label = "Select plot variable",
        choices = NULL
      ),
      actionButton('generate_map', 'Generate Map')
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      
      tabsetPanel(
        tabPanel("Data", tableOutput("contents")),
        tabPanel("Map", plotOutput("map"))
        
      )
      
    )
  )
))
