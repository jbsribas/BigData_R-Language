small.ints = 1:100
sapply(small.ints, function(x) x^2)
small.ints = to.dfs(1:100)
mapreduce(input = small.ints, 
          map = function(k, v) cbind(v, v^2))
