library(ggplot2)

# graficos de agrupamentos em grides
fRC <- ggplot(teste, aes(x= perClasse, 
                 y=perRenda
                 , col=classe
                 , shape=classe)) + 
      geom_point(size=4, alpha=0.4) + 
      facet_wrap(~classe) + 
      xlab("% classe") + 
      ylab("% renda") +
      ggtitle("classe x renda - simulador")+
      theme( plot.title = element_text(size = 14, 
                                   face = "bold"),
         axis.title = element_text(size = 12),  
         #legend.title=element_text(size = 12),
         legend.title=element_blank(),
         legend.text = element_text(size=10),
         #legend.direction="horizontal",
         legend.position = "bottom")

fRCI <- ggplot(testeI, aes(x= perClassei , 
                         y=perRendai 
                         , col=classei
                         , shape=classei)) + 
  geom_point(size=4, alpha=0.4) + 
  facet_wrap(~classei) + 
  xlab("% classe") + 
  ylab("% renda") +
  ggtitle("classe x renda - inf")+
  theme( plot.title = element_text(size = 14, 
                                   face = "bold"),
         axis.title = element_text(size = 12),  
         #legend.title=element_text(size = 12),
         legend.title=element_blank(),
         legend.text = element_text(size=10),
         #legend.direction="horizontal",
         legend.position = "bottom")

fRCc <- ggplot(compClass, aes(x= percClasse, 
                           y=percRenda
                           , col= Ano
                           , shape=Classe
                           ,size = percRenda )) + 
  geom_point(alpha=0.4) + 
  facet_wrap(~grupo, ncol= 2) + 
  xlab("% classe") + 
  ylab("% renda") +
  ggtitle("classe x renda x ano - simulador")+
  theme( plot.title = element_text(size = 14, 
                                   face = "bold"),
         axis.title = element_text(size = 12),  
         legend.title=element_text(size = 12),
         #legend.title=element_blank(),
         legend.text = element_text(size=10),
         #legend.direction="horizontal",
         legend.position = "bottom")

fRCc2 <- ggplot(compClass, aes(x= percClasse, 
                              y=percRenda
                              , col= Ano
                              , shape=Classe
                              ,size = percClasse )) + 
  geom_point(alpha=0.4) + 
  facet_wrap(~grupo, ncol= 2) + 
  xlab("% classe") + 
  ylab("% renda") +
  ggtitle("classe x renda x ano  - simulador 2")+
  theme( plot.title = element_text(size = 14, 
                                   face = "bold"),
         axis.title = element_text(size = 12),  
         legend.title=element_text(size = 12),
         #legend.title=element_blank(),
         legend.text = element_text(size=10),
         #legend.direction="horizontal",
         legend.position = "bottom")

fRCie <- ggplot(compClass, aes(x= percClasse, 
                              y=invEdu
                              ,col= Ano
                              ,shape=Classe
                              ,size = invEdu )) + 
  geom_point(alpha=0.4) + 
  facet_wrap(~grupo, ncol= 2) + 
  xlab("% classe") + 
  ylab("% Investimento em Educacao") +
  ggtitle("classe x Investimento em Educacao  x ano - simulador")+
  theme( plot.title = element_text(size = 14, 
                                   face = "bold"),
         axis.title = element_text(size = 12),  
         legend.title=element_text(size = 12),
         #legend.title=element_blank(),
         legend.text = element_text(size=10),
         #legend.direction="horizontal",
         legend.position = "bottom")


#graficos de bolhas
fill = c("steelblue","plum1" ,"yellowgreen", "violetred1", "red","grey")
agRendac <-ggplot(compClass, aes(x =percClasse ,
                            y = percRenda 
                            ,fill = Classe
                            ,size = percRenda)) +
  geom_point(shape = 21) +
  facet_wrap(~grupo, ncol= 2) +
  scale_x_continuous("% classe",breaks = seq(1, 85, 5))+
  scale_y_continuous("% renda",breaks = seq(0, 100, 5))+
  scale_size("% renda", breaks = seq(0, 100, 10))+ 
  scale_fill_manual(values = fill)+
  ggtitle("Renda por classe economica - simulador") +
  theme( plot.title = element_text(size = 14, 
                                   face = "bold"),
         axis.title = element_text(size = 12),  
         legend.title=element_text(size = 12),
         #legend.title=element_blank(),
         legend.text = element_text(size=10),
         #legend.direction="horizontal",
         legend.position = "bottom")

agIEc <-ggplot(compClass, aes(x =percClasse ,
                                 y = invEdu
                                 ,fill = Classe
                                 ,size = invEdu)) +
  geom_point(shape = 23) +
  facet_wrap(~grupo, ncol= 2) +
  scale_x_continuous("% classe",breaks = seq(1, 85, 5))+
  scale_y_continuous("% Investimento educacao",breaks = seq(0, 100, 5))+
  scale_size("% renda", breaks = seq(0, 100, 10))+ 
  scale_fill_manual(values = fill)+
  ggtitle("Investimento em educacao por classe economica - simulador") +
  theme( plot.title = element_text(size = 14, 
                                   face = "bold"),
         axis.title = element_text(size = 12),  
         legend.title=element_text(size = 12),
         #legend.title=element_blank(),
         legend.text = element_text(size=10),
         #legend.direction="horizontal",
         legend.position = "bottom")

agClassc <-ggplot(compClass, aes(x =percClasse ,
                                 y = percRenda 
                                 ,fill = Classe
                                 ,size = percClasse )) +
  geom_point(shape = 21) +
  facet_wrap(~grupo, ncol= 2) +
  scale_x_continuous("% classe",breaks = seq(1, 85, 5))+
  scale_y_continuous("% renda",breaks = seq(0, 100, 5))+
  scale_size("% renda", breaks = seq(0, 100, 10))+ 
  scale_fill_manual(values = fill)+
  ggtitle("Renda por classe economica - simulador") +
  theme( plot.title = element_text(size = 14, 
                                   face = "bold"),
         axis.title = element_text(size = 12),  
         legend.title=element_text(size = 12),
         #legend.title=element_blank(),
         legend.text = element_text(size=10),
         #legend.direction="horizontal",
         legend.position = "bottom")


