make.output.format.format(
  "hbase", 
  family.columns = 
    list(
      pagina= list("bodyimage"), 
      post = list("author", "body")), 
  key.deserialize = "raw", 
  cell.deserialize = "raw", 
  dense = T, 
  atomic = T)

make.output.format