library(rmongodb)
library(plyr)
library(RCurl)
library(rjson)
 m <- mongo.create(host="localhost")
mongo.is.connected(m)
mongo.get.databases(m)
mongo.get.database.collections(m, db ="SimuladorC" )
colection <- "SimuladorC.movie"

mongo.count(m, ns= colection)
#busca uma coisa
tmp <- mongo.find.one(m,colection)

class(tmp)

#transformar o resultado em lista
tmp = mongo.bson.to.list(tmp)
class(tmp)
names(tmp)


#insert
json <- '{"a":1, "b":2, "c":{"d":3, "e":4}}'
bson <- mongo.bson.from.JSON(json)
mongo.insert(m,ns,bson)


# lista
list <- list(a=2, b=3, c = list(d=4, e=5))
bson <- mongo.bson.from.list(list)
mongo.insert(m,ns,bson)


# consulta
