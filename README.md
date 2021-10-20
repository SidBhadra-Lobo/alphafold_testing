Testing results from DeepMind's protein folding algorithm, Alphafold https://github.com/deepmind/alphafold

This repository is a tutorial for running Alphafold on Rutgers HPC cluster, Amarel.

The directory structure is setup to work with the SLURM script `alphafold_gpu.sh`.

The current predictions tested represent folding and protein-protein docking for a homodimer of the SARS-CoV-2 Nucleocapsid dimerization domain (pdb id 6WZO, https://www.rcsb.org/structure/6wzo). 

These predictions are compared to the single reference structure in `/pdb_structures/6wzo.cif.gz` and are parameterized by multiple *.fasta file sequences for both folding and docking predictions:

- raw 6WZO fasta, monomer folding prediction
- trimmed 6WZO fasta, monomer folding
- no linker fasta, dimer folding + docking
- trimmed fasta with 10 Alanine linker, dimer folding + docking
- trimmed fasta with 50 Alanine linker, dimer folding + docking
