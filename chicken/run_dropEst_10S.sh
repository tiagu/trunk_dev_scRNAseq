#!/bin/bash
#SBATCH --time=2-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --cpus-per-task=1
#SBATCH --partition=cpu
#SBATCH --mem=100G
#SBATCH --output=slurm-sc_dropEst_test_%j.out


ml Anaconda3/2019.07
ml foss
ml SAMtools/1.9-intel-2018b

source activate /project/single_cell/env1

cd /project/single_cell/


dropest -f -V -w \
-L eiEIBA \
-o /project/single_cell/chick/chick01_10S_dropest \
-g /project/ref/10X/ggallus/Ggallus_g6a_101_plus/genes/genes.gtf \
-c /project/single_cell/dropEst/configs/10x_tiago.xml \
/project/single_cell/chick/chick01_10S_plus/outs/possorted_genome_bam.bam


# if you already used CellRanger, you can just skip the merge step (don't use -m option)


echo "Done!"



