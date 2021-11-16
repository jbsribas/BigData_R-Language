#install.packages("ggplot2")
library(ggplot2)
head(mtcars)

#eixos funções xlab() ou ylab().

ggplot(mtcars, aes(x = mpg)) + 
  geom_histogram() +
  xlab("Milhas por galão") +
  ylab("Frequência")

#Para alterar os limites dos gráficos 
#usamos as funções xlim() e ylim().

ggplot(mtcars, aes(x = mpg)) + 
  geom_histogram() +
  xlab("Milhas por galão") +
  ylab("Frequência") +
  xlim(c(0, 40)) +
  ylim(c(0,8))

#Legendas
ggplot(mtcars, aes(x = as.factor(cyl), 
                   fill = as.factor(cyl))) + 
                    geom_bar() +
                   labs(fill = "cyl")

#Para trocar a posição da legenda:
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