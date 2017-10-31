data <- read.csv("MEDIDA 2 - Sheet1.csv")
PendulumLengthEq <- function(t, g = 9.78033) {
  ((t/(2*pi))^2)*g
}

t1Mean = mean(data$verificacao.1[c(1:5)])
t2Mean = mean(data$verificacao.2[c(1:5)])

t = mean(c(t1Mean,t2Mean))

length = PendulumLengthEq(t)
print(length)

dadosOrig = read.csv("TABELAS - MEDIDA 1 - FISICA - experimento 1.csv")
dadosTrab <- dadosOrig
h<-dadosOrig[1,1]
g <- 9.7833 #m/s?
v0 <- sqrt(2*g*h)
dadosTrab$Vo.m.s. <- v0
dadosTrab$t.s. = (dadosTrab$t1.s.+dadosTrab$t2.s.)/2
dadosTrab$Xteor.t..m. <- v0*dadosTrab$t.s. + 0.5*g*dadosTrab$t.s.*dadosTrab$t.s.

plot(dadosTrab$Xteor.t..m., type = 'l', col='red', ylab = 'deslocamento (em m)', xlab='instancias do experimento')
lines(dadosTrab$Xexp.t..m., col='blue')
legend("topleft", legend=c("X teorico", "x experimental"),fill=c("red", "blue"), bty="n")
grid(nx=5,ny=5, col = 'lightgrey')

plot(dadosTrab$Xexp.t..m.,dadosTrab$Xteor.t..m., type = 'l', ylab = 'deslocamento te?rico', xlab = 'deslocamento observado' )
lines(function(x){x},type='l', col='green' )
  