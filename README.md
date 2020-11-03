# madrean-pines

### Data and code in this repository were used to conduct analyses for the following paper:
Sandra L. Haire, Miguel L. Villarreal, Citlali Cortés Montaño, Aaron D. Flesch, José M. Iniguez, José Raúl Romo León, 
and Jamie S. Sanderlin. (in review). Identifying climate refugia for Pinus spp. in topographic and bioclimatic environments of the Madrean Sky Islands of Mexico and the United States. < journal, volume, issue: pages, DOI >

Note: Spatial data outputs are available. < USGS Data Release url >

### Repository Contents

#### R scripts, models
gbm.terrain.R--terrain only models, 5 species

gbm.topo.climate.R--terrain-bioclimatic models, 5 species

gbm.topo.ndvi.R--terrain-ndvi models, 5 species

gbm.model.eval.R--ROC plots for appendix


#### R scripts, partial plots
gg.partial.plots-pinari.R--save the partial plots for each species (example script for P. arizonica)

assemble.pdp.R--put the partial plots together for the ms figure

#### R scripts, spatial predictions and kernels
predict.topo-rs.R--use the spatial layers to output predicted probability for each species (example script using terrain and NDVI layers) 

sdm.kernels.R--apply a Gaussian kernel to the predicted probability maps to identify a gradient of high, medium and low probability. Use the output in manuscript figures.

#### Data

COMING SOON!!
