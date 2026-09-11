#!/bin/bash

# Submit this script with: sbatch <this-filename>

#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1

## /SBATCH -p general # partition (queue)
#SBATCH -J "freq"   # job name
#SBATCH -o freq-slurm.%N.%j.out # STDOUT
#SBATCH -e freq-slurm.%N.%j.err # STDERR

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE
python -u -c "import PyHipp as pyh; \
import time; \
pyh.FreqSpectrum(saveLevel=1); \
pyh.FreqSpectrum(loadHighPass=True, pointsPerWindow=3000, saveLevel=1); \
print(time.localtime());"
