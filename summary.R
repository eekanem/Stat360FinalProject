summary.mars <- function(object) {
  
  N <- ncol(object$B)
  splits <- object$splits
  yy = as.data.frame(matrix(ncol=2, nrow=N))
  
  colnames(yy) = c("", "estimates")
  yy[[1,1]] = "(Intercept)"
  yy[[1,2]] = object$coefficients[1]
  
  for (i in 2:N) {
    if(splits[[i]]["s"][2,1]!= -1)
    {
      rr = paste0("h(", object$x_names[splits[[i]]["v"][2,1]],  "-",  splits[[i]]["t"][2,1], ")")
      if(splits[[i]]["t"][2,1]==0)
      {
        rr=object$x_names[splits[[i]]["v"][2,1]]
      }
    }
    else {
      rr = paste0("h(", splits[[i]]["t"][2,1],  "-", object$x_names[splits[[i]]["v"][2,1]], ")")
      if(splits[[i]]["t"][2,1]==0)
      {
        rr=object$x_names[splits[[i]]["v"][2,1]]
      }
    }
    yy[i,1]=gsub("[[:space:]]", "", rr)
    yy[i,2] = object$coefficients[i]
    
  }
  cat("Call: ", "\n" )
  print(object$call); cat("\n")
  print.data.frame(yy, row.names = FALSE); cat("\n")
  cat("Variables: ", "\n")
  for(x in 1:N){
    cat(colnames(object$B)[x], ":", yy[x,1], "\n")
  }
  
}