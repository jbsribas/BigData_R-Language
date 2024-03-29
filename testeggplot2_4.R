#install.packages("ggplot2")
library(ggplot2)
head(mtcars)

#Outra funcionalidade muito importante
#do ggplot � o uso de facets.

ggplot(mtcars, aes(x = mpg, y = disp, colour = as.factor(cyl))) + 
  geom_point() + 
  facet_grid(am~.) 

#Podemos colocar os graficos lado a lado tamb�m:
ggplot(mtcars, aes(x = mpg, y = disp, colour = as.factor(cyl))) +
  geom_point() + 
  facet_grid(.~am)