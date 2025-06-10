# Trabajo Práctico 1 - Análisis Exploratorio de Datos

**Alumno:** Faustino Beatrice

---

## Ejercicio 1 – Parte teórica

**¿Por qué es importante testear en un modelo de Machine Learning?**
Hay que garantizar que el modelo funcione bien con datos nuevos, testearlo me permite saber si realmente aprendió patrones o solo memorizó ejemplos.
Además es fundamental tomar decisiones basadas en evidencia, en casos extremos (como evaluar si un paciente tiene cáncer o no) no se puede confiar solo porque "parece funcionar", las decisiones/resultados se deben respaldar con tests.
Por último, probar y comparar entre distintos modelos con tests nos permite decidir cuál es mejor y por qué.

---

## Ejercicio 2 – Regresión

### 1. Dataset y fuente

El dataset usado es `mtcars` y proviene de la librería base de R.

### 2. Variable a predecir

La variable a predecir es `mpg` (millas por galón) y trata de predecir el consumo de combustible de diferentes modelos de autos en base a otras características técnicas como el peso (`wt`), la potencia (`hp`), el número de cilindros (`cyl`), etc.

### 3. `dim` y `summary` del dataset

```r
> dim(mtcars)
[1] 32 11

> summary(mtcars)
```

(Se muestra el resumen de las variables del dataset)

### 4. Registros, variables y tipos

La base tiene 32 registros, 11 variables, y todas las variables son de tipo numérico.

### 5. Histograma de la variable a predecir

```r
> hist(mtcars$mpg, main="Faustino", col="steelblue")
```

Los valores se encuentran en un rango de 10 a 35.

---

## Parte B - Conjuntos

### 1. Particionado del dataset con `caret`

Seteando la semilla con el DNI:

```r
library(caret)
set.seed(12345678)
particion <- createDataPartition(y = mtcars$mpg, p = 0.70, list = FALSE)
entreno <- mtcars[particion, ]
testeo <- mtcars[-particion, ]
```

### 2. `head` y `summary` de cada conjunto

```r
> head(entreno)
> summary(entreno)

> head(testeo)
> summary(testeo)
```

### 3. Cantidad de registros en cada conjunto

En el conjunto de entrenamiento quedaron 24 registros y en el conjunto de testeo 8 registros. En total, 32 registros.

---

**Fin del TP1**
