data = read.csv("TABELAS - MEDIDA 1 - FISICA - experimento 1.csv")

deviatonPropagation <- function(theExpressionOfTheFunction,variablesList,deltas) {
  
  # calculate the derivates for each variable
  deviationsList = deriv(theExpressionOfTheFunction,variablesList)
  mode(deviationsList)
  # assigns the results
  deviationsList = attr(eval(deviationsList),"gradient")
  # multiplies each one for its respective deltas 
  deviationsList = deviationsList*deltas
  # return the sum of the deviations
  # return (sum(deviationsList))
  return (deviationsList)
}

# Desvio do V0
h = data$h.m.
g = 9.7833
# v0
expr = expression((2*g*h)^(1/2))
deltaV0 = deviatonPropagation(expr,c("h"),0.001)

# Desvio do "t0"
h = data$h.m.[1]
expr = ( (2*h)/g )^(1/2) 
deltaT0 = deviatonPropagation(expr,c("h"),0.001)

v0 = velocityEqAX(data$h.m.[1]);
time0 = timeEqVA(v0) ;

# Desvio do xTeorico
# as.double(format(round(1.20433, 2), nsmall = 2))
# t = 0.2280
t = data$t1.s.[1] + time0

expr = expression(1.387*t + (g*(t^2))/2)
deltaXteor = deviatonPropagation(expr,c("t"),0.001)
