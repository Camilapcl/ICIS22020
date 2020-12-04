# configurando espacio de trabajo
setwd("~/Documentos/UTEM/ICIS22020")

# borrando variables de entorno
rm(list = ls())

# instalando librerias
#install.packages('rvest')
#install.packages('gdata')

# importando librerias
library('rvest')
library('gdata')

# lectura inicial de la pagina
pagina <- read_html('pagina.html')

# comprobando la lectura de la pagina
textoHtml <- html_text(pagina)
print(textoHtml)

# buscando elemento atravez del xpath
tituloh4 <- html_nodes(pagina, xpath = "/html/body/div/div[4]/h4")
tituloh4text <- html_text(tituloh4)
print(tituloh4text)

# buscando elemento atravez de css (manera larga)
tituloh3 <- html_nodes(pagina, css = '.textojustify')
tituloh3 <- html_nodes(pagina, css = 'h3')
tituloh3text <- html_text(tituloh3)
print(tituloh3text)

# buscando elemento atravez de css (manera corta)
tituloh3 <- html_nodes(pagina, css = '.textojustify > h3')
tituloh3text <- html_text(tituloh3)
print(tituloh3text)


## Ejemplo
# Una de las cosas mas dificiles desacar
contenidoDivFondoBlanco <- html_nodes(pagina, css = ".fondoblanco")
primerDiv <- contenidoDivFondoBlanco[[1]]
textoDelDiv <- html_text(primerDiv)
print(textoDelDiv)

tituloElArbol <- html_nodes(primerDiv, css = "h1")
textoElArbol <- html_text(tituloElArbol)
print(textoElArbol)

# limpiando
textoConGsub <- gsub("\n","",textoDelDiv)
textoConGsub <- gsub(textoElArbol,"",textoConGsub)
textoConGsub <- trim(textoConGsub)
print(textoConGsub)


## Sacando informacion de una tabla
tablaArboles <- html_table(pagina)[[1]]

## Sacar la referencia de un link
linkEnLaPagina <- html_nodes(pagina, xpath = '/html/body/div/div[3]/a')
print(html_text(linkEnLaPagina))
refDelLink <- html_attr(linkEnLaPagina,"href")
print(refDelLink)

paginaReferencia <- read_html(refDelLink)
