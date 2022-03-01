# madrean-pines

## Data and code in this repository were used to conduct the analysis for the following paper:
Sandra L. Haire, Miguel L. Villarreal, Citlali Cortés Montaño, Aaron D. Flesch, Jose M. Iniguez, Jose Raul Romo-Leon, 
and Jamie S. Sanderlin. (2022). Climate refugia for Pinus spp. in topographic and bioclimatic environments of the Madrean Sky Islands of México and the United States. Plant Ecology (accepted).

### Repository Contents 

### Data

Spatial data outputs are available. 

Haire, S.L and Villarreal, M.L., 2022, Pine species distribution maps of the Madrean Sky Islands, United States and México: U.S. Geological Survey data release, https://doi.org/10.5066/P9CLBAF7

and on Data Basin: https://databasin.org/galleries/b27fbb9c42b849fe9029827095449d07/

Tabular data used to run the model scripts (in folder: data/tab)

#### Terrain + remote sensing predictors

PinEng.us-mx-terrain.rs.csv

PinChi.us-mx-terrain.rs.csv

PinStr.us-mx-terrain.rs.csv

PinAri.us-mx-terrain.rs.csv

PinDis.us-mx-terrain.rs.csv

#### Terrain + bioclimatic predictors

PinEng.us-mx-terrain.bio.csv

PinChi.us-mx-terrain.bio.csv

PinStr.us-mx-terrain.bio.csv

PinAri.us-mx-terrain.bio.csv

PinDis.us-mx-terrain.bio.csv

#### R scripts: models

gbm.terrain.R--terrain only models, 5 species

gbm.topo.climate.R--terrain-bioclimatic models, 5 species

gbm.topo.ndvi.R--terrain-ndvi models, 5 species

gbm.model.eval.R--ROC plots for appendix


#### R scripts: partial plots
gg.partial.plots-pinari.R--save the partial plots for each species (example script for P. arizonica)

assemble.pdp.R--put the partial plots together for the ms figure

#### R scripts: spatial predictions and kernels
predict.topo-rs.R--use the spatial layers to output predicted probability for each species (example script using terrain and NDVI layers) 

sdm.kernels.R--apply a Gaussian kernel to the predicted probability maps to identify a gradient of high, medium and low probability. Use the output in manuscript figures.


