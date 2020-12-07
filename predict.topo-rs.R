##----------------------------------------------------------------
## 
## predict.topo-rs.R
## 
## Purpose: Output spatial predictions: probabilities using spatial inputs 
## and gbm outputs
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
## This is the script used for spatial predictions from the terrain-ndvi models.
## First run gbm models. Align the spatial data and save as raster brick.
## Select the terrain + remote sensing variables from the raster brick as
## inputs to the raster predict function.
##
##---------------------------------------------------------------
## 

library(gbm)
library(dismo)
library(raster)
library(rgdal)

## utm all layers
## read in the raster brick with the aligned spatial layers
## there are two--one brick has the terrain and the other has the remote sensing data layers
b<-brick("./data/raster/topo.climate.tif")
names(b)<-c("AHM", "TD","Aspect","Catchment_Area", "Catchment_Slope", "srtm_30m_madrean",
            "Slope_Height", "Slope", "Terrain_Ruggedness_Index_.TRI.", "Valley_Depth")
rs.b<-brick("./data/raster/rs1k.tif")
names(rs.b)<-c("SI_L5_NDMImonsoon_revised", "SI_L5_NDMIspring_revised", "SI_L5_NDVImonsoon_revised",
               "SI_L5_NDVIspring_revised")
## add mid slope pos (needed to add this after the others done above)
msp<-raster("./data/raster/Mid-Slope Positon.sdat") # position is misspelled in saga output
crs(msp)<-"+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
msp.utm<-projectRaster(msp, b)

#### predict combo 1: top 4 terrain + NDVI spr + NDVI mons
## P. engelmannii
## stack the input data layers
combo1.eng$gbm.call$predictor.names
#[1] "srtm_30m_madrean"               "Terrain_Ruggedness_Index_.TRI."
#[3] "Slope_Height"                   "Mid.Slope_Positon"             
#[5] "SI_L5_NDVIspring_revised"       "SI_L5_NDVImonsoon_revised"
s.eng<-stack(b[[6]], b[[9]], b[[7]], msp.utm, rs.b[[4]], rs.b[[3]])

predict(s.eng, combo1.eng, type="response", n.trees=combo1.eng$gbm.call$best.trees, 
        na.rm=FALSE, progress="text", filename="./data/raster/pineng.topo-ndvi.tif",
        format="GTiff", overwrite=TRUE)
eng.p1<-raster("./data/raster/pineng.topo-ndvi.tif")
plot(eng.p1)

## P. strobiformis
## stack the input data layers
combo1.str$gbm.call$predictor.names
#[1] "srtm_30m_madrean"               "Terrain_Ruggedness_Index_.TRI."
#[3] "Slope_Height"                   "Catchment_Slope"               
#[5] "SI_L5_NDVIspring_revised"       "SI_L5_NDVImonsoon_revised"
s.str<-stack(b[[6]], b[[9]], b[[7]], b[[5]], rs.b[[4]], rs.b[[3]])

predict(s.str, combo1.str, type="response", n.trees=combo1.str$gbm.call$best.trees, 
        na.rm=FALSE, progress="text", filename="./data/raster/pinstr.topo-ndvi.tif",
        format="GTiff", overwrite=TRUE)
str.p1<-raster("./data/raster/pinstr.topo-ndvi.tif")
plot(str.p1)

## P. arizonica
## stack the input data layers
combo1.ari$gbm.call$predictor.names
#[[1] "srtm_30m_madrean"          "Aspect"                    "Slope_Height"             
#[4] "Catchment_Area"            "SI_L5_NDVIspring_revised"  "SI_L5_NDVImonsoon_revised"
s.ari<-stack(b[[6]], b[[3]], b[[7]], b[[4]], rs.b[[4]], rs.b[[3]])

predict(s.ari, combo1.ari, type="response", n.trees=combo1.ari$gbm.call$best.trees, 
        na.rm=FALSE, progress="text", filename="./data/raster/pinari.topo-ndvi.tif",
        format="GTiff", overwrite=TRUE)
ari.p1<-raster("./data/raster/pinari.topo-ndvi.tif")
plot(ari.p1)

## P. discolor
## stack the input data layers
combo1.dis$gbm.call$predictor.names
#[[1] "srtm_30m_madrean"          "Aspect"                    "Catchment_Slope"          
#[4] "Slope_Height"              "SI_L5_NDVIspring_revised"  "SI_L5_NDVImonsoon_revised"
s.dis<-stack(b[[6]], b[[3]], b[[5]], b[[7]], rs.b[[4]], rs.b[[3]])

predict(s.dis, combo1.dis, type="response", n.trees=combo1.dis$gbm.call$best.trees, 
        na.rm=FALSE, progress="text", filename="./data/raster/pindis.topo-ndvi.tif",
        format="GTiff", overwrite=TRUE)
dis.p1<-raster("./data/raster/pindis.topo-ndvi.tif")
plot(dis.p1)

## P. chihuahuana
## stack the input data layers
combo1.chi$gbm.call$predictor.names
#[[1]"srtm_30m_madrean"               "Slope_Height"                  
#[3] "Valley_Depth"                   "Terrain_Ruggedness_Index_.TRI."
#[5] "SI_L5_NDVIspring_revised"       "SI_L5_NDVImonsoon_revised"
s.chi<-stack(b[[6]], b[[7]], b[[10]], b[[9]], rs.b[[4]], rs.b[[3]])

predict(s.chi, combo1.chi, type="response", n.trees=combo1.chi$gbm.call$best.trees, 
        na.rm=FALSE, progress="text", filename="./data/raster/pinchi.topo-ndvi.tif",
        format="GTiff", overwrite=TRUE)
chi.p1<-raster("./data/raster/pinchi.topo-ndvi.tif")
plot(chi.p1)

