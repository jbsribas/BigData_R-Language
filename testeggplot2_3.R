#install.packages("ggplot2")
library(ggplot2)
head(mtcars)

#eixos fun��es xlab() ou ylab().

ggplot(mtcars, aes(x = mpg)) + 
  geom_histogram() +
  xlab("Milhas por gal�o") +
  ylab("Frequ�ncia")

#Para alterar os limites dos gr�ficos 
#usamos as fun��es xlim() e ylim().

ggplot(mtcars, aes(x = mpg)) + 
  geom_histogram() +
  xlab("Milhas por gal�o") +
  ylab("Frequ�ncia") +
  xlim(c(0, 40)) +
  ylim(c(0,8))

#Legendas
ggplot(mtcars, aes(x = as.factor(cyl), 
                   fill = as.factor(cyl))) + 
                    geom_bar() +
                   labs(fill = "cyl")

#Para trocar a posi��o da legenda:
ggplot(mtcars, aes(x = as.factor(cyl), 
                   fill = as.factor(cyl))) + 
                   geom_bar() +
                   labs(fill = "cyl") +
                   theme(legend.position="top")

#Para retirar a legenda:
ggplot(mtcars, aes(x = as.factor(cyl), 
                   fill = as.factor(cyl))) + 
                   geom_bar() +
                   guides(fill=FALSE)