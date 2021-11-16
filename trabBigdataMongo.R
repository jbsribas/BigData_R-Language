library(jsonlite)
library(rmongodb)

m <- mongo.create()

mongo.is.connected(m)

ns <- "SimuladorC.resultado"
ns2 <- "SimuladorC.Indices"
#bson <- mongo.bson.from.JSON(teste)
#mongo.insert(m,ns,bson)

tmp <- mongo.find.one(m,ns)
tmp = mongo.bson.to.list(tmp)

tmp2 <- mongo.find.one(m,ns2)
tmp2 = mongo.bson.to.list(tmp2)

classeE <- as.data.frame(tmp2$ClasseEc)
rIR <- as.data.frame(tmp2$IR)
rBF <- as.data.frame(tmp2$PTRC)
rInf <- as.data.frame(tmp2$Inflacao)
# ajuste da lista dentro da lista tmp2$Gini$Ipeadata
rGiniano <- as.data.frame(tmp2$Gini$ano)#ver com calma
rGinival <- as.numeric(unlist(as.character(tmp2$Gini$Ipeadata))) 
rGini <- data.frame(rGiniano,rGinival)

resultadoM2<- data.frame(tmp$key,
                         as.numeric(unlist(as.character(tmp$val.baixa))),
                         as.numeric(unlist(as.character(tmp$val.media))),
                         as.numeric(unlist(as.character(tmp$val.alta))),
                         as.numeric(unlist(as.character(tmp$val.baixa_inf))),
                         as.numeric(unlist(as.character(tmp$val.media_inf))),
                         as.numeric(unlist(as.character(tmp$val.alta_inf))),
                         as.numeric(unlist(as.character(tmp$val.rendBaixa))),
                         as.numeric(unlist(as.character(tmp$val.rendMedia))),
                         as.numeric(unlist(as.character(tmp$val.rendAlta))),
                         as.numeric(unlist(as.character(tmp$val.rendBaixaInf))),
                         as.numeric(unlist(as.character(tmp$val.rendMediaInf))),
                         as.numeric(unlist(as.character(tmp$val.rendAltaInf))),
                         as.numeric(unlist(as.character(tmp$val.InvEduB))),
                         as.numeric(unlist(as.character(tmp$val.InvEduM))),
                         as.numeric(unlist(as.character(tmp$val.InvEduA))),
                         as.numeric(unlist(as.character(tmp$val.InvEduBI))),
                         as.numeric(unlist(as.character(tmp$val.InvEdumI))),
                         as.numeric(unlist(as.character(tmp$val.InvEduAI))),
                         as.numeric(unlist(as.character(tmp$val.V19))),
                         as.numeric(unlist(as.character(tmp$val.V20))),
                         as.numeric(unlist(as.character(tmp$val.gini1))),
                         as.numeric(unlist(as.character(tmp$val.gini2))),
                         as.numeric(unlist(as.character(tmp$val.NumBenef))))

  names(resultadoM2)<- c("key","val.baixa","val.media","val.alta",
                          "val.baixa_inf","val.media_inf","val.alta_inf",
                         "val.rendBaixa","val.rendMedia","val.rendAlta",
                         "val.rendBaixaInf","val.rendMediaInf","val.rendAltaInf",
                         "val.InvEduB","val.InvEduM", "val.InvEduA",
                         "val.InvEduBI","val.InvEdumI","val.InvEduAI",
                         "val.V19","val.V20",
                         "val.gini1","val.gini2","val.NumBenef")

