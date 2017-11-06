source("pendulo.R")

freq <- function(time) {
  return (1/time)
}

angularMotion <- function(time,w,teta0 = 5*pi/180){
  return(teta0*cos(w*time*pi))
}

w = freq(t)

time = t/20
time = time*c(0:20)
time = time*2

angulo = angularMotion(time,w)

PendulumLength = 9.245357

plot(time,PendulumLength*sin(angulo), type = 'l', col='red', ylab = 'x', xlab='instante (em s)')