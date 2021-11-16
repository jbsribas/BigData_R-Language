#install.packages("ggplot2")
library(ggplot2)



#exemplos: http://curso-r.github.io/posts/aula05.html   
head(mtcars)
ggplot(data = mtcars, aes(x = disp, y = mpg)) + 
  geom_point()


#variavel am como diferencial cor
ggplot(data = mtcars, aes(x = disp, y = mpg, colour = as.factor(am))) + 
  geom_point()


#escala de cor em azul cyl
ggplot(mtcars, aes(x = disp, y = mpg, colour = cyl)) + 
  geom_point()


# tamanho dos pontos por uma variavel de interesse
ggplot(mtcars, aes(x = disp, y = mpg, colour = cyl, size = wt)) +
  geom_point()