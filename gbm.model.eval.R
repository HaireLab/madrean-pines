##----------------------------------------------------------------
## 
## gbm.model.eval.R
## 
## 
## Purpose: Output ROC plots for manuscript appendix
##
## Author: S. Haire, @HaireLab 
## 
##
## Date: 3 November 2020
##
##--------------------------------------------------------------
##
## Notes:
## Saved gbm outputs are used to generate plots here: terrain-bioclimatic
## and terrain-ndvi models. 
## 
##---------------------------------------------------------------
## 
library(gbm)
library(dismo)
library(ROCR)
library(pROC)

## need these params
## $cv.statistics$discrimination.mean
## $n.trees

sppnames=c("P. strobiformis", "P. arizonica", "P. discolor", "P. engelmannii", "P. chihuahuana")

## terrain-bioclimatic models
png("./plots/rocclimmods.png")
par(mfrow=c(3,3))
## 
# strobiformis
pred1<-predict(clim.str, n.trees=clim.str$n.trees)
y1<-clim.str$data$y
pred2<-prediction(pred1, y1)
perf1<-performance(pred2, "tpr", "fpr")
plot(perf1, main=paste(sppnames[1], "\nAUC=", clim.str$cv.statistics$discrimination.mean), lwd=2)
abline(a=0, b=1, lty=2, col="blue", lwd=2)

# arizonica
pred1<-predict(clim.ari, n.trees=clim.ari$n.trees)
y1<-clim.ari$data$y
pred2<-prediction(pred1, y1)
perf1<-performance(pred2, "tpr", "fpr")
plot(perf1, main=paste(sppnames[2], "\nAUC=", clim.ari$cv.statistics$discrimination.mean), lwd=2)
abline(a=0, b=1, lty=2, col="blue", lwd=2)

# discolor
pred1<-predict(clim.dis, n.trees=clim.dis$n.trees)
y1<-clim.dis$data$y
pred2<-prediction(pred1, y1)
perf1<-performance(pred2, "tpr", "fpr")
plot(perf1, main=paste(sppnames[3], "\nAUC=", clim.dis$cv.statistics$discrimination.mean), lwd=2)
abline(a=0, b=1, lty=2, col="blue", lwd=2)

# engelmannii
pred1<-predict(clim.eng, n.trees=clim.eng$n.trees)
y1<-clim.eng$data$y
pred2<-prediction(pred1, y1)
perf1<-performance(pred2, "tpr", "fpr")
plot(perf1, main=paste(sppnames[4], "\nAUC=", clim.eng$cv.statistics$discrimination.mean), lwd=2)
abline(a=0, b=1, lty=2, col="blue", lwd=2)

# chichuahuana
pred1<-predict(clim.chi, n.trees=clim.chi$n.trees)
y1<-clim.chi$data$y
pred2<-prediction(pred1, y1)
perf1<-performance(pred2, "tpr", "fpr")
plot(perf1, main=paste(sppnames[5], "\nAUC=", clim.chi$cv.statistics$discrimination.mean), lwd=2)
abline(a=0, b=1, lty=2, col="blue", lwd=2)
dev.off()

## terrain-ndvi models
png("./plots/rocndvimods.png")
par(mfrow=c(3,3))

#strobiformis
pred1<-predict(combo2.str, n.trees=combo2.str$n.trees)
y1<-combo2.str$data$y
pred2<-prediction(pred1, y1)
perf1<-performance(pred2, "tpr", "fpr")
plot(perf1, main=paste(sppnames[1], "\nAUC=", combo2.str$cv.statistics$discrimination.mean), lwd=2)
abline(a=0, b=1, lty=2, col="blue", lwd=2)

#arizonica
pred1<-predict(combo2.ari, n.trees=combo2.ari$n.trees)
y1<-combo2.ari$data$y
pred2<-prediction(pred1, y1)
perf1<-performance(pred2, "tpr", "fpr")
plot(perf1, main=paste(sppnames[2], "\nAUC=", combo2.ari$cv.statistics$discrimination.mean), lwd=2)
abline(a=0, b=1, lty=2, col="blue", lwd=2)

#discolor
pred1<-predict(combo2.dis, n.trees=combo2.dis$n.trees)
y1<-combo2.dis$data$y
pred2<-prediction(pred1, y1)
perf1<-performance(pred2, "tpr", "fpr")
plot(perf1, main=paste(sppnames[3], "\nAUC=", combo2.dis$cv.statistics$discrimination.mean), lwd=2)
abline(a=0, b=1, lty=2, col="blue", lwd=2)

#engelmannii
pred1<-predict(combo2.eng, n.trees=combo2.eng$n.trees)
y1<-combo2.eng$data$y
pred2<-prediction(pred1, y1)
perf1<-performance(pred2, "tpr", "fpr")
plot(perf1, main=paste(sppnames[4], "\nAUC=", combo2.eng$cv.statistics$discrimination.mean), lwd=2)
abline(a=0, b=1, lty=2, col="blue", lwd=2)

#chihuahuana
pred1<-predict(combo2.chi, n.trees=combo2.chi$n.trees)
y1<-combo2.chi$data$y
pred2<-prediction(pred1, y1)
perf1<-performance(pred2, "tpr", "fpr")
plot(perf1, main=paste(sppnames[5], "\nAUC=", combo2.chi$cv.statistics$discrimination.mean), lwd=2)
abline(a=0, b=1, lty=2, col="blue", lwd=2)

dev.off()


