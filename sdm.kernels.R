##----------------------------------------------------------------
## 
## sdm.kernels.R
## 
## 
## Purpose: Use the raster focal function to smooth the predicted probabilities 
## and map gradient in high, medium and low probabilities
## Use the maps in manuscript figures
##
## Author: S. Haire, @HaireLab 
## 
##
## Date: 3 November 2020
##
##--------------------------------------------------------------
##
## Notes:
## See predict.topo-rs.R for example of spatial predictions from gbm
## using terrain-ndvi inputs
## 
##---------------------------------------------------------------
## 

library(raster)
library(rgdal)

## kernels--terrain bioclim

chi<-raster("./data/raster/pinchi.topo-clim.mask.tif")
gf<-focalWeight(chi, 1000,"Gauss")
chig<-focal(chi, w=gf, pad=TRUE, padValue=0, na.rm=TRUE)
chig<-mask(chig, islands.utm)
writeRaster(chig, "./data/raster/chi-climkern7.tif", overwrite=TRUE)

str<-raster("./data/raster/pinstr.topo-clim.mask.tif")
strg<-focal(str, w=gf, pad=TRUE, padValue=0, na.rm=TRUE)
strg<-mask(strg, islands.utm)
writeRaster(strg, "./data/raster/str-climkern7.tif", overwrite=TRUE)

ari<-raster("./data/raster/pinari.topo-clim.mask.tif")
arig<-focal(ari, w=gf, pad=TRUE, padValue=0, na.rm=TRUE)
arig<-mask(arig, islands.utm)
writeRaster(arig, "./data/raster/ari-climkern7.tif", overwrite=TRUE)

eng<-raster("./data/raster/pineng.topo-clim.mask.tif")
engg<-focal(eng, w=gf, pad=TRUE, padValue=0, na.rm=TRUE)
engg<-mask(engg, islands.utm)
writeRaster(engg, "./data/raster/eng-climkern7.tif", overwrite=TRUE)

dis<-raster("./data/raster/pindis.topo-clim.mask.tif")
disg<-focal(dis, w=gf, pad=TRUE, padValue=0, na.rm=TRUE)
disg<-mask(disg, islands.utm)
writeRaster(disg, "./data/raster/dis-climkern7.tif", overwrite=TRUE)

## kernels--terrain ndvi
chi<-raster("./data/raster/pinchi.topo-ndvi.mask.tif")
gf<-focalWeight(chi, 1000,"Gauss")
chig<-focal(chi, w=gf, pad=TRUE, padValue=0, na.rm=TRUE)
chig<-mask(chig, islands.utm)
writeRaster(chig, "./data/raster/chi-ndvikern7.tif", overwrite=TRUE)

str<-raster("./data/raster/pinstr.topo-ndvi.mask.tif")
strg<-focal(str, w=gf, pad=TRUE, padValue=0, na.rm=TRUE)
strg<-mask(strg, islands.utm)
writeRaster(strg, "./data/raster/str-ndvikern7.tif", overwrite=TRUE)

ari<-raster("./data/raster/pinari.topo-ndvi.mask.tif")
arig<-focal(ari, w=gf, pad=TRUE, padValue=0, na.rm=TRUE)
arig<-mask(arig, islands.utm)
writeRaster(arig, "./data/raster/ari-ndvikern7.tif", overwrite=TRUE)

eng<-raster("./data/raster/pineng.topo-ndvi.mask.tif")
engg<-focal(eng, w=gf, pad=TRUE, padValue=0, na.rm=TRUE)
engg<-mask(engg, islands.utm)
writeRaster(engg, "./data/raster/eng-ndvikern7.tif", overwrite=TRUE)

dis<-raster("./data/raster/pindis.topo-ndvi.mask.tif")
disg<-focal(dis, w=gf, pad=TRUE, padValue=0, na.rm=TRUE)
disg<-mask(disg, islands.utm)
writeRaster(disg, "./data/raster/dis-ndvikern7.tif", overwrite=TRUE)


