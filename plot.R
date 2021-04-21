plot.mars=function(object){
  plot(fitted(object),residuals(object),pch=20,
       main="Residuals vs Fitted", xlab="Fitted", ylab="Residuals")
  abline(h=0, lwd=1, lty=2, col="gray")
}