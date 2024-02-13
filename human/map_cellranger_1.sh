#!/bin/bash
#SBATCH --time=1-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --cpus-per-task=1
#SBATCH --partition=cpu
#SBATCH --mem=80G
#SBATCH --output=slurm-sc_%j.out

ml Anaconda3/2019.07
ml foss
ml SRA-Toolkit

source activate /project/single_cell/env1

cd /project/single_cell/notoroids/

export PATH=/project/single_cell/cellranger-4.0.0:$PATH

TRANSCRIP=/project/10x_transcriptomes/refdata-cellranger-GRCh38-3.0.0
FQ_PATH_1=/project/fastq
FQ_PATH_2=/project/fastq

cellranger count \
  --id="S1_D3_18h" \
  --transcriptome=${TRANSCRIP} \
  --fastqs=${FQ_PATH_1} \
  --sample="RIT735A18" \
  --jobmode=local

echo "Done!"


