##----------------------------------------------------------------
## 
## assemble.pdp.R
## 
## Purpose: Assemble the partial dependency plots for manuscript figure
##
## Author: S. Haire, @HaireLab 
## 
##
## Date: 3 November 2020
##
##--------------------------------------------------------------
##
## Notes:
## First run gbm models, then gg.partial.plots*.R
## Arrange the plots like so by row
## column 1: bioclim variable 1, column 2: bioclim variable 2, 
##             alternative column 2: terrain variable other than elevation
## column three: elevation
##---------------------------------------------------------------

library(gbm)
library(dismo)
library(pdp)
library(ggplot2)
library(patchwork)

## ggplot names: *variable.species.p1* for the three plots included in the ms figure
(ahm.str.p1 | tri.str.p1 | elev.str.p1) / (ahm.ari.p1 | asp.ari.p1 | elev.ari.p1 ) /
  (ahm.dis.p1 | td.dis.p1 | elev.dis.p1) / (ahm.eng.p1 | td.eng.p1 | elev.eng.p1) /
  (ahm.chi.p1 | td.chi.p1 | elev.chi.p1)

ggsave("./plots/spp5pdp.png", width=12, height=15)
