source(file=script1.R) #include

pop <- data.frame(baixa,media,alta)
g_range <- range(pop)

plot(baixa, type = "o", col="blue", ylim=g_range, ann=FALSE) # , axes=FALSE tira o eixo x, y

# Create box around plot
#box()

lines(media, type="o", pch=22, lty=2, col="red") 
lines(alta, type="o", pch=23, lty=3, col="green") 
#lty muda o tracegado da linha
title(main = "População por classe economica ", col.main="black", font.main=4)

title(xlab="Ano") #col.lab=rgb(0,0.5,0) muda a cor da legemda para verde 
title(ylab="% população")

legend("topright", g_range[2], c("baixa","media", "alta"), col=c("blue","red","green"),
       pch=21:23, lty=1:3, ncol = 3, bty="n", cex=0.8);
#topleft = topo a esquerda

# Turn off device driver (to flush output to png)
#dev.off()

