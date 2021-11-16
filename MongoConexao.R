library(rmongodb)
library(plyr)
library(RCurl)
library(rjson)
m <- mongo.create(host="localhost")
mongo.is.connected(m)
colection <- "SimuladorC.teste3"
bson <- mongo.bson.from.list(lista)
mongo.insert(m,colection,bson)