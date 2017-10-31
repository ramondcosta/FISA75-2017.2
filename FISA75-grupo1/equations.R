# Deslocamento em moviment retilíneo uniforme
movementRUV <- function(t,a = 9.7833,s0 = 0,v0 = 0) {
  return (s0 + v0*t + (a*(t^2))/2)
}

# Equation for the pendulum length
PendulumLengthEq <- function(t, g = 9.7833) { 
  ((t/(2*pi))^2)*g
}
# Velocity Equation based on time and accelaration
velocityEqAT <- function(t, a = 9.7833 ,v0 = 0,asExpression = FALSE) {
  
  if(asExpression)
    return (expression(v0 + a*t))
  
  return (v0 + a*t);
}
# Time Equation based on Velocity and acceleration
timeEqVA <- function(v, a = 9.7833 ,v0 = 0) {
  return (v/a);
}

# Velocity Equation based on acceleration and movement
velocityEqAX <- function( deltaX, v0 = 0, a = 9.7833) {
  return (sqrt(v0^2 + 2*a*deltaX));
}
kinectEnergy = function(m,v){
  return ((1/2)*m*(v^2))
}
potentialEnergy = function(m,h,g = 9.7833){
  return(m*g*h)
}

MecanicEnergy = function(L,K){
  return(L+K)
}

work = function(f,d){
  return (f*d)
}

