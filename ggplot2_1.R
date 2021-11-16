# Instalando os pacotes (caso não os tenha instalados)
#install.packages(c("ggplot2","ggthemes", "gridExtra"))

# Carregando os pacotes
library(ggplot2)
library(ggthemes)
library(gridExtra)

# Carrega arquivo
arquivo <- url("https://dl.dropboxusercontent.com/u/44201187/imoveis.rds")
con <- gzcon(arquivo)
dados <- readRDS(con)

#  Filtra apenas para venda
venda <- dados[dados$tipo == "venda", ]
