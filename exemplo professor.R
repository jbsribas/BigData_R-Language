HADOOP_HOME="/usr/lib/hadoop-0.20-mapreduce"
HADOOP_CMD="/usr/bin/hadoop"
HADOOP_STREAMING="/usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.0.0-mr1-cdh4.7.0.jar"

library("rmr2")

ints = to.dfs(1:100)

calc = mapreduce(
  input=ints, 
  map=function(k,v){
    return(keyval(v,2*v))
  } 
)
from.dfs(calc)