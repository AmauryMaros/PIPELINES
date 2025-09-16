# Metagenomes Assembly Pipeline

This pipeline performs assembly of vaginal metagenomes using `metaSPAdes` and is managed with Snakemake (version 7.26.0). It supports both local execution and SLURM-based HPC clusters.

---

## Requirements

- Pre-processed metagenome reads
- `samples.txt` file with metagenome IDs (see example file)
- [Snakemake](https://snakemake.readthedocs.io/en/stable/) installed
- (Optional) Access to a SLURM-based HPC cluster for large datasets

---

## Configuration

1. Update the `config.yaml` file with your paths, resources, and directories according to your setup.
2. Make sure your sample list file (`samples.txt`) is correct and located as specified in the config.

Example `config.yaml`:

```yaml
# Specify sample list path
samples: "samples.txt"

# Specify metagenomes PE reads directory: MG_ID.R1.fq.gz, MG_ID.R2.fq.gz, MG_ID.unpaired.fq.gz
datadir: "path/to/PE/reads"

# Specify tools ressources
metaspades_threads: 8
metaspades_memory: 250
cp_threads: 4
cp_mem: 2

# Directory architecture (don't change)
assembly: "assembly"
contigs: "contigs"
graphs: "graphs"
stats: "stats"
logs: "logs"
slurm_logs: "logs/slurm"
```

## Running the pipeline

### Local execution

```bash
snakemake --cores <num_cores> -p
```

### Execution on SLURM
```bash
sbatch run_snakemake.slurm
```