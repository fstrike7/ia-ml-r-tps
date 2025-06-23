# Trabajo Práctico 3 - Inteligencia Artificial y Machine Learning  
## Aprendizaje No Supervisado

**Alumno:** Faustino Beatrice  

---

## Desarrollo

### 1) Descripción de variables del dataset `cheddar`

- `taste`: un puntaje subjetivo del sabor  
- `Acetic`: concentración de ácido acético (escala logarítmica)  
- `H2S`: concentración de sulfuro de hidrógeno (escala logarítmica)  
- `Lactic`: concentración de ácido láctico  

---

### 2) Resumen estadístico de la base

Se muestra un `summary(cheddar)` con estadísticas descriptivas de cada variable.

---

### 3) Agrupamiento K-means

Se utilizó el DNI completo para fijar la semilla y se eligieron 3 grupos (ya que el DNI termina en 3):

```r
set.seed(12345678)
km = kmeans(cheddar, 3)
```

---

### 4) Tamaño de cada grupo

- Grupo 1: 7 elementos

- Grupo 2: 9 elementos

- Grupo 3: 14 elementos

---

### 5) Pertenencia del primer elemento

El primer elemento de la base pertenece al grupo 1.

---

### 6) Centroides de los grupos

Se muestra `km$centers` con los valores promedio de cada variable en cada grupo.

---

### 7) Característica destacada de un grupo

El grupo 2 se destaca por tener el mayor valor promedio de:

- taste: 45,3

- Acetic: 5,89

- H2S: 7,92

- Lactic: 1,72

Esto indica que el grupo 2 contiene los quesos con mejor sabor subjetivo y mayor intensidad química.