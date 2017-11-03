source("equations.R")

plotableTime <- function(t1,t0=0) {
  time = t1 + t0
  time[2:(length(t1)+1)] = time
  time[1] = 0.0
  return (time)
}

cinectics <- function(time) {
  height = movementRUV(time[length(time)])
  velocidadeExperimental = velocityEqAT(time)
  kExperimental = kinectEnergy(0.028,velocidadeExperimental)
  uExperimental = potentialEnergy(0.028,height - movementRUV(time))  
  eExperimental = kExperimental + uExperimental
  return(cinectics = data.frame(kExperimental,uExperimental,eExperimental))
}

plotFreefall <- function(name,e) {
  folder = paste("plots/",name, sep = "")
  dir.create(folder)
  png(filename=paste(folder,"/energy.png",sep = ""))
  plot(time,e$kExperimental, type = 'l', col='red', ylab = 'kExperimental (em joule)', xlab='instante (em s)')
  lines(time,e$uExperimental, col='blue')
  lines(time,e$eExperimental, col='green')
  legend("topleft", legend=c("kExperimental", "uExperimental", "mecanica"),fill=c("red","blue","green"), bty="n")
  grid(nx=5,ny=5, col = 'lightgrey')
  dev.off()
  
  png(filename=paste(folder,"/deslocamento.png",sep = ""))
  plot(time,movementRUV(time), type = 'l', col='red', ylab = 'deslocamento (em m)', xlab='instante (em s)')
  dev.off()
}