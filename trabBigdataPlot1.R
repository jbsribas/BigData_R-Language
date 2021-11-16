library(ggplot2)

agRenda <-ggplot(teste, aes(x =perClasse ,
                            y = perRenda 
                            ,fill = classe
                            ,size = perRenda)) +
  geom_point(shape = 21 ) +
  scale_size("% renda", 
             range = c(0,10),limits= c(0,100)) +
  scale_x_discrete ("% classe",limits= c(0,15,30,40,50,60)) + 
  scale_y_discrete("% renda", 
                   limits = c(0,10,20,30,40,50,60,70,80,90,100)) + 
  theme(legend.box = "horizontal",
        legend.key.size = unit(1, "cm"))


acClass <- ggplot(as.data.frame(teste), aes(x =perClasse ,
                                            y = perRenda 
                                            ,shape = classe
                                            ,colors = classe
                                            , size = perClasse)) +
  geom_point( ) +
  
  
  
  # tamanho dos pontos por renda
  ptRenda1 <-  ggplot(as.data.frame(teste), aes(x =perClasse ,
                                                y = perRenda
                                                ,shape = classe
                                                , colour = classe
                                                , size = perRenda)) +
  geom_point( ) + 
  scale_size("% renda",limits= c(0,100))#, 


# tamanho dos pontos por classe

#ano x percentual classe tamanho acumulo de renda

anoClass<- ggplot(teste, 
                  aes(x = Ano ,
                      y = perClasse
                      ,shape = classe
                      , colour = classe
                      , size = perRenda)) +
  geom_point( ) + 
  scale_size("% renda", range = c(0,10),
             limits= c(0,100)) + 
  scale_y_discrete("% classe", 
                   limits = c(0,10,20,30,40,50,60,70)) +
  scale_x_discrete("ano", 
                   limits = teste$Ano)