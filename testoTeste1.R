HADOOP_HOME="/usr/lib/hadoop-0.20-mapreduce"
HADOOP_CMD="/usr/bin/hadoop"
HADOOP_STREAMING="/usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.0.0-mr1-cdh4.7.0.jar"

library("rmr2")

data<-to.dfs(readLines("/home/cloudera/tJessica/hamlet.txt"))

mapper<-function(k,lines){
  word.list<-strsplit(lines,'\\s')
  words<-unlist(word.list)
  return(keyval(words,1))
}

csv.format = make.output.format("csv", sep = ",")

reducer<-function(word,counts){
  keyval(word,sum(counts))
}
cont <- mapreduce(
  input=data,
  #output=write.table()
  #output = tempfile(),
  #output.format = csv.format,
  map=mapper,
  reduce=reducer
)
resultadoM<-as.data.frame(from.dfs(cont))


