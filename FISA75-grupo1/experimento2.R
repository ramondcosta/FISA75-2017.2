source("equations.R")
source("freeFall.R")

data = read.csv("Experimento 1.2 - Sheet1.csv")

time = plotableTime(t1 = data$t..s.)

energy = cinectics(time)

plotFreefall("experimento2",energy)
