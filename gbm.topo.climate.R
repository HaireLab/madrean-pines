##----------------------------------------------------------------
## 
## gbm.topo.climate.R
## 
## Purpose: Run gbm for the terrain-bioclimatic models 
##
## Author: S. Haire, @HaireLab 
## 
##
## Date: 3 November 2020
##
##--------------------------------------------------------------
##
## Notes:
##  
## Models for 5 spp, predictors are top 4 terrain + two bioclimatic variables
## 
## 
##---------------------------------------------------------------
## 

library(gbm)
library(dismo)
library(pdp)
library(caret)

## read in 
peng<-read.table("./data/tab/PinEng.us-mx-bioens.txt")
pdis<-read.table("./data/tab/PinDis.us-mx-bioens.txt")
pari<-read.table("./data/tab/PinAri.us-mx-bioens.txt")
pchi<-read.table("./data/tab/PinChi.us-mx-bioens.txt")
pstr<-read.table("./data/tab/PinStr.us-mx-bioens.txt")

xvars=c("AHM", "TD")

## PinEng
topo4<-topPredictors(topo.eng, n=4, numTrees=topo.eng$n.trees)
set.seed(15)
clim.eng <- gbm.step(data=peng, gbm.x = c(xvars, topo4), gbm.y = 58, family = "bernoulli",
                     bag.fraction=0.5, learning.rate=0.01, 
                      tree.complexity=5, plot.main=TRUE)

## PinDis
topo4<-topPredictors(topo.dis, n=4, numTrees=topo.dis$n.trees)
set.seed(15)
clim.dis <- gbm.step(data=pdis, gbm.x = c(xvars, topo4), gbm.y = 58, family = "bernoulli",
                     bag.fraction=0.5, learning.rate=0.01, tree.complexity=5,
                      plot.main=TRUE)

## PinStr
topo4<-topPredictors(topo.str, n=4, numTrees=topo.str$n.trees)
set.seed(15)
clim.str <- gbm.step(data=pstr, gbm.x = c(xvars, topo4), gbm.y = 58, family = "bernoulli",
                     bag.fraction=0.5, learning.rate=0.01, tree.complexity=5,
                    plot.main=TRUE)

## PinAri
topo4<-topPredictors(topo.ari, n=4, numTrees=topo.ari$n.trees)
set.seed(15)
clim.ari <- gbm.step(data=pari, gbm.x = c(xvars, topo4), gbm.y = 58, family = "bernoulli",
                     bag.fraction=0.5, learning.rate=0.01, tree.complexity=5,
                     plot.main=TRUE)

## PinChi
topo4<-topPredictors(topo.chi, n=4, numTrees=topo.chi$n.trees)
set.seed(15)
clim.chi <- gbm.step(data=pchi, gbm.x = c(xvars, topo4), gbm.y = 58, family = "bernoulli",
                     bag.fraction=0.5, learning.rate=0.01, tree.complexity=5,
                      plot.main=TRUE) 
