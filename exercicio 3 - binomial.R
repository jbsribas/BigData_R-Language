HADOOP_HOME="/usr/lib/hadoop-0.20-mapreduce"
HADOOP_CMD="/usr/bin/hadoop"
HADOOP_STREAMING="/usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.0.0-mr1-cdh4.7.0.jar"

library("rmr2")

data <- rbinom(32, n=50, prob= 0.4)
ints = to.dfs(data)
calc4 = mapreduce(
  input=ints, 
  map=function(k,v){
    key = v
    val = 1
    return(keyval(key,val))
  },
  reduce = function(k, v){
    return(keyval(k,sum(v)))
  }
  
)
from.dfs(calc4)