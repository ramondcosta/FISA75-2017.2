  source("equations.R")
  source("freeFall.R")
  
  data = read.csv("TABELAS - MEDIDA 1 - FISICA - experimento 1.csv")
  height = data$h.m[length(data$h.m)] + data$Xexp.t..m.[length(data$Xexp.t..m.)]
  
  v0 = velocityEqAX(data$h.m.)
  time0 = timeEqVA(v0)
  
  time = plotableTime(t1 = data$t.s.,t0 = time0)
  
  energy = cinectics(time)
  
  plotFreefall("experimento1",energy,time)