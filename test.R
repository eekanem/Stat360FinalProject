# test 1
source("mars.r")
source("predict.r")
source("print.r")
source("summary.r")
source("plot.R")
source("anova.R")

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

ins <- read.csv("insurance.csv")
mout2 <- mars(charges ~ age + bmi, data = ins, control = mc)
ff2 <- fitted(mout2)
p21 <- predict(mout2)
p22 <- predict(mout2, newdata = data.frame(age = ins$age, bmi = ins$bmi))
head(cbind(ff2,p21,p22)) # columns should be identical
mout2 # tests print method
summary(mout2) #test summary method
anova(mout2) # test anova method
plot(mout2)

# test 3

water <- na.omit(read.csv("waterquality.csv"))
mout3 <- mars(CONDUCTIVITY ~ pH + TOTAL_COLIFORM, data = water, control = mc)
ff3 <- fitted(mout3)
p31 <- predict(mout3)
p32 <- predict(mout3, newdata = data.frame(pH = water$pH, TOTAL_COLIFORM = water$TOTAL_COLIFORM))
head(cbind(ff3,p31,p32)) # columns should be identical
mout3 # tests print method
summary(mout3) #test summary method
anova(mout3) # test anova method
plot(mout3)
