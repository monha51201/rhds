#!/bin/bash

# get project variables
source scripts/config.env

# create necessary directories if they don;t exist
mkdir -p $resultsdir
mkdir -p $docsdir
mkdir -p $datadir

# run all scripts
cd scripts
bash download-data.sh $datadir $resultsdir
Rscript download-pan-cancer-clinical.r $datadir $resultsdir
Rscript extract-data.r $datadir $resultsdir
Rscript clean-clinical.r $datadir $resultsdir
Rscript predict-proteins.r $datadir $resultsdir
Rscript combine.r $datadir $resultsdir
Rscript analysis.r $datadir $resultsdir
