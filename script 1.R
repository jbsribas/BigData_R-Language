#pacotes


#importando o arquivo
url <- "/home/cloudera/tJessica/dados_teste_sbf.csv"
  #"C:/Users/jessica/Documents/Scripts R testando Simulador/dados_teste_sbf.csv"

# Start PNG device driver to save output to figure.png
png(filename="/home/cloudera/tJessica/figure.png", height=295, width=300, bg="white")

dados_teste_sbf <- read.table(file=url,header=TRUE,sep=";")
summary(dados_teste_sbf)

baixa<- c()
media<- c()
alta<- c()
baixaI<- c()
mediaI<- c()
altaI <- c()
rendaB<- c()
rendaM<- c()
rendaA<- c()
rendaBI<- c()
rendaMI<- c()
rendaAI<- c()
invEdB<- c()
invEdM<- c()
invEdA<- c()
invEdBI<- c()
invEdMI<- c()
invEdAI<- c()
gastoG<- c()
receitaG<- c()
gini1<- c()
gini2<- c()
numBenef<- c()

#media anual 
#populacaoT<- sum(baixa[1]+media[1]+alta[1])
populacaoT<- 10000
for(i in 1:20){
    ano <- subset(dados_teste_sbf,id_ano == i)
    #ano <- dados_teste_sbf[dados_teste_sbf$id_ano == i]
    med<-  rbind(apply(ano,2,mean))
    baixa[i]<- (as.numeric(med[1,4])*100)/populacaoT
    media[i]<- (med[1,5]*100)/populacaoT
    alta[i]<-(med[1,6]*100)/populacaoT
    baixaI[i]<- (med[1,7]*100)/populacaoT
    mediaI[i]<- (med[1,8]*100)/populacaoT
    altaI[i] <- (med[1,9]*100)/populacaoT
    rendaB[i]<- med[1,10]
    rendaM[i]<- med[1,11]
    rendaA[i]<- med[1,12]
    rendaBI[i]<- med[1,13]
    rendaMI[i]<- med[1,14]
    rendaAI[i]<- med[1,15]
    invEdB[i]<- med[1,16]
    invEdM[i]<- med[1,17]
    invEdA[i]<- med[1,18]
    invEdBI[i]<- med[1,19]
    invEdMI[i]<- med[1,20]
    invEdAI[i]<- med[1,21]
    gastoG[i]<- med[1,22]
    receitaG[i]<- med[1,23]
    gini1[i]<- med[1,24]
    gini2[i]<- med[1,25]
    numBenef[i]<- med[1,26]
}
medT <- data.frame(baixa,media,alta,baixaI,mediaI,altaI)
summary(medT)

# Calculate range from 0 to max value of cars and trucks
g_range <- range(baixa, baixaI)

plot(baixa, type = "o", col="blue", ylim=g_range, ann=FALSE) # , axes=FALSE tira o eixo x, y

# Create box around plot
box()

lines(baixaI, type="o", pch=22, lty=2, col="red") 
#lty muda o tracegado da linha
title(main = "classe baixa", col.main="red", font.main=4)

title(xlab="Ano") #col.lab=rgb(0,0.5,0) muda a cor da legemda para verde 
title(ylab="% popula??o")

legend("topright", g_range[2], c("baixa","baixaI"), col=c("blue","red"), pch=21:22, lty=1:2);
#topleft = topo a esquerda

# Turn off device driver (to flush output to png)
#dev.off()

