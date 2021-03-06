##----------------------------------------------------------------
## 
## gbm.topo.ndvi.R
## 
## Purpose: Run gbm for the terrain-ndvi and terrain-ndmi models 
##
## Author: S. Haire, @HaireLab 
## 
##
## Date: 3 November 2020
##
##--------------------------------------------------------------
##
## Notes:
## NDVI = combo2...NDMI = combo1
## 
## First run gbm.terrain.R and Save Workspace
##
## Models for 5 spp, predictors are top 4 terrain + NDVI spring + NDVI monsoon in these models
## 
## 
##---------------------------------------------------------------
## 

library(gbm)
library(dismo)
library(pdp)
library(caret)

## using revised rs data to correct missing data
peng<-read.csv("./data/tab/PinEng.us-mx-terrain.rs.csv")
pdis<-read.csv("./data/tab/PinDis.us-mx-terrain.rs.csv")
pari<-read.csv("./data/tab/PinAri.us-mx-terrain.rs.csv")
pchi<-read.csv("./data/tab/PinChi.us-mx-terrain.rs.csv")
pstr<-read.csv("./data/tab/PinStr.us-mx-terrain.rs.csv")

rsvars=c("SI_L5_NDVIspring_revised", "SI_L5_NDVImonsoon_revised")
yvar=c("response")
## PinEng
topo4<-topPredictors(topo.eng, n=4, numTrees=topo.eng$n.trees)
set.seed(15)
combo2.eng <- gbm.step(data=peng, gbm.x = c(topo4, rsvars), gbm.y = yvar, family = "bernoulli", 
                     bag.fraction=0.5, learning.rate=0.01, tree.complexity=5, 
                     plot.main=TRUE)

## PinStr
topo4<-topPredictors(topo.str, n=4, numTrees=topo.str$n.trees)
set.seed(15)
combo2.str <- gbm.step(data=pstr, gbm.x = c(topo4, rsvars), gbm.y = yvar, family = "bernoulli", 
                     bag.fraction=0.5, learning.rate=0.01, tree.complexity=5, 
                     plot.main=TRUE)

## PinAri
topo4<-topPredictors(topo.ari, n=4, numTrees=topo.ari$n.trees)
set.seed(15)
combo2.ari <- gbm.step(data=pari, gbm.x = c(topo4, rsvars), gbm.y = yvar, family = "bernoulli", 
                     bag.fraction=0.5, learning.rate=0.01, tree.complexity=5, 
                     plot.main=TRUE, verbose=TRUE)

## PinDis
topo4<-topPredictors(topo.dis, n=4, numTrees=topo.dis$n.trees)
set.seed(15)
combo2.dis <- gbm.step(data=pdis, gbm.x = c(topo4, rsvars), gbm.y = yvar, family = "bernoulli", 
                     bag.fraction=0.5, learning.rate=0.01, tree.complexity=5, 
                     plot.main=TRUE, verbose=TRUE)

# PinChi
topo4<-topPredictors(topo.chi, n=4, numTrees=topo.chi$n.trees)
set.seed(15)
combo2.chi <- gbm.step(data=pchi, gbm.x = c(topo4, rsvars), gbm.y = yvar, family = "bernoulli", 
                     bag.fraction=0.5, learning.rate=0.01, tree.complexity=5, 
                     plot.main=TRUE, verbose=TRUE)
