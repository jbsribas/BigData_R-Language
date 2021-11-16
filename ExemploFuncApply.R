#apply
X = matrix(rnorm(200), ncol=20) # matriz com 20 colunas e 10 linhas
media_linha = apply(X, 1, mean) # média por linha
media_col= apply(X, 2, mean) # média por coluna

# lapply.R
X = list(x1=c(1,2,NA,4,5), x2=rnorm(100), x3=rnorm(100) )
lapply(X, mean)

# sapply.R
sapply(X, function(x)mean(x, na.rm=T) ) # Cálculo da média de cada elemento da lista via função anônima.

# tapply.R
X = rnorm(100) 
fator = sample(factor(c('a', 'b')), 100, rep=T) 
tapply(X, fator, mean) # A média dos valores por categoria

# mapply.R
mapply(rep, 1:4, 4:1)
