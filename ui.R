navbarPage(
  #we use the bslib library instead the www path because the headers 
  #appears with errors. but we conserve the css file in www folder.
  theme = bslib::bs_theme(bootswatch = "slate"),
  title = 'Mapa de Seguridad CBTis',
  
  tabPanel('Mapa', 
           fluidPage(
             pageWithSidebar(
               headerPanel('Aplicar filtros'),
               sidebarPanel(width = 4, 
                            selectInput("victima", "Victima:", 
                                        choices = df$genero , 
                                        multiple=TRUE),
                            selectInput("horario", "Horario:",
                                        c("Siempre"=Sys.Date()-1000000000000000,
                                          "Esta semana"=Sys.Date()-7,
                                          "Hace 2 semanas"=Sys.Date()-14,
                                          "Hace 3 semanas"=Sys.Date()-21)),
                            selectInput("tipoCrimen", "Delito:", 
                                        choices = df$crimen, 
                                        multiple = TRUE)),
               mainPanel(
                 column(8, leafletOutput("mapaChet", width = 750, height=400),
                        tags$a(href="https://docs.google.com/forms/d/e/1FAIpQLScBUbBBT_LDyZ4Pwed74T0Zl-EXkGvHt0pah8aBDvQ_RrxLpA/viewform?usp=sf_link", "[Click aqui para reportar un delito]")
                 )
               )
             )
           )
  ),
  tabPanel('Datos', DT::dataTableOutput('myTable'))
)