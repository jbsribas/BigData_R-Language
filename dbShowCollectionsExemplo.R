mongo <- mongoDbConnect("test")
dbShowCollections(mongo)
d
bDisconnect(mongo)
