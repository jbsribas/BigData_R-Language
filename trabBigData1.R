HADOOP_HOME="/usr/lib/hadoop-0.20-mapreduce"
HADOOP_CMD="/usr/bin/hadoop"
HADOOP_STREAMING="/usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.0.0-mr1-cdh4.7.0.jar"

library(rmr2)
library(jsonlite)
library(rmongodb)

url <- "/home/cloudera/tJessica/dados_teste_sbf.csv"
simu <-to.dfs(read.table(url,header=TRUE,sep=";"))


mapper<-function(k,valor){
    k = valor[,3]
    v = valor[4:26]
  return(keyval(k,v))
}

reducer<-function(k,valor){
         
  keyval(k,cbind(rbind(colMeans(valor[1:18])),
                 sum(valor[19]),sum(valor[20]),
                 rbind(colMeans(valor[21:23]))))
}
cont <- mapreduce(
  input=simu,
  #output=write.table()
  #output = tempfile(),
  #output.format = csv.format,
  map=mapper,
  reduce=reducer
)
resultadoM2<-as.data.frame(from.dfs(cont))


teste <- toJSON(resultadoM2,dataframe="columns")
#columns or rows or values

m <- mongo.create()

mongo.is.connected(m)

ns <- "SimuladorC.resultado"
bson <- mongo.bson.from.JSON(teste)
#bson <- mongo.bson.from.df(resultadoM2)
mongo.insert(m,ns,bson)

tmp <- mongo.find.one(m,ns)
tmp = mongo.bson.to.list(tmp)


