#!/bin/bash
#SBATCH -t0

#source batch_jobs/_experiment_configuration.sh
. batch_jobs/_experiment_configuration.sh


echo "Host - $HOSTNAME"
echo "Commit - $(git rev-parse HEAD)"
nvidia-smi

#module load python/3.7
#virtualenv $SLURM_TMPDIR/env
#source $SLURM_TMPDIR/env/bin/activate
eval "$(conda shell.bash hook)"
conda activate pythia

# Install dependencies.
#cd $HOME/workspace/debias-eval
#python -m pip install -e .

# Run code.
python -u "$@" --persistent_dir ${persistent_dir}
