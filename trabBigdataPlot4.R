library(ggplot2)

#grafico de linhas para as classes
class <- ggplot(teste, 
                aes(Ano, perClasse
                    ,color = classe
                    ,shape = classe
                    ,group=classe))+
  geom_point() + geom_line(aes(linetype=classe))+
  xlab("Ano") + 
  ylab("% classe") +
  ggtitle("Evolucacao classe economica simulador")+
  theme( plot.title = element_text(size = 14, 
                                   face = "bold"),
         axis.title = element_text(size = 12),  
         #legend.title=element_text(size = 12),
         legend.title=element_blank(),
         legend.text = element_text(size=10),
         #legend.direction="horizontal",
         legend.position = "bottom")

classI <- ggplot(testeI, 
                 aes(Ano, perClassei 
                     ,color = classei
                     ,shape = classei
                     ,group=classei))+
  geom_point() + geom_line(aes(linetype=classei))+
  xlab("Ano") + 
  ylab("% classe") +
  ggtitle("Evolucao classe economica considerando inflacao - simulador")+
  theme( plot.title = element_text(size = 14, 
                                   face = "bold"),
         axis.title = element_text(size = 12),  
         #legend.title=element_text(size = 12),
         legend.title=element_blank(),
         legend.text = element_text(size=10),
         #legend.direction="horizontal",
         legend.position = "bottom")

classOf <- ggplot(clEconomicaComp3, 
                 aes(Ano, perClasse 
                     ,color =  Classe
                     ,shape =  Classe
                     ,group= Classe))+
  geom_point() + geom_line(aes(linetype= Classe))+
  xlab("Ano") + 
  ylab("% classe") +
  ggtitle("Evolucao classe economica oficial")+
  theme( plot.title = element_text(size = 14, 
                                   face = "bold"),
         axis.title = element_text(size = 12),  
         #legend.title=element_text(size = 12),
         legend.title=element_blank(),
         legend.text = element_text(size=10),
         #legend.direction="horizontal",
         legend.position = "bottom")


classc <- ggplot(compClass, 
                 aes(Ano, percClasse
                     ,color = Classe
                     ,shape = Classe
                     ,group= Classe))+
  geom_point() + geom_line(aes(linetype= Classe))+
  xlab("Ano") + 
  ylab("% classe") +
  ggtitle("Evolucao classe economica simulador - geral")+
  theme( plot.title = element_text(size = 14, 
                                   face = "bold"),
         axis.title = element_text(size = 12),  
         #legend.title=element_text(size = 12),
         legend.title=element_blank(),
         legend.text = element_text(size=10),
         #legend.direction="horizontal",
         legend.position = "bottom")

classc2 <- ggplot(compClass, 
                 aes(Ano, percClasse
                     ,color = Classe
                     ,shape = classe
                     ,group= Classe))+
  geom_point() + geom_line(aes(linetype= Classe))+
  facet_wrap(~ grupo)+
  xlab("Ano") + 
  ylab("% classe") +
  ggtitle("Evolucao classe economica simulador - geral")+
  theme( plot.title = element_text(size = 14, 
                                   face = "bold"),
         axis.title = element_text(size = 12),  
         #legend.title=element_text(size = 12),
         legend.title=element_blank(),
         legend.text = element_text(size=10),
         #legend.direction="horizontal",
         legend.position = "bottom")

classCo <- ggplot(clEconomicaComp, 
                  aes(x= Ano, y=perClasse
                      ,color = Classe
                      ,shape =grupo
                      ,group= Classe
                      ))+
  geom_point() + geom_line(aes(linetype= Classe))+ 
  #facet_wrap(~ grupo)+
  xlab("Ano") + 
  ylab("% classe") +
  ggtitle("Evolução das classes econômica - simulador x oficial")+
  theme( plot.title = element_text(size = 14, 
                                   face = "bold"),
         axis.title = element_text(size = 12),  
         legend.title=element_text(size = 12),
         #legend.title=element_blank(),
         legend.text = element_text(size=10),
         #legend.direction="horizontal",
         legend.position = "bottom")

