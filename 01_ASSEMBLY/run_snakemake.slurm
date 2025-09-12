#!/bin/bash

#SBATCH --job-name=snakemake
#SBATCH --output=logs/slurm/%x_%j.out
#SBATCH --error=logs/slurm/%x_%j.err
#SBATCH --nodes=1
#SBATCH --ntasks=1

# Go to working directory
cd $SLURM_SUBMIT_DIR

# Run Snakemake pipeline
snakemake --use-conda \
          --jobs 3 \
          --latency-wait 60 \
          --rerun-incomplete \
          --cluster "sbatch --job-name={rule} \
                            --output=logs/slurm/{rule}_%j.out \
                            --error=logs/slurm/{rule}_%j.err \
                            --cpus-per-task={threads} \
                            --mem={resources.mem}G"