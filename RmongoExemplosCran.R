mongo <- mongoDbConnect("test", "localhost", 27017)
output <- dbInsertDocument(mongo, "test_data",
                          '{"foo": "bar"}') # tag e conteudo dela

res <- dbGetQuery(mongo, "test_data",'{"foo": "bar"}')

#or if you want only a particular set of keys:
  resp <- dbGetQueryForKeys(mongo, "test_data",                              '
{"foo": "bar"}','{"foo": 3}'  )