plot.mars=function(object, which=NULL){
  if(which==1 || is.null(which)){
  plot(fitted(object),residuals(object),pch=20,
       main="Residuals vs Fitted", xlab="Fitted", ylab="Residuals")
  abline(h=0, lwd=1, lty=2, col="gray")
  }
  else if(which==2){
    plot.ecdf(ecdf(abs(object$residuals)),
              main="Cumulative Distribution", xlab="abs(residuals)", ylab="Proportion")
  }
}
