#preparacao para os plots
#classe
soma1 <- c(rowSums(resultadoM2[2:4]))
#renda
soma2 <- c(rowSums(resultadoM2[8:10]))

#inflacao classe
soma3 <- c(rowSums(resultadoM2[5:7]))
#inflacao renda
soma4 <- c(rowSums(resultadoM2[11:13]))

#investimento educação
soma5 <- c(rowSums(resultadoM2[14:16]))
#inflação investimento em educação
soma6 <- c(rowSums(resultadoM2[17:19]))

#calculo % e agrupamentos para o ggplot2            
perClasse<-c(resultadoM2$val.baixa*100/soma1,
            resultadoM2$val.media*100/soma1,
            resultadoM2$val.alta*100/soma1)   

perRenda <- c(resultadoM2$val.rendBaixa*100/soma2,
            resultadoM2$val.rendMedia*100/soma2,
            resultadoM2$val.rendAlta*100/soma2)

ie <- c(resultadoM2$val.InvEduB*100/soma5,
         resultadoM2$val.InvEduM*100/soma5,
         resultadoM2$val.InvEduA*100/soma5)

perClassei <-c(resultadoM2$val.baixa_inf*100/soma3,
        resultadoM2$val.media_inf*100/soma3,
        resultadoM2$val.alta_inf*100/soma3) 

perRendai <- c(resultadoM2$val.rendBaixaInf*100/soma4,
         resultadoM2$val.rendMediaInf*100/soma4,
         resultadoM2$val.rendAltaInf*100/soma4)

iei <- c(resultadoM2$val.InvEduBI*100/soma6,
        resultadoM2$val.InvEdumI*100/soma6,
        resultadoM2$val.InvEduAI*100/soma6)

b <- c()
m <- c()
a <- c()
bi <- c()
mi <- c()
ai <- c()
bo <- c()
mo <- c()
ao <- c()
g1 <- c()
g2 <- c()
f1 <- c()
f2 <- c()

for(i in 1:20){
  b[i]<- "DE1"
  m[i]<- "C1"
  a[i]<- "AB1"
  bi[i]<- "DE2"
  mi[i]<- "C2"
  ai[i]<- "AB2"
  bo[i] <- "DE3"
  mo[i] <- "C3"
  ao[i] <- "AB3"
  g1[i] <- "RT"
  g2[i] <-"Inflação"
  f1[i]<- "Simulação"
  f2[i]<- "Oficial"
}
classe <- c(b,m,a)
classei <- c(bi,mi,ai)
grupo <- c(g1,g1,g1,g2,g2,g2)
teste <- data.frame(perClasse,perRenda,classe,ie,Ano= c( resultadoM2$key))
testeI <- data.frame(perClassei,perRendai,classei,iei,Ano= c( resultadoM2$key))

percClasse<- c(perClasse,perClassei)
percRenda<- c(perRenda,perRendai)
Classe <- c(classe,classei)
invEdu <- c(ie,iei)
compClass<- data.frame(percClasse,percRenda,Classe,invEdu,Ano= c( resultadoM2$key),grupo)

qtde <- c(resultadoM2$val.NumBenef*100/soma1)
Gov <- data.frame(resultadoM2$val.V19*1800,
                  resultadoM2$val.V20*180000, 
                  qtde,
                  resultadoM2$key)
names(Gov)<- c("PTRC","IR","qtdBeneficario","Ano")

p <- c(2*resultadoM2$val.gini1,rGini[20:39,2])
u<- c(f1,f2)
t <- c(rGini[20:39,1],rGini[20:39,1])
giniP <- data.frame(p,u,t)
names(giniP)<- c("Gini1","tipo","Ano")

bolsa <- c(Gov$PTRC,rBF[1:10,3])
t<- c(rGini[20:39,1],rBF[1:10,1])
u <- c(f1,f2[1:10])
ptrcP <- data.frame(bolsa,t,u)
names(ptrcP) <- c("PTRC","Ano","tipo")

#pqp <- c(Gov$IR/(1+inflacaoA))
inflacaoA <- c(rInf[16:35,2])
irInf <- c(Gov$IR/(1+inflacaoA),
                   (rIR[1:20, 2]*1000000000))
u<- c(f1,f2)
t<- c(rIR[1:20, 1],rIR[1:20, 1])
irInfp <- data.frame(irInf,t,u)
names(irInfp) <- c("IR","Ano","tipo")

clEconomicaO <- c(classeE[3:22, 4],classeE[3:22, 3],classeE[3:22, 2])
clEconomicaC <- c(percClasse,clEconomicaO) #
u <- c(f1,f1,f1,f1,f1,f1,f2,f2,f2)
t <- c(classeE[3:22, 1],classeE[3:22, 1],classeE[3:22, 1],
       classeE[3:22, 1],classeE[3:22, 1],classeE[3:22, 1],# inflacao
       classeE[3:22, 1],classeE[3:22, 1],classeE[3:22, 1])
nGrupo <- c(grupo,f2,f2,f2)

classe2 <- c(Classe,  bo, mo,ao)

clEconomicaComp <- data.frame(clEconomicaC,classe2,t,u, nGrupo)
names(clEconomicaComp) <- c("perClasse","Classe","Ano","tipo","grupo")

clec <- c(perClasse,clEconomicaO)
u <- c(f1,f1,f1,f2,f2,f2)
t <- c(classeE[3:22, 1],classeE[3:22, 1],classeE[3:22, 1],
       classeE[3:22, 1],classeE[3:22, 1],classeE[3:22, 1])
nGrupo2 <- c(g1,g1,g1,f2,f2,f2)
classe3 <- c(b,m,a,bo,mo,ao)
clEconomicaComp2 <- data.frame(clec,classe3 ,t,u, nGrupo2)
names(clEconomicaComp2) <- c("perClasse","Classe","Ano","tipo","grupo")


#somente classe oficial
t <- c(classeE[3:22, 1],classeE[3:22, 1],classeE[3:22, 1])
classe4 <- c(bo,mo,ao)
clEconomicaComp3 <- data.frame(clEconomicaO,classe4 ,t )
names(clEconomicaComp3) <- c("perClasse","Classe","Ano")

