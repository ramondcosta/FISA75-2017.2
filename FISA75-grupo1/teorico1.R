source("equations.R")
source("freeFall.R")

data = read.csv("TABELAS - MEDIDA 1 - FISICA - experimento 1.csv")
# height = data$h.m[length(data$h.m)] + data$Xexp.t..m.[length(data$Xexp.t..m.)]
height = data$h.m[length(data$h.m)] + data$Xteor.t..m.[length(data$Xteor.t..m.)]

v0 = velocityEqAX(data$h.m.)
time0 = timeEqVA(v0)

# 
auxVelocity = velocityEqAX(data$Xteor.t..m.)
auxTime = timeEqVA(auxVelocity)
# 

# time = plotableTime(t1 = data$t.s.,t0 = time0)
time = plotableTime(t1 = auxTime,t0 = time0)

energy = cinectics(time)

# folder = paste("plots/",name, sep = "")
# dir.create(folder)
# png(filename=paste(folder,"/energy.png",sep = ""))
plot(time,energy$kExperimental, type = 'l', col='red', ylab = 'kExperimental (em joule)', xlab='instante (em s)')
lines(time,energy$uExperimental, col='blue')
lines(time,energy$eExperimental, col='green')
legend("topleft", legend=c("kTeorico", "uTeorico", "eTeorico"),fill=c("red","blue","green"), bty="n")
grid(nx=5,ny=5, col = 'lightgrey')
# dev.off()

# png(filename=paste(folder,"/deslocamento.png",sep = ""))
# plot(time,movementRUV(time), type = 'l', col='red', ylab = 'deslocamento (em m)', xlab='instante (em s)')
# dev.off()

# plotFreefall("experimento1",energy)
