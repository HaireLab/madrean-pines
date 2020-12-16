##----------------------------------------------------------------
## 
## gg.partial.plots-pinari.R
## 
## 
## Purpose: Output partial dependence plots the top 3 vars for each 
##    topo-climate model
## 
##
## Author: S. Haire, @HaireLab 
## 
##
## Date: 3 November 2020
##
##--------------------------------------------------------------
##
## Notes:
## This is a sample script for Pinus arizonica
## First run gbm models (gbm.topo.climate.R), then run versions of this script, edited for each species
## Next assemble the partial dependency plots for manuscript figure using assemble.pdp.R
## 
##---------------------------------------------------------------
## 

library(gbm)
library(dismo)
library(pdp)
library(ggplot2)
library(ggpubr)
library(caret)

## plots for arizonica
# Top predictors, enough to incl both bioclim vars
top.ari <- topPredictors(clim.ari, n = 3,numTrees=clim.ari$n.trees) # elev, ahm, aspect
## ahm plot
ari.ahm<-partial(clim.ari, pred.var = "AHM", train=pari, n.trees=clim.ari$n.trees)

ari.ahm$Climate<-"Normals"
names(ari.ahm) <- c("x", "y", "Climate") ## didn't use the climate name in final version

ahm.ari.p1<-ggline(ari.ahm, "x", "y", color="#deebf7",size=1.3, plot_type="l", 
                   linetype="solid", numeric.x.axis=TRUE, ggtheme=theme_dark(),ylab="Change in Response", xlab="Annual Heat Moisture Index (AHM)",
                   title="P. arizonica", font.main=c("bold.italic"))

## elev plot
ari.elev<-partial(clim.ari, pred.var = "srtm_30m_madrean", train=pari, n.trees=clim.ari$n.trees)

names(ari.elev)<-c("x","y")
elev.ari.p1<-ggline(ari.elev, "x", "y", color="#deebf7",size=1.3, plot_type="l", 
                    linetype="solid", numeric.x.axis=TRUE, ggtheme=theme_dark(),ylab="Change in Response", xlab="Elevation (m)")

## asp plot
ari.asp<-partial(clim.ari, pred.var = "Aspect", train=pari, n.trees=clim.ari$n.trees)

names(ari.asp)<-c("x","y")
asp.ari.p1<-ggline(ari.asp, "x", "y", color="#deebf7",size=1.3, plot_type="l", 
                   linetype="solid", numeric.x.axis=TRUE, ggtheme=theme_dark(), ylab="Change in Response", xlab="Aspect (radians)")

