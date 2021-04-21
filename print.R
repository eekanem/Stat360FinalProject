print.mars<-function(object){
  cat("Call: ", "\n" )
  print(object$call); cat("\n")
  cat("Coefficients: ", "\n")
  print(round(object$coefficients, 4))
}