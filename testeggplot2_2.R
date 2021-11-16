#install.packages("ggplot2")
library(ggplot2)


head(mtcars)

# GEOMS definem qual forma geometrica sera utilizada 
#para a visualiza??o dos dados 

#geom_boxplot: para boxplots
ggplot(mtcars, aes(x = as.factor(cyl), y = mpg)) + 
  geom_boxplot()



#geom_histogram: para histogramas
ggplot(mtcars, aes(x = mpg)) +  geom_histogram()

#geom_bar: para barras
ggplot(mtcars, aes(x = as.factor(cyl))) +   geom_bar()


#cores personalizadas 
ggplot(mtcars, aes(x = as.factor(cyl), 
                   y = mpg, colour = as.factor(cyl))) + 
                   geom_boxplot()

#mudar o preenchimento  => fill mapeando variavel de interesse
ggplot(mtcars, aes(x = as.factor(cyl), 
                   y = mpg, fill = as.factor(cyl))) +
                   geom_boxplot()

# fill sem mapear variavel de interesse
ggplot(mtcars, aes(x = as.factor(cyl), y = mpg)) + 
  geom_boxplot(color = "red", fill = "pink")

