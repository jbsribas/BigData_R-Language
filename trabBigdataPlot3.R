library(ggplot2)


#indice de gini
giniPlot <- ggplot(na.omit(giniP), 
                aes(Ano, Gini1
                    ,color = tipo
                    ,shape = tipo
                    ,group=tipo))+
  geom_point() + geom_line(aes(linetype=tipo))+
  xlab("Ano") + 
  ylab("Gini") +
  ggtitle("  Índice de Gini - Simulador x Oficial")+
  theme( plot.title = element_text(size = 14, 
                                   face = "bold"),
         axis.title = element_text(size = 12),  
         #legend.title=element_text(size = 12),
         legend.title=element_blank(),
         legend.text = element_text(size=12),
         legend.direction="horizontal",
         legend.position = "bottom")


#Imposto de renda 
IR <- ggplot(irInfp, aes(x= Ano, y=IR,
                      color = tipo,
                      fill = tipo
                )) + 
       geom_bar(stat="identity", position = "dodge")+
       xlab("Ano") + 
       ylab("Arrecadacao") +
       ggtitle(" Imposto de Renda  - simulador x Oficial")+
       theme( plot.title = element_text(size = 14, 
                                   face = "bold"),
               axis.title = element_text(size = 12),  
               #legend.title=element_text(size = 12),
               legend.title=element_blank(),
               legend.text = element_text(size=12),
               legend.direction="horizontal",
               legend.position = "bottom")

#PTRC ao longo do tempo
prtc <- ggplot(Gov, aes(x= Ano, y=PTRC,
                      #color = Classe,
                      #fill = Classe
                      )) + 
         geom_bar(stat="identity") +
         xlab("Ano") + 
         ylab("PTRC") +
         ggtitle("Programa de Transferencia de Renda Condicional -simulação ")+
         theme( plot.title = element_text(size = 14, 
                                   face = "bold"),
                axis.title = element_text(size = 12),  
                legend.title=element_text(size = 12),
                #legend.title=element_blank(),
                legend.text = element_text(size=12),
                legend.direction="horizontal",
                legend.position = "bottom")


ptrcL<- ggplot(ptrcP, aes(Ano, PTRC
                      ,color = tipo
                      ,shape = tipo
                      ,group=tipo))+
        geom_point() + geom_line()+
        xlab("Ano") + 
        ylab("PTRC") +
        ggtitle(" Programa de Transferência de Renda Condicional - Simulador x Oficial")+
         theme( plot.title = element_text(size = 14, 
                                   face = "bold"),
                axis.title = element_text(size = 12),  
                #legend.title=element_text(size = 12),
                legend.title=element_blank(),
                legend.text = element_text(size=12),
                legend.direction="horizontal",
                legend.position = "bottom")


#Linha da pobreza
qtdBenef<- ggplot(Gov, aes(Ano, qtdBeneficario))+
          geom_point() + geom_line()+
          xlab("tempo") + 
          ylab("% familias ") +
          ggtitle("Quantidades de familias linha da pobreza ao longo do tempo - simulador")+
         theme( plot.title = element_text(size = 14, 
                                   face = "bold"),
                axis.title = element_text(size = 12),  
                legend.title=element_text(size = 12),
                legend.text = element_text(size=12),
                legend.direction="horizontal",
                legend.position = "bottom")


# grafico de linhas para renda
classR <- ggplot(compClass, 
                 aes(Ano, percRenda
                     ,color = Classe
                     , fill = Classe))+
  geom_line()+
  facet_wrap(~ grupo)+
  #theme_minimal() +
  xlab("tempo") + 
  ylab("% renda") +
  ggtitle("Divisão de renda por classe ao longo do tempo - simulação") +
  theme( plot.title = element_text(size = 14, 
                                   face = "bold"),
         axis.title = element_text(size = 12),  
         legend.title=element_text(size = 12),
         legend.text = element_text(size=12),
         legend.direction="horizontal",
         legend.position = "bottom")
  



