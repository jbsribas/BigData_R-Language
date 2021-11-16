HADOOP_HOME="/usr/lib/hadoop-0.20-mapreduce"
HADOOP_CMD="/usr/bin/hadoop"
HADOOP_STREAMING="/usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.0.0-mr1-cdh4.7.0.jar"

library("rmr2")

data <- seq(1:10)
ints = to.dfs(data)
calc2 = mapreduce(
  input=ints, 
  map=function(k,v){
    #key = seq(1:dim(v)[1])
    val = 2*v
    return(keyval(v,val))
  },
  reduce = function(k, v){
    return(keyval(1,sum(v)))
  }
  
)
from.dfs(calc2)