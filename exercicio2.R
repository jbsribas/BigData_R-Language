HADOOP_HOME="/usr/lib/hadoop-0.20-mapreduce"
HADOOP_CMD="/usr/bin/hadoop"
HADOOP_STREAMING="/usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.0.0-mr1-cdh4.7.0.jar"

library("rmr2")

data <- seq(1:10) ## aqui pode ser um arquivo qualquer
data_matriz <- matrix(data=cbind(data,data,data),nrow=3, ncol=10) # aqui pode ser um arquivo qualquer
ints = to.dfs(data_matriz)
calc3 = mapreduce(
  input=ints, 
  map=function(k,v){
    key = seq(1:dim(v)[2])
    val = rbind(v[,1],2*v[,2],3*v[,3])
    return(keyval(key,val))
  },
  reduce = function(k, v){
    return(keyval(1,sum(v)))
  }
  
)
from.dfs(calc3)