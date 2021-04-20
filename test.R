# test 1
# source("mars.r")
# source("predict.r")
# source("print.r")
# source("summary.r")
# source("plot.R")

library(ISLR)
data(Wage)
mc <- mars.control(Mmax=10)
mout <- mars(wage ~ age + education, data=Wage, control=mc)
ff <- fitted(mout)
p1 <- predict(mout)
p2 <- predict(mout,newdata=data.frame(age=Wage$age,education=Wage$education))
head(cbind(ff,p1,p2)) # columns should be identical
mout # tests print method
summary(mout) #test summary method
anova(mout) # test anova method
plot(mout) # test plot method

# test 2

