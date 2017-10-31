source("equations.R")

data = read.csv("Experimento 1.2 - Sheet1.csv")
deslocamento = data$h..m.[6]
finalVelocity = velocityEqAX(deslocamento)
finalTime = timeEqVA(finalVelocity)

time = finalTime/6
time = time*c(1:6)

deslocamento = movementRUV(time)
# deslocamento = deslocamento/6
# deslocamento = deslocamento*c(1:6)

print(deslocamento)

velocidadeExperimental = velocityEqAT(time)
kExperimental = kinectEnergy(0.028,velocidadeExperimental)
uExperimental = potentialEnergy(0.028,rev(deslocamento))

# png(filename="plots/energy2.png")
plot(time,kExperimental, type = 'l', col='red', ylab = 'kExperimental (em joule)', xlab='instante (em s)')
lines(time,uExperimental, col='blue')
lines(time,c(1,1,1,1,1,1), col='green')
legend("topleft", legend=c("kExperimental", "uExperimental"),fill=c("red", "blue"), bty="n")
grid(nx=5,ny=5, col = 'lightgrey')
# dev.off()

# png(filename="plots/deslocamento2.png")
plot(time,deslocamento, type = 'l', col='red', ylab = 'deslocamento (em m)', xlab='instante (em s)')
# dev.off()

