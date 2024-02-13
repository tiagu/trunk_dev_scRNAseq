#!/bin/bash
#SBATCH --time=1-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --cpus-per-task=1
#SBATCH --partition=cpu
#SBATCH --mem=150G
#SBATCH --output=slurm-sc_%j.out


ml Anaconda3/2019.07
ml foss
ml SRA-Toolkit

source activate /project/single_cell/env1


cd /project/single_cell/chick


export PATH=/project/cellranger-4.0.0:$PATH


TRANSCRIP=/project/ref/10X/ggallus/Ggallus_g6a_101_plus
FQ_PATH_1=/project/fastq
FQ_PATH_2=/project/fastq


cellranger count \
  --id="chick01_10S" \
  --transcriptome=${TRANSCRIP} \
  --fastqs=${FQ_PATH_1},${FQ_PATH_2} \
  --sample="RIT735A4" \
  --jobmode=local


echo "Done!"



