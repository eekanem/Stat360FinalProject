mars <- function(formula, data, control=NULL, ...) {
  cc <- match.call()
  mf <- model.frame(formula, data)
  y <- model.response(mf)
  mt <- attr(mf, "terms")
  x <- model.matrix(mt, mf)
  x_names <- colnames(x)
  if(is.null(control)){
    control <- mars.control()
  }
  fwd_out <- fwd_stepwise(y,x,control)
  bwd_out <- bwd_stepwise(fwd_out,control)
  fit <- lm(y~.-1, data=data.frame(y=y, bwd_out$B))
  out <- c(list(call=cc, formula=formula, y=y, B=bwd_out$B, splits=bwd_out$splits,x_names=x_names), fit)
  class(out) <- c("mars", class(fit))
  return(out)
}

new_mars.control<-function(Mmax, d, trace){
  structure(list(Mmax=Mmax, d=d, trace=trace), class="mars.control")
}
validate.control <- function(control){
  if(control$Mmax < 2){
    warning("input Mmax must be >= 2; setting to 2")
    control$Mmax <- 2
  }
  return(control)
}
mars.control <- function(Mmax=2, d=3, trace=FALSE) {
  control <- new_mars.control(Mmax,d,trace)
  validate.control(control)
  return(control)
}

## forward stepwise function
fwd_stepwise <- function(y,x,control){
  
  N <- length(y) # sample size
  n <- ncol(x) # number of predictors
  B <- matrix(1,nrow=N) # Exercise: write init_B()
  splits <- list(data.frame(m=0, v=0, s=NA, t=NA))
  #---------------------------------------------------
  # Looping for forward selection:
  M <- 1
  while(M <= control$Mmax) {
    lof_best <- Inf
    for(m in 1:M) { # choose a basis function to split
      split_var = setdiff(1:n, splits[[m]]$v)
      for(v in seq_along(split_var)){ # select a variable to split on
        tt <- split_points(x[,v],B[,m]) # Exercise: write split_points() 
        for(t in tt) { 
          Bnew <- data.frame(B[,(1:M)[-m]],
                             Btem1=B[,m]*h(x[,v],1,t), Btem2=B[,m]*h(x[,v],-1,t))
          gdat <- data.frame(y=y,Bnew)
          lof <- LOF(y~.,gdat) #  Use your LOF() from week 4
          if(lof < lof_best) { 
            lof_best <- lof
            split_best <- c(m=m,v=v,t=t)
          } # end if
        } # end loop over splits
      } # end loop over variables
    } # end loop over basis functions to split
    
    m <- split_best["m"]; v <- split_best["v"]; t <- split_best["t"]
    
    B <- cbind(B, B[,m]*h(x[,v],1,t), B[,m]*h(x[,v],-1,t))
    left_split <- rbind(splits[[m]],c(m,v,-1,t))
    right_split <- rbind(splits[[m]],c(m,v,1,t))
    
    splits <- c(splits,list(left_split),list(right_split))
    
    M <- M+2
  } # end loop over M
  colnames(B) <- paste0('B', seq(0, control$Mmax))
  return(list(B=B,splits=splits,y=y))
}

##Backward stepwise function
bwd_stepwise <- function(bwd_in, control) {
  control$Mmax <- ncol(bwd_in$B)-1
  j_best <- 1:control$Mmax 
  k_best <- j_best
  gdat <- data.frame(y=bwd_in$y,bwd_in$B)
  lof_best <- LOF(y~.,gdat)
  for(M in control$Mmax:2){
    B <- Inf
    L <- k_best
    for(m in 2:control$Mmax){
      
      K <- setdiff(L,m)
      gdat <- data.frame(y=bwd_in$y, bwd_in$B[,K])
      lof <- LOF(y~., gdat)
      if(lof<B){
        B <- lof
        k_best <- K
      }
      
      if(lof<lof_best){
        lof_best <- lof
        j_best <- K
      }
    }
  }
  
  bwd_list <- list(y = bwd_in$y, B=bwd_in$B[,j_best], splits=bwd_in$splits[j_best])
  return(bwd_list)
}

### supporting functions
h <- function(x,s,t) {
  return(pmax(0,s*(x-t)))
}

LOF <- function(form,data, d=3) {
  
  ff <- lm(form,data)
  SSR = (sum(residuals(ff)^2))
  N = nrow(data)
  M = length(coef(ff))-1
  cM_tilde = sum(diag(hatvalues(ff)))+d*M
  gcv = SSR*N/(N-cM_tilde)^2
  return(gcv)
}

split_points <- function(xv,Bm) {
  out <- sort(unique(xv[Bm>0]))
  return(out[-length(out)])
}