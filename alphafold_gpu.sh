#!/bin/bash

# Original author: Paul Guillermo Arias, Ph.D. and Vlad Kholodovych, Ph.D.
#                  Senior Scientists, Office of Advanced Research Computing
#                  Rutgers, the State University of New Jersey

#SBATCH --partition=gpu              # Partition (job queue)
#SBATCH --requeue                    # Return job to the queue if preempted
#SBATCH --job-name=af_linker         # Assign an short name to your job
#SBATCH --nodes=1                    # Number of nodes you require
#SBATCH --ntasks=8                   # Total # of tasks across all nodes
#SBATCH --cpus-per-task=1            # Cores per task (>1 if multithread tasks)
#SBATCH --gres=gpu:1                 # Number of GPUs
#SBATCH --mem=0                      # Real memory (RAM) required (MB), 0 is the whole-node memory
#SBATCH --time=24:00:00              # Total run time limit (HH:MM:SS)
#SBATCH --output=slurm.%N.%j.out     # STDOUT output file
#SBATCH --error=slurm.%N.%j.err      # STDERR output file (optional)
#SBATCH --export=ALL                 # Export you current env to the job env

module purge
module use /projects/community/modulefiles
module load singularity/3.6.4
module load alphafold

## change to your amarel user ID
user=sb1638

singularity run -B $ALPHAFOLD_DATA_PATH:/data -B .:/etc --pwd /app/alphafold --nv $CONTAINERDIR/alphafoldamarel_latest.sif \
    --data_dir=/data \
    --uniref90_database_path=/data/uniref90/uniref90.fasta \
    --uniclust30_database_path=/data/uniclust30/uniclust30_2018_08/uniclust30_2018_08 \
    --mgnify_database_path=/data/mgnify/mgy_clusters_2018_12.fa \
    --bfd_database_path=/data/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt  \
    --pdb70_database_path=/data/pdb70/pdb70 \
    --template_mmcif_dir=/data/pdb_mmcif/mmcif_files/ \
    --obsolete_pdbs_path=/data/pdb_mmcif/obsolete.dat \
    --preset=full_dbs \
    --fasta_paths=/home/$user/alphafold_testing/sequences/Gly20_7CAH_trimer.fasta \
    --output_dir=/home/$user/alphafold_testing/output_dir \
    --model_names=model_1 \
    --max_template_date=2020-05-14