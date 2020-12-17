#!/bin/bash

set -e

working_dir="/NABIC/HOME/yedomon1/genomeassemblyfungiMR004/05.Assembly_quality_metrics"

cd $working_dir

echo "Activate the busco environment"

source activate busco_env

echo "BUSCO analysis for MR4003" 

busco \
  -i MR4003_pilon_4_mito_free.fasta \
  -o busco_MR4003_hypocreales \
  -l hypocreales_odb10 \
  -m geno 


echo " BUSCO analysis for FOL4287"

busco \
  -i FOL4287.fasta \
  -o busco_FOL4287_hypocreales \
  -l hypocreales_odb10 \
  -m geno 

#desactivate busco environment
source deactivate busco_env
