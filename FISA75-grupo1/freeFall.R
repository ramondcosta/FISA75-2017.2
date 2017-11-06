source("equations.R")

plotablepT <- function(t1,t0=0) {
  pT = t1 + t0
  pT[2:(length(t1)+1)] = pT
  pT[1] = 0.0
  return (pT)
}

cinectics <- function(pT) {
  height = movementRUV(pT[length(pT)])
  velocidadeExperimental = velocityEqAT(pT)
  kExperimental = kinectEnergy(0.028,velocidadeExperimental)
  uExperimental = potentialEnergy(0.028,height - movementRUV(pT))  
  eExperimental = kExperimental + uExperimental
  return(cinectics = data.frame(kExperimental,uExperimental,eExperimental))
}

plotFreefall <- function(name,e,pT) {
  folder = paste("plots/",name, sep = "")
  dir.create(folder)
  png(filename=paste(folder,"/energy.png",sep = ""))
  plot(pT,e$kExperimental, type = 'l', col='red', ylab = 'kExperimental (em joule)', xlab='instante (em s)')
  lines(pT,e$uExperimental, col='blue')
  lines(pT,e$eExperimental, col='green')
  legend("topleft", legend=c("kExperimental", "uExperimental", "mecanica"),fill=c("red","blue","green"), bty="n")
  grid(nx=5,ny=5, col = 'lightgrey')
  dev.off()
  
  png(filename=paste(folder,"/deslocamento.png",sep = ""))
  plot(pT,movementRUV(pT), type = 'l', col='red', ylab = 'deslocamento (em m)', xlab='instante (em s)')
  dev.off()
}