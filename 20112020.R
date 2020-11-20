
# creamos vector de elementos logico
vec <- c(T,F,F,F,T)
print(vec)
print(vec[1])
typeof(vec[1])
print(length(vec))

# agrega un elemento de numero entero al vecto
vec <- c(vec,1)
print(vec)
print(vec[1])
typeof(vec[1])
print(length(vec))

# agrega un elemento de numero decimal al vecto
vec <- c(vec,0.3)
print(vec)
print(vec[1])
typeof(vec[1])
print(length(vec))

# agrega un elemento de texto al vecto
vec <- c(vec,"sol")
print(vec)
print(vec[1])
typeof(vec[1])
print(length(vec))

vec[1]

vec[8]

i <- length(vec)
i


vec[i]
vec <- c(vec,"luna")
i <- length(vec)
print(i)
vec[i]


promedio <- 6

vec[5] <- "arbol"

tmp <- vec[8]
vec[8] <- vec[5]
vec[5] <- tmp
vec


darvuelta <- function(a,b){
  return(c(b,a))
}

b <- darvuelta(vec[8],vec[5])
vec[8] <- b[1]
vec[5] <- b[2]
vec

a <- vec[8]
b <- vec[5]
vec[8] <- b
vec[5] <- a
vec

vec <- vec[-4]
vec
length(vec)

5:10

contadorDeCeros <- 0
ContadorDeSoles <- 0
for ( i in 1:length(vec) ) {
  print(vec[i])
  if(vec[i]=="0"){
    contadorDeCeros <- contadorDeCeros + 1
  }
  if(vec[i]=="sol"){
    contadorDeSoles <- contadorDeSoles + 1
  }
}

contadorDeCeros
contadorDeSoles


vec <- c(2,365,65,7,3423,4,235234,623,64,6,89,9,67,65,2345,3,464,35,56,85,78,46,32,45,237,35)
for(j in 1:length(vec)){
  for( i in 1:(length(vec)-1)){
    print(paste("%%%%%%%%%%%% vuelta Nro",i,"%%%%%%%%%%%%"))
    print(paste("posicion",i,"el valor de vec[i] es",vec[i]))
    print(paste("posicion",i+1,"el valor de vec[i+1] es",vec[i+1]))
    if(vec[i]<vec[i+1]){
      tmp <- vec[i]
      vec[i] <- vec[i+1]
      vec[i+1] <- tmp
    }
    print(paste("------------ despues de la transformacion -------------"))
    print(paste("posicion",i,"el valor de vec[i] es",vec[i]))
    print(paste("posicion",i+1,"el valor de vec[i+1] es",vec[i+1]))
  }
}

vec







