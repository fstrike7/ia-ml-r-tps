# TP2
# Cargamos el archivo txt en la variable base
base=read.table("seeds_dataset.txt",header=FALSE)
# Validamos la carga
head(base)
# Renombramos las columnas/variables
names(base)[names(base)=="V1"]="Area"
names(base)[names(base)=="V2"]="Perimetro"
names(base)[names(base)=="V3"]="Compactitud"
names(base)[names(base)=="V4"]="Largo"
names(base)[names(base)=="V5"]="Ancho"
names(base)[names(base)=="V6"]="Asimetria"
names(base)[names(base)=="V7"]="Division"
names(base)[names(base)=="V8"]="VariedadDeSemilla"
# Validamos el cambio
head(base)
# Transformar a categórica la variable VariedadDeSemilla y renombre las 
# variedades 1, 2 y 3 como “kama”, “rosa” y “canadian”
base$VariedadDeSemilla = factor(
  base$VariedadDeSemilla, levels = c(1, 2, 3), labels = c(
    "kama", "rosa", "canadian"
  )
)
# Muestre un head(base) para ver cómo quedaron las variables transformadas. 
head(base)
# ¿Cuántas semillas hay en total y por variedad?
dim(base)
summary(base$VariedadDeSemilla)
# Realice un gráfico de sectores de la variable a predecir VariedadDeSemilla. Elija un Título
pie(
  table(base$VariedadDeSemilla),
  main = "Graf. de sectores de la variable a predecir"
)
#  Realice un gráfico de dispersión entre 2 variables (que no sean VariedadDeSemilla) y coloréelo por la variable VariedadDeSemilla (agregue una leyenda que indique cuál es cada grupo).
library(caret)
xyplot(base$Largo ~ base$Ancho, groups = VariedadDeSemilla, base, auto.key = TRUE, main = "Gráfico de Faustino", pch = 20) # nolint: line_length_linter.
# Con la instrucción base[numFila,] se puede obtener los datos de uno de 
# los granos de trigo. Considere los 2 últimos dígitos de su DNI (2numDNI) 
# y muestre aquí el registro correspondiente.
trigo=base[73,]
trigo
# Considere su DNI (completo) para el seteo de semilla y particione la 
# base en un conjunto de entrenamiento y uno de testeo, utilizando la 
# instrucción createDataPartition de la librería caret.
# Además, si su DNI termina en 0, 1, 2 ó 3
# Setee p=0.70
# Si su DNI termina en 4, 5, 6 ó 7
# Setee p=0.75
# Si su DNI termina en 8 ó 9
# Setee p=0.80
DNI <- 12345678
asignado <- 0.8
set.seed(DNI);particion=createDataPartition(y=base$VariedadDeSemilla,p=asignado,list=FALSE)
entreno=base[particion,]
testeo=base[-particion,]
head(entreno)
summary(entreno)
head(testeo)
summary(testeo)
summary(base$VariedadDeSemilla)
summary(entreno$VariedadDeSemilla)
summary(testeo$VariedadDeSemilla)
# Parte D - Arbol de decisión
library(rpart)
arbol=rpart(VariedadDeSemilla~.,entreno)
pred=predict(arbol,testeo,type="class")
confusionMatrix(pred,testeo$VariedadDeSemilla)
trigo = base[73, ]
predict(arbol,trigo,type="class")
trigo$VariedadDeSemilla
library(nnet)
set.seed(DNI);red=nnet(VariedadDeSemilla~.,entreno,size=25,maxit=10000)
red
install.packages("NeuralNetTools")
library(NeuralNetTools)
plotnet(red)

