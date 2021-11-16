HADOOP_HOME="/usr/lib/hadoop-0.20-mapreduce"
HADOOP_CMD="/usr/bin/hadoop"
HADOOP_STREAMING="/usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.0.0-mr1-cdh4.7.0.jar"

library(rmr2)
library(jsonlite)
library(rmongodb)
url <- "/home/cloudera/tJessica/arquivoTXT/estatistica/class2.txt"
classeCE <-to.dfs(read.table(url,header=TRUE,sep=";"))

#url <- "/home/cloudera/tJessica/arquivoTXT/classe/A1.txt"
#cA1 <-to.dfs(read.table(url,header=TRUE,sep=";"))
#url <- "/home/cloudera/tJessica/arquivoTXT/classe/A2.txt"
#cA2 <-to.dfs(read.table(url,header=TRUE,sep=";"))
#url <- "/home/cloudera/tJessica/arquivoTXT/classe/B1.txt"
#cB1 <-to.dfs(read.table(url,header=TRUE,sep=";"))
#url <- "/home/cloudera/tJessica/arquivoTXT/classe/B2.txt"
#cB2 <-to.dfs(read.table(url,header=TRUE,sep=";"))
#url <- "/home/cloudera/tJessica/arquivoTXT/classe/C1.txt"
#cC1 <-to.dfs(read.table(url,header=TRUE,sep=";"))
#url <- "/home/cloudera/tJessica/arquivoTXT/classe/C2.txt"
#cC2 <-to.dfs(read.table(url,header=TRUE,sep=";"))
#url <- "/home/cloudera/tJessica/arquivoTXT/classe/D1.txt"
#cD1 <-to.dfs(read.table(url,header=TRUE,sep=";"))
#url <- "/home/cloudera/tJessica/arquivoTXT/classe/D2.txt"
#cD2 <-to.dfs(read.table(url,header=TRUE,sep=";"))
#url <- "/home/cloudera/tJessica/arquivoTXT/classe/E1.txt"
#cE1 <-to.dfs(read.table(url,header=TRUE,sep=";"))
#url <- "/home/cloudera/tJessica/arquivoTXT/classe/E2.txt"
#cE2 <-to.dfs(read.table(url,header=TRUE,sep=";"))

url <- "/home/cloudera/tJessica/arquivoTXT/classe/todas.csv"
todas <-to.dfs(read.table(url,header=TRUE,sep=";"))


mapCE<-function(k,valor){
  k = valor$ano
  v = cbind(valor$ab,valor$c,valor$de)
  return(keyval(k,v))
}

mapCS6<-function(k,valor){
  k = cbind(valor$ano,valor$id)
  v = valor$valor
  return(keyval(k,v))
}


maptodas<-function(k,valor){
  k = valor$ano
  v = cbind(valor[2:11])
  return(keyval(k,v))
}

reducer<-function(k,valor){
  
  keyval(k,sum(valor)) #colSums
}

reduTodas<-function(k,valor){
  keyval(k,cbind(sum(valor[1:4]),
         sum(valor[5:6]),
         sum(valor[7:10])))
}

classeCE <- mapreduce(
  input=classeCE,
  map=mapCE
  #,reduce=reducer
)

#cl<- mapreduce(
  #input=c(cA1,cA2,cB1,cB2,cC1,cC2,cD1,cD2,cE1,cE2), #cA1,cA2,cB1,cB2,cC1,cC2,cD1,cD2,cE1,cE2
  #map=mapCS6
  #,reduce=reducer
#)

cltodas<- mapreduce(
  input=todas, 
  map=maptodas
  ,reduce=reduTodas
)

rclasseCE<-as.data.frame(from.dfs(classeCE))
#rcl<-as.data.frame(from.dfs(cl))
rclTodas <- as.data.frame(from.dfs(cltodas))

names(rclasseCE) <- c("Ano","AB","C","DE")
names(rclTodas) <- c("Ano","AB","C","DE")

teste <- rbind(rclTodas,rclasseCE)
 tst <- as.list(teste)

