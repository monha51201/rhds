# rhds

# execute run-all.sh entirely within a container
source config.env
mkdir -p ${datadir} ${resultsdir} ${docsdir}
apptainer run \
    --fakeroot \
    -B $(pwd) \
    -B ${datadir} -B ${resultsdir} -B ${docsdir} \
    rhds-tcga-r.sif \
    bash run-all.sh
