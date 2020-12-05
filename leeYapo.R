rm(list = ls())

########## lee yapo.cl
library('rvest')
library('gdata')

paginayapo <- read_html("https://www.yapo.cl/region_metropolitana")
contenedoranuncios <- html_nodes(paginayapo,css = '#hl')

# titulos de los anuncios
titulos <- html_nodes(contenedoranuncios, css = ".title")
textoTitulos <- html_text(titulos)

for (i in 1:length(textoTitulos)) {
  print(textoTitulos[i])
}

# categorias
categorias <- html_nodes(contenedoranuncios, css = ".category")
textoCategorias <- html_text(categorias)

for (i in 1:length(textoCategorias)) {
  print(textoCategorias[i])
}

table(textoCategorias)

# comuna
comunas <- html_nodes(contenedoranuncios, css = ".commune")
textoComunas <- html_text(comunas)

for (i in 1:length(textoComunas)) {
  print(textoComunas[i])
}

table(textoComunas)

# Precio
ads <- html_nodes(contenedoranuncios, css = ".ad")

# [almacen dato parte 1] se crea el data frame 
# vacio que almacenara toda la informacion 
todosLosProductos <- data.frame()

for (ad in ads) {
  print('================== ITEM ==================')
  
  # obteniendo el titulo
  titulo <- html_nodes(ad, css = '.title')
  textoTitulo <- html_text(titulo)
  print(textoTitulo)
  
  # obteniendo la categoria
  categoria <- html_nodes(ad, css = '.category')
  textoCategoria <- html_text(categoria)
  print(textoCategoria)
  
  # obteniendo la comuna
  comuna <- html_nodes(ad,css = '.commune')
  textoComuna <- html_text(comuna)
  print(textoComuna)
  
  # obteniendo el precio
  precio <- html_nodes(ad, css = '.price')
  textoPrecio <- html_text(precio)
  if(length(textoPrecio) == 0){
    textoPrecio <- NA
  }else{
    textoPrecio <- gsub("\n","",textoPrecio)
    textoPrecio <- gsub("\t","",textoPrecio)
    textoPrecio <- gsub("[$]","",textoPrecio)
    textoPrecio <- gsub("[.]","",textoPrecio)
    textoPrecio <- trim(textoPrecio)
    textoPrecio <- as.numeric(textoPrecio)
  }
  print(textoPrecio)
  
  # [almacen dato parte 2] se crea un dataframe por producto
  # con su detalle
  producto <- data.frame(titulo = textoTitulo, categoria = textoCategoria, comuna = textoComuna, precio = textoPrecio)
  
  # [almacen dato parte 3] se agrega el dataframe producto al 
  # dataframe que contiene toda la informacion
  todosLosProductos <- rbind(todosLosProductos,producto)
}
