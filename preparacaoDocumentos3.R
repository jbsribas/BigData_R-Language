# Leitura de arquivo
# build a corpus, which is a collection of text documents
# VectorSource specifies that the source is character vectors.
#arquivos<-Corpus(DirSource("C:/Users/leusto/Desktop/tweets")) 
#library(twitteR)
library(NLP)
library(tm)



df <- read.table('/home/cloudera/Desktop/teste_preparacao.txt')

length(df)


corpus <- Corpus(VectorSource(df))

length(corpus)
inspect(corpus)

# Transforma a capializacao dos tokens
corpus <- tm_map(corpus,content_transformer(tolower))

length(corpus)
inspect(corpus)

# Remove as pontua??es 
corpus <- tm_map(corpus,removePunctuation)

length(corpus)
inspect(corpus)

# Remove os numeros
corpus <- tm_map(corpus,removeNumbers)

length(corpus)
inspect(corpus)


# Elimina os stopwords
#myCorpus <- tm_map(myCorpus,removeWords,stopwords('portuguese')) 
corpus <- tm_map(corpus,removeWords,stopwords('english')) 

length(corpus)
inspect(corpus)

# Reduza ao radica
corpus <- tm_map(corpus,stemDocument)

length(corpus)
inspect(corpus)

# Represen??o por frequencia de termos
tf<-TermDocumentMatrix(corpus,control=list(minWordLength=1,minDocFreq=2)) 

length(tf)
inspect(tf)


# WORD CLOUD
library(wordcloud)
library(RColorBrewer)
m <- as.matrix(tf)
# calculate the frequency of words
v <- sort(rowSums(m), decreasing=TRUE)
myNames <- names(v)
k <- which(names(v)=="miners")
myNames[k] <- "mining"
d <- data.frame(word=myNames, freq=v)
wordcloud(d$word, d$freq, min.freq=10)
