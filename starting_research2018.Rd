## getwd() is to find what directory you are on

setwd("Downloads")
setwd("stem_persistence") # Changed directory file name where data is stored

## how to import .csv files into R 

stemPer = read.csv("stem_persistence_update.csv", header = TRUE) 
attach(stemPer)

###########   ^^^^^^ YOU NEED TO RUN ^^^^^^ THIS FIRST ^^^^^^^^^^^^^    ##################

## Box plots

actmBplot <- boxplot(stemPer$actm_converted, ylab = "ACT Math Converted", main = "Stem Persistence Data")

actcrBplot <- boxplot(stemPer$actcr_converted, ylab = "ACT Critical Reading Converted", main = "Stem Persistence Data")

## Quantiles 

actcrQuant <- quantile(actcr_converted, na.rm = TRUE)

## Attempting to find some relationship between test scores and retention 

lm_actm_to_totalsem <- lm(stemPer$totalsemesters ~ stemPer$actm_converted) 

lm_actcr_to_totalsem <- lm(stemPer$totalsemesters ~ stemPer$actcr_converted)

## Attempting to find relationship between transfer hours and graduating in science

logit_gradscience_to_transferhrsbegin <- glm(gradscience ~ transferhrsbegin, data = stemPer, family = "binomial")

logit_gradscience_to_totaltransferhrs <- glm(gradscience ~ totaltransferhrs, data = stemPer, family = "binomial")

logit_gradscience_to_transferhrscbe <- glm(gradscience ~ transferhrscbe, data = stemPer, family = "binomial")

confint(logit_gradscience_to_totaltransferhrs)

logit_gradscience_to_transferhrs <- glm(gradscience ~ totaltransferhrs + transferhrsbegin + transferhrscbe, data = stemPer, family = "binomial")