library(RMongo)
mg1 <- mongoDbConnect('SimuladorC')
print(dbShowCollections(mg1))

results <- dbGetQuery(mg1, "movie", "{}", 0, 2)
names(results)


dbDisconnect(mongo)