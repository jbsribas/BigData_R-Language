library(ineq)

data(AirPassengers)
ineq(AirPassengers,type="Gini")

plot(Lc(AirPassengers))

plot(Lc(AirPassengers),col="darkred",lwd=2)