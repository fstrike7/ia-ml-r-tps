# TP1 - Codigo en R

# Cargar dataset
library(caret)
data(mtcars)

# Ejercicio 2 - Punto 3: dim y summary
print(dim(mtcars))
print(summary(mtcars))

# Ejercicio 2 - Punto 5: Histograma de mpg
hist(mtcars$mpg, main="Faustino", col="steelblue")

# Parte B - Punto 1: Particionado
set.seed(43828173)  # Usando el DNI
particion <- createDataPartition(y = mtcars$mpg, p = 0.70, list = FALSE)
entreno <- mtcars[particion, ]
testeo <- mtcars[-particion, ]

# Parte B - Punto 2: head y summary de ambos conjuntos
print(head(entreno))
print(summary(entreno))

print(head(testeo))
print(summary(testeo))

# Parte B - Punto 3: cantidad de registros en cada conjunto
cat("Registros en entrenamiento:", nrow(entreno), "\n")
cat("Registros en testeo:", nrow(testeo), "\n")
