source(file=script1.R) #include


# smaller with horizontal y-axis labels
pop <- data.frame(baixa,media,alta)
ano <- c(1995,1996,1997,1998,1999,2000,2001,2002,2003,
         2004,2005,2006,2007,2008,2009,2010,2011,2012,
         2013,2014)

barplot(t(pop), main="populacao", xlab="% Pop", 
        col=heat.colors(3), space=0.1, cex.axis=0.8,
        las=1, names.arg=ano, cex=0.8, horiz=TRUE)
#deixar o grafico de barras na horizontal => horiz=TRUE


# legenda
legend(locator(1), xpd=TRUE ,names(pop), 
       cex=0.8, fill=heat.colors(3), 
       bty="n", ncol=3); #heat.colors(3)

#locator(1) => escolhe a posição da legenda na execução
#ncol +> colunas da legenda

# Restore default clipping rect
par(mar=c(5, 4, 4, 2) + 0.1)