#com inflacao em faces
classCo2 <- ggplot(clEconomicaComp, 
                   aes(x= Ano, y=perClasse
                       ,color = Classe
                       ,shape =Classe
                       ,group= Classe
                   ))+
  geom_point() + geom_line(aes(linetype= Classe))+ 
  facet_wrap(~ grupo)+
  xlab("Ano") + 
  ylab("% classe") +
  ggtitle("Evolução das classes econômica - simulador x oficial")+
  theme( plot.title = element_text(size = 14, 
                                   face = "bold"),
         axis.title = element_text(size = 12),  
         #legend.title=element_text(size = 12),
         legend.title=element_blank(),
         legend.text = element_text(size=10),
         #legend.direction="horizontal",
         legend.position = "bottom")


#sem inflacao
classCo3 <- ggplot(clEconomicaComp2, 
                  aes(x= Ano, y=perClasse
                      ,color = Classe
                      ,shape = Classe
                      ,group= Classe
                  ))+
  geom_point() + geom_line(aes(linetype= Classe))+ 
  #facet_wrap(~ grupo)+
  xlab("Ano") + 
  ylab("% classe") +
  ggtitle("Evolução das classes econômica - simulador x oficial ")+
  theme( plot.title = element_text(size = 14, 
                                   face = "bold"),
         axis.title = element_text(size = 12),  
         #legend.title=element_text(size = 12),
         legend.title=element_blank(),
         legend.text = element_text(size=10),
         #legend.direction="horizontal",
         legend.position = "bottom")

#sem inflacao com faces
classCo4 <- ggplot(clEconomicaComp2, 
                   aes(x= Ano, y=perClasse
                       ,color = Classe
                       ,shape = Classe
                       ,group= Classe
                   ))+
  geom_point() + geom_line(aes(linetype= Classe))+ 
  facet_wrap(~ grupo)+
  xlab("Ano") + 
  ylab("% classe") +
  ggtitle("Evolução classe econômica simulador x oficial")+
  theme( plot.title = element_text(size = 14, 
                                   face = "bold"),
         axis.title = element_text(size = 12),  
         #legend.title=element_text(size = 12),
         legend.title=element_blank(),
         legend.text = element_text(size=10),
         #legend.direction="horizontal",
         legend.position = "bottom")


#grafico de barras para as classes

brClassC <- ggplot(compClass, aes(x= Ano, y=percClasse,
                                  color = Classe,
                                  fill = Classe)) + 
  geom_bar(stat="identity") + 
  coord_flip() + #deixa o grafico de barras na vertical 
  facet_wrap(~ grupo)+
  xlab("Ano") + 
  ylab("% classe") +
  ggtitle("Evolução classe econômica  - simulador x oficial")+
  theme( plot.title = element_text(size = 14, 
                                   face = "bold"),
         axis.title = element_text(size = 12),  
         #legend.title=element_text(size = 12),
         legend.title=element_blank(),
         legend.text = element_text(size=10),
         #legend.direction="horizontal",
         legend.position = "bottom")

brClassC2<- ggplot(clEconomicaComp, aes(x= factor(Ano), y=perClasse,
                                        color = Classe,
                                        fill = Classe)) + 
  geom_bar(stat="identity") + 
  coord_flip() + #deixa o grafico de barras na vertical 
  facet_wrap(~ grupo)+
  xlab("Ano") + 
  ylab("% classe") +
  ggtitle("Evolução classe econômica  - simulador x oficial")+
  theme( plot.title = element_text(size = 14, 
                                   face = "bold"),
         axis.title = element_text(size = 12),  
         #legend.title=element_text(size = 12),
         legend.title=element_blank(),
         legend.text = element_text(size=10),
         #legend.direction="horizontal",
         legend.position = "bottom")




  
  
  
 