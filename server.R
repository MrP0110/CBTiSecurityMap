library(shiny)
library(leaflet)
library(dplyr)
library(lubridate)

function(input, output) {
  pal <- colorFactor(c("purple", "blue"), domain = c("Femenino", "Masculino"))
  output$mapaChet <- renderLeaflet({ 
    leaflet() %>% 
      addTiles() %>% 
      setView(lng=-88.2826, lat=18.5267, zoom = 13) %>% 
      addMarkers(lng=-88.27573, lat=18.52547, popup="CBTis 214") %>%
      addMarkers(lng=-88.3037, lat=18.5166, popup="Hospital Gral. de Chetumal", icon = makeIcon(iconUrl = "www/shield.png", iconWidth = 15, iconHeight = 15)) %>%
      addMarkers(lng=-88.27788, lat=18.51137, popup="Italian Coffee", icon = makeIcon(iconUrl = "www/shield.png", iconWidth = 15, iconHeight = 15)) %>%
      addMarkers(lng=-88.29060, lat=18.51988, popup="Policia Preventiva Estatal", icon = makeIcon(iconUrl = "www/shield.png", iconWidth = 15, iconHeight = 15)) %>%
      addCircleMarkers(                                                                                                                                              
        data = filter(df, df$genero %in% input$victima & df$fecha_crimen>input$horario & df$crimen %in% input$tipoCrimen),
        ~longitud, ~latitud, stroke=T, radius = 8, 
        color = ~pal(genero),
        popup = ~htmlEscape(paste0(descripcion, " || ", crimen, " || ", genero, " || ", hora_crimen)))
  })
  
  output$myTable <- DT::renderDataTable({df})
}