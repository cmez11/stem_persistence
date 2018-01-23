Homework 8 

fs <- read.table("http://media.pearsoncmg.com/cmg/pmmg_mml_shared/mathstatsresources/Akritas/FailStress.txt", header = T)
x <- fs$stress
y <- fs$fail 

1st Problem)

a) 

fit1 <- glm(y~x, family = binomial(), data = fs)
summary(fit1)

The p-value for the stress variable is 0.00786 which is less than the alpha value of 0.05, therefore we reject the null hypothesis and conclude there is statistically significant data to support it makes a difference. 

b) 

new1 <- data.frame(x=3.5,y=1)
predict(fit1, new1, type = "response")
Probability output: 0.380359

c) 

quadfit <- glm(y~x+I(x**2), family = binomial(), data = fs)
summary(quadfit)
confint(quadfit)
                 2.5 %    97.5 %
(Intercept) -12.1082724 4.3988418
x            -3.3572319 5.0682114
I(x^2)       -0.4938328 0.5257911

Given the confidence intervals,  we fail to reject the null hypothesis that the quadratic component is 0. 

2nd Problem) exercise 3

Pilot Reaction Time

prt<- read.table("http://media.pearsoncmg.com/cmg/pmmg_mml_shared/mathstatsresources/Akritas/PilotReacTimes.txt", header = T)

Part d) 

prt<- read.table("http://media.pearsoncmg.com/cmg/pmmg_mml_shared/mathstatsresources/Akritas/PilotReacTimes.txt", header = T)
A <- as.factor(design)
B <- as.factor(pilot)

aov <- aov(times~A+B, data = prt)
summary(aov)
Df Sum Sq Mean Sq F value   Pr(>F)    
A            3  8.373   2.791   9.194 0.000441 ***
B            7 29.109   4.158  13.698 1.49e-06 ***
Residuals   21  6.375   0.304                     
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

For treatment A, the p-value is 0.000441 so we would reject the null hypothesis at experiment-wise level 0.01.

3rd Problem) exercise 4

prt_CIs <- TukeyHSD(aov(times~A+B),"A" ,conf.level = 0.99)
prt_CIs

Fit: aov(formula = times ~ A + B)

$A
        diff        lwr        upr     p adj
B-A -0.83875 -1.8099955  0.1324955 0.0290281 
C-A -0.00875 -0.9799955  0.9624955 0.9999881
D-A -1.16375 -2.1349955 -0.1925045 0.0019931 SIGNIFICANT 
C-B  0.83000 -0.1412455  1.8012455 0.0310802
D-B -0.32500 -1.2962455  0.6462455 0.6458100
D-C -1.15500 -2.1262455 -0.1837545 0.0021465 SIGNIFICANT 

Only the differences between D and A, and D and C were significant. 
Increasing order of means: D, B, C, A 









