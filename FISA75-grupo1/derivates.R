deviatonPropagation <- function(theExpressionOfTheFunction,variablesList,deltas) {
  
  # calculate the derivates for each variable
  deviationsList = deriv(theExpressionOfTheFunction,variablesList)
  mode(deviationsList)
  # assigns the results
  deviationsList = attr(eval(deviationsList),"gradient")
  # multiplies each one for its respective deltas 
  deviationsList = deviationsList*deltas
  # return the sum of the deviations
  return (sum(deviationsList))
}

# z = deviatonPropagation(expression(x^2*y),c("x","y"),c(2,3))
# print(z)

expr = expression( ((t^2)/(4*pi^2))/9.7833  )
deltaL = deviatonPropagation(expr,c("t"),0.1)