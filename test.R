source("marstest.R")

# test 1
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

water <- (na.omit(read.csv("waterquality.csv")))
mout3 <- mars(CONDUCTIVITY ~ pH + TOTAL_COLIFORM, data = water, control = mc)
ff3 <- fitted(mout4)
p31 <- predict(mout4)
p32 <- predict(mout4, newdata = data.frame(pH = water$pH, DMC = forest$DMC))
head(cbind(ff3,p31,p32)) # columns should be identical
mout3 # tests print method
summary(mout3) #test summary method
anova(mout3) # test anova method
plot(mout3)

# test 4

forest <- read.csv("forestfires.csv")
forest$area <- log(forest$area+1)
mout4 <- mars(area ~ ISI + DMC, data = forest, control = mc)
ff4 <- fitted(mout4)
p41 <- predict(mout4)
p42 <- predict(mout4, newdata = data.frame(ISI = forest$ISI, DMC = forest$DMC))
head(cbind(ff4,p41,p42)) # columns should be identical
mout4 # tests print method
summary(mout4) #test summary method
anova(mout4) # test anova method
plot(mout4)

# test 5

# #install.packages("AmesHousing")
# library(AmesHousing)
# ames <- make_ames()
# mout2<-mars(Sale_Price ~ Gr_Liv_Area + Year_Sold, data = ames, control=mc)
# ff2 <- fitted(mout2)
# p12 <- predict(mout2)
# p22 <- predict(mout2,newdata=data.frame(Gr_Liv_Area=ames$Gr_Liv_Area4,Year_Sold=ames$Year_Sold))
# head(cbind(ff2,p12,p22)) # columns should be identical
# mout2 # tests print method
# summary(mout2) #test summary method
# anova(mout2) # test anova method
# plot(mout2) # test plot method
