#!/bin/bash

# Submit this script with: sbatch <this-filename>

#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1   # sessioneye files are small

## /SBATCH -p general # partition (queue)
#SBATCH -J "rse"   # job name
#SBATCH -o rse-slurm.%N.%j.out # STDOUT
#SBATCH -e rse-slurm.%N.%j.err # STDERR

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE
python -u -c "import PyHipp as pyh; \
import time; \
import os; \
t0 = time.time(); \
print(time.localtime()); \
os.chdir('sessioneye'); \
pyh.RPLSplit(SkipLFP=False, SkipHighPass=False); \
print(time.localtime()); \
print(time.time()-t0);"
