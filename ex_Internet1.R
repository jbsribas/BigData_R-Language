HADOOP_HOME="/usr/lib/hadoop-0.20-mapreduce"
HADOOP_CMD="/usr/bin/hadoop"
HADOOP_STREAMING="/usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.0.0-mr1-cdh4.7.0.jar"

library("rmr2")
small.ints = 1:1000
sapply(small.ints, function(x) x^2)
small.ints = to.dfs(1:1000)
saida = 1:1000
mapreduce(
  input = small.ints,
  output = saida,
  map = function(k, v){
    key = v
    nData = dim(v)[1]
    val = matrix(data=1, nrow=nData, ncol=1)
    return(keyval(key, val))
  },
  reduce = function(k, v){
    key = k[1, 1]
    val = sum(k[, 2])
    return(keyval(key, val))
  }
)