library(faraway)
data(cheddar)
?cheddar
summary(cheddar)
set.seed(12345678);km=kmeans(cheddar,3)
km$size
km$cluster
km$centers
