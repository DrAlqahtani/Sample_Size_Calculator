# Functions for creating fluid page layouts in shiny Application.
# A fluid page layout consists of rows which in turn include columns
################################################################################
ui=fluidPage(
  titlePanel("Sample size calculator by Khaled Alqahtani @alqahtani_khald"),
  fluidRow(
    column(3),
    column(5,
           textInput("Pop", "Population size"),
           selectInput('cl', 'Confidence level', c(99,95,90)),
           textInput('me', 'Margin of Error %'),
           textInput('er', 'Expected response rate %')
           )
    
    ),
  
  fluidRow(
    column(6,offset=5,
           tableOutput("sample_size")))
)