##----------------------------------------------------------------
## 
## gbm.terrain.R
## 
## Purpose: Run gbm for the terrain models 
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
## Models for 5 spp, predictors are all terrain variables
## Saved model results from this script are used to run
##   gbm.topo.climate.R and gbm.topo.ndvi.R
## 
##---------------------------------------------------------------
## 

library(gbm)
library(dismo)

peng<-read.csv("./data/tab/PinEng.us-mx-terrain.rs.csv")
pchi<-read.csv("./data/tab/PinChi.us-mx-terrain.rs.csv")
pstr<-read.csv("./data/tab/PinStr.us-mx-terrain.rs.csv")
pari<-read.csv("./data/tab/PinAri.us-mx-terrain.rs.csv")
pdis<-read.csv("./data/tab/PinDis.us-mx-terrain.rs.csv")

## not including corrrlated vars > |0.7|
xvars=c("Aspect","Slope","srtm_30m_madrean","Catchment_Area","Catchment_Slope",
        "Mid.Slope_Positon", "Slope_Height","Valley_Depth",                       
        "Terrain_Ruggedness_Index_.TRI.")

yvar = c("response") 
## PinEng
set.seed(15)
topo.eng <- gbm.step(data=peng, gbm.x = xvars, gbm.y = yvar, family = "bernoulli", 
                     bag.fraction=0.5, learning.rate=0.001, tree.complexity=5, 
                     plot.main=TRUE)

## PinStr
set.seed(15)
topo.str <- gbm.step(data=pstr, gbm.x = xvars, gbm.y = yvar, family = "bernoulli", 
                     bag.fraction=0.5, learning.rate=0.001, tree.complexity=5, 
                     plot.main=TRUE)

## PinAri
set.seed(15)
topo.ari <- gbm.step(data=pari, gbm.x = xvars, gbm.y = yvar, family = "bernoulli", 
                     bag.fraction=0.5, learning.rate=0.001, tree.complexity=5, 
                     plot.main=TRUE, verbose=TRUE)

## PinDis
set.seed(15)
topo.dis <- gbm.step(data=pdis, gbm.x = xvars, gbm.y = yvar, family = "bernoulli", 
                     bag.fraction=0.5, learning.rate=0.001, tree.complexity=5, 
                     plot.main=TRUE, verbose=TRUE)

# PinChi
set.seed(15)
topo.chi <- gbm.step(data=pchi, gbm.x = xvars, gbm.y = yvar, family = "bernoulli", 
                     bag.fraction=0.5, learning.rate=0.001, tree.complexity=5, 
                     plot.main=TRUE, verbose=TRUE)

