source("equations.R")

data = read.csv("TABELAS - MEDIDA 1 - FISICA - experimento 1.csv")
height = data$h.m[length(data$h.m)] + data$Xexp.t..m.[length(data$Xexp.t..m.)]
deslocamento = data$h.m + data$Xexp.t..m.

v0 = velocityEqAX(data$h.m.)
t0 = timeEqVA(v0)

time = data$t.s. + t0
time[2:7] = time
time[1] = 0.0

# time = finalTime/6
# time = time*c(1:6)

# deslocamento = movementRUV(time)
# deslocamento = deslocamento/6
# deslocamento = deslocamento*c(1:6)

print(deslocamento)

# time = c(0:6)
velocidadeExperimental = velocityEqAT(time)
kExperimental = kinectEnergy(0.028,velocidadeExperimental)
uExperimental = potentialEnergy(0.028,height - movementRUV(time))

eExperimental = kExperimental + uExperimental
png(filename="plots/energy.png")
plot(time,kExperimental, type = 'l', col='red', ylab = 'kExperimental (em joule)', xlab='instante (em s)')
lines(time,uExperimental, col='blue')
lines(time,eExperimental, col='green')
legend("topleft", legend=c("kExperimental", "uExperimental", "mecanica"),fill=c("red","blue","green"), bty="n")
grid(nx=5,ny=5, col = 'lightgrey')
dev.off()

# png(filename="plots/deslocamento.png")
# plot(time,movementRUV(time), type = 'l', col='red', ylab = 'deslocamento (em m)', xlab='instante (em s)')
# dev.off()



# velocidadeExperimental = velocityEqAX(deslocamento)

# times = t/6
# x = times*(c(1:6))
# deslocamentoExperimental = movementRUV(x)
# 
# t = data$h.m.[1] + data$Xteor.t..m.[1]
# times = t/6
# x = times*(c(1:6))
# 
# deslocamenTeorico = movementRUV(x)
# 
# plot(x,deslocamenTeorico, type = 'l', col='red', ylab = 'deslocamento (em m)', xlab='instante (em s)')
# lines(x,deslocamentoExperimental, col='blue')
# legend("topleft", legend=c("X teorico", "x experimental"),fill=c("red", "blue"), bty="n")
# grid(nx=5,ny=5, col = 'lightgrey')
# 
# kTeorico = kinectEnergy(0.028,velocityEqAT(t = x))
# uTeorico = potentialEnergy(0.028,deslocamento - deslocamenTeorico)
# 
# lines(x,deslocamentoExperimental, col='blue')
# 
# plot(x,kTeorico, type = 'l', col='red', ylab = 'energia cinética (em joules)', xlab='instante (em s)')
# # legend("topleft", legend=c("X teorico", "x experimental"),fill=c("red", "blue"), bty="n")
# grid(nx=5,ny=5, col = 'lightgrey')
# 
# # curve((9.78033*x^2)/2, from=0, to=t, , xlab="x", ylab="y")
# 
# 
