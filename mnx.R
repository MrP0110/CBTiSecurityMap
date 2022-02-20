library(shiny)
library(leaflet)
library(dplyr)
library(lubridate)
library(htmltools)
library(bslib)
library(ggplot2)

#all packages are declare here

datos <- read.csv("Reporte_de_crimen.csv", encoding = "UTF-8")
df<-rename(datos, fecha_reporte=Marca.temporal
           , fecha_crimen=X.Cuándo.sucedió.
           , hora_crimen=X.A.qué.hora.sucedió...24.00.hrs.
           , genero=X.Cuál.es.tu.género.
           , semestre=X.De.qué.semestre.eres.
           , carrera=X.Cuál.es.tu.carrera.
           , descripcion=Breve.descripción.del.agresor
           , crimen=Tipo.de.crimen
           , longitud=Longitud..Ej...88.3011.
           , latitud=Latitud..Ej..18.5144.)
df$fecha_crimen<-strptime(as.character(df$fecha_crimen), "%d/%m/%Y")
df$fecha_crimen<-strftime(df$fecha_crimen)
runApp()