# Trabajo Práctico 2 - Aprendizaje Supervizado

**Alumno:** Faustino Beatrice

---

En este ejercicio se pide realizar modelos para predecir variedades de granos de 
trigo. Primero se realiza un Análisis Exploratorio de los Datos para entender la 
base, luego se particiona la base en un conjunto de entrenamiento y uno de 
testeo, después con estos conjuntos se realiza el modelado de un Árbol de 
Decisión y el modelado de una Red Neuronal. Finalmente se compara la 
eficiencia de ambos modelos.

---

## Parte A – Preprocesamiento de los datos

1. **Resumen del dataset**  
   - Measurements of geometrical properties of kernels belonging to three different varieties of wheat. A soft X-ray technique and GRAINS package were used to construct all seven, real-valued attributes.

2. **Variedades de trigo**  
   - Kama, Rosa y Canadian

3. **Carga de datos**  
   Se utilizó `read.table()` para cargar el archivo `seeds_dataset.txt`.

4. **Renombrado de variables**  
   Se renombraron las variables V1 a V8 por nombres representativos como `Area`, `Perimetro`, etc.

5. **Transformación de clase**  
   Se transformó la variable `VariedadDeSemilla` a factor con los niveles `"kama"`, `"rosa"` y `"canadian"`.

---

## Parte B – Análisis Exploratorio de Datos

1. **Cantidad total de semillas y por variedad**  
   - Total: 210 semillas (70 de cada variedad)

2. **Gráfico de sectores**  
   Se generó un gráfico de sectores para visualizar la proporción de variedades.

3. **Gráfico de dispersión**  
   Se realizó un gráfico entre Largo y Ancho, coloreado por la variedad.

4. **Registro según DNI**  
   Con los últimos dos dígitos del DNI (73), se identificó que la semilla correspondiente es de tipo **rosa**.

---

## Parte C – Conjuntos

1. **Partición de datos**  
   Usando `createDataPartition` con `set.seed(43828173)` se dividió en:
   - 70% entrenamiento (`entreno`)
   - 30% testeo (`testeo`)

2. **Resumen y head de ambos conjuntos**  
   Se imprimieron estadísticas básicas y las primeras filas.

3. **Distribución por variedad**  
   - Entreno: 49 registros por clase  
   - Testeo: 21 registros por clase

---

## Parte D – Árbol de Decisión

1. **Modelo con `rpart`**  
   Se entrenó un árbol con fórmula `VariedadDeSemilla ~ .`.

2. **Visualización**  
   Se graficó el árbol con `rpart.plot`.

3. **Cantidad de hojas**  
   - El árbol tiene 4 hojas.

4. **Regla para clase "rosa"**  
   - Una semilla es "rosa" si el atributo `Division >= 5.6`.

5. **Matriz de confusión**  
   Se calculó usando `confusionMatrix`. Resultado:
   18 + 21 + 17 = 56 aciertos
    Total en testeo: 63
    Accuracy: 56 / 63 ≈ 0.8888


6. **Clase con menor sensibilidad**  
- `canadian`

7. **Predicción sobre el grano 73 (DNI)**  
- Predicho: rosa  
- Real: rosa  
- **Coincide.**

---

## Parte E – Red Neuronal

1. **Modelo con `nnet`**  
- Fórmula: `VariedadDeSemilla ~ .`  
- `size=25`, `maxit=10000`, `set.seed(43828173)`

2. **Cantidad de pesos e iteraciones**  
- Pesos: 278  
- Iteraciones: 90

3. **Visualización**  
Se utilizó `plotnet()` de `NeuralNetTools`.

4. **Accuracy**  
- `0.9365`

5. **Predicción sobre el grano 73 (DNI)**  
- Predicho: rosa  
- Real: rosa  
- **Coincide.**

---

## Parte F – Comparación de Modelos

| Modelo             | Accuracy | Sensibilidad (kama) | Sensibilidad (rosa) | Sensibilidad (canadian) | Especificidad (kama) | Especificidad (rosa) | Especificidad (canadian) |
|--------------------|----------|----------------------|----------------------|--------------------------|-----------------------|-----------------------|----------------------------|
| Árbol de Decisión  | 0.8888   | 0.86                 | 1.00                 | 0.81                     | 0.97                  | 1.00                  | 0.92                       |
| Red Neuronal       | 0.9365   | 0.93                 | 1.00                 | 0.89                     | 0.98                  | 1.00                  | 0.95                       |

> El modelo de red neuronal tuvo un mejor accuracy y mejores valores en sensibilidad y especificidad comparado al modelo de árbol de decisión.

---

