HADOOP_HOME="/usr/lib/hadoop-0.20-mapreduce"
HADOOP_CMD="/usr/bin/hadoop"
HADOOP_STREAMING="/usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.0.0-mr1-cdh4.7.0.jar"

library(rmr2)
library(jsonlite)
library(rmongodb)

url <- "/home/cloudera/tJessica/IR/IR.csv"
IR <-to.dfs(read.table(url,header=TRUE,sep=";"))

url <- "/home/cloudera/tJessica/IPCA_anual/ipeadata.csv"
IPCA <-to.dfs(read.table(url,header=TRUE,sep=";"))

url <- "/home/cloudera/tJessica/Gini/ipeadata.csv"
Gini <-to.dfs(read.table(url,header=TRUE,sep=";"))

url <- "/home/cloudera/tJessica/arquivoTXT/bf/bf.txt"
BF <-to.dfs(read.table(url,header=TRUE,sep=";"))


url <- "/home/cloudera/tJessica/arquivoTXT/estatistica/class2.txt"
classeCE <-to.dfs(read.table(url,header=TRUE,sep=";"))

url <- "/home/cloudera/tJessica/arquivoTXT/classe/todas2.csv"
todas <-to.dfs(read.table(url,header=TRUE,sep=";"))


mapper<-function(k,valor){
  k = valor$Data
  v = valor[2]
  return(keyval(k,v))
}
# k = valor$ano

mapBF<-function(k,valor){
  k = valor$bfa
  v = valor[2:3]
  return(keyval(k,v))
}

mapCE<-function(k,valor){
  k = valor$ano
  v = cbind(valor$ab,valor$c,valor$de)
  return(keyval(k,v))
}

maptodas<-function(k,valor){
  k = valor$ano
  v = cbind(valor[2:11])
  return(keyval(k,v))
}

reduTodas<-function(k,valor){
  keyval(k,cbind(sum(valor[1:4]),
                 sum(valor[5:6]),
                 sum(valor[7:10])))
}
reduIR <- function(k,valor){
      keyval(k,valor)
}


ir <- mapreduce(
                input=IR,
                map=mapper
                #,reduce=reduIR
                )

inf <- mapreduce(
                  input=IPCA,
                  map=mapper
                  #,reduce=reducer
                )

gini <- mapreduce(
                  input=Gini,
                  map=mapper
                   #,reduce=reducer
                  ) 

bf <- mapreduce(
  input=BF,
  map=mapBF
  #,reduce=reducer
)

cltodas<- mapreduce(
  input=todas, 
  map=maptodas
  ,reduce=reduTodas
)
 
classCE<- mapreduce(
  input=classeCE, 
  map=mapCE
  #,reduce=reduTodas
)
  
rIR<-as.data.frame(from.dfs(ir))
rInf<-as.data.frame(from.dfs(inf))
rGini<-as.data.frame(from.dfs(gini))
rBF<-as.data.frame(from.dfs(bf))
rclasseCE<-as.data.frame(from.dfs(classCE))
rclTodas <- as.data.frame(from.dfs(cltodas))

#mudar o titulo do data frame
names(rIR) <- c("ano","RFB")
names(rInf) <- c("ano","Ipeadata")
names(rGini) <- c("ano","Ipeadata")
names(rBF) <- c("ano","valorTotal","ValorPopulacao")
names(rclasseCE) <- c("Ano","AB","C","DE")
names(rclTodas) <- c("Ano","AB","C","DE")
#juntar os data frames classe
#ano2000 <-  cbind(Ano = c(2000),rbind(colMeans(rclTodas[7:8,2:4])))
classeE <- rbind(rclTodas,rclasseCE) #ano2000



lista <- list(pais = "Brasil" ,
              IR = as.list(rIR),
              Inflacao = as.list(rInf),
              Gini = as.list(rGini),
              PTRC = (BF = as.list(rBF)),
              ClasseEc = as.list(classeE)
              ) 
m <- mongo.create(host="localhost")
mongo.is.connected(m)
colection <- "SimuladorC.Indices"
bson2 <- mongo.bson.from.list(lista)
mongo.insert(m,colection,bson2)

mongo.bson.from.