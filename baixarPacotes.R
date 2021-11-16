#install.packages("twitteR")
options(install.packages.check.source ="no")

install.packages("RMongo")
install.packages("rmongodb")
library("twitteR")
#install.packages("ROAuth")

library(ROAuth)
#install.packages("RCurl")
library(RCurl)
#install.packages("httr")
library(httr)
# Para o text mining
#install.packages("tm")
library("tm")
#install.packages("SnowballC")
library(SnowballC)   
#install.packages("wordcloud")
library(wordcloud) 
#install.packages("RColorBrewer")
library(RColorBrewer)

set_config(config(ssl_verifypeer = 0L))
download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")

options(httr_oauth_cache=T)

consumer_key <- ''
consumer_secret <- ''
access_token <- ''
access_secret <- ''

setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_secret)

## [1] "Using direct authentication"
s <- searchTwitter("restaurante",n=100, lang="pt",since='2011-01-01',geocode='-23.5372923,-46.6731866,50km')

s <- searchTwitter('restaurante + parmegiana',n=30,lang="pt",locale="SP",resultType="recent")

## Warning in doRppAPICall("search/tweets", n, params = params,
## retryOnRateLimit = retryOnRateLimit, : 30 tweets were requested but the API
## can only return 21
s <- userTimeline('@WazeTrafficSP',n=300)

s <- userTimeline('@folha_tec',n=300)
save(s,file='twitts.RData')

r_twitter_text <- sapply(s, function(x) x$getText())

corpus <- Corpus(VectorSource(r_twitter_text))
#conversao de lingua para evitar erros com os caracteres especiais
corpus = tm_map(corpus,function(x) iconv(x, to='latin1', sub='byte'))

#convertendo todo o texto para minusculo
corpus <- tm_map(corpus, tolower)
#criando funcao para remover os links que contiverem nos twittes
removeURL <- function(x) gsub("(http.*)", "", x, perl=TRUE)
#removendo a URL
corpus <- tm_map(corpus, content_transformer(removeURL))
#removendo a pontuacao
corpus <- tm_map(corpus, removePunctuation)
#removendo os stopwords
corpus <- tm_map(corpus, removeWords, stopwords("portuguese"))

dtm <- DocumentTermMatrix(corpus)
tdmMatrix <- as.matrix(dtm)
#write.csv(tdmMatrix, 'myfile_twitter.csv')

freq <- colSums(as.matrix(tdmMatrix))   
wordcloud(names(freq), freq, min.freq=20)

set.seed(1)   
#wordcloud(names(freq), freq, min.freq=50)
wordcloud(corpus,max.words=10, random.order=T)