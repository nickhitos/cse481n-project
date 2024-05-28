# Reproduction Report: Understanding the Effect of Model Compression on Social Bias in Large Language Models
> Jessica Colleran, Nicolas Hitosis, and Aidan Jay

This is the official Repo for the 2024 CSE481N Reproduction Paper - "Reproduction Report: Understanding the Effect of Model Compression on Social Bias in Large Language Models".

We thank the [Understanding the Effect of Model Compression on Social Bias in Large Language Models](https://github.com/gsgoncalves/EMNLP2023_llm_compression_and_social_bias) authors for making their codebase available, as we use it as a starting point for our work.

Below you will find a short version of the original repo instructions to run the code for our experiments.

## Install
```bash
mkdir projects && cd projects
git clone https://github.com/nickhitos/cse481n-project.git
cd cse481n-project
python -m pip install -e .
```
## Running on single CPU/GPU
1. Modify the ``persistent_dir`` variable in ``./batch_jobs/_experiment_configuration.sh`` accordingly
2. Choose an experiment's script in ``batch_jobs``
3. Comment out the ``sbatch`` command and all its arguments down to before the ``python`` command
4. Add ``./`` before the ``python`` command
5. Run the script (e.g. the command ``./batch_jobs/crows_base.sh`` runs the experiments for base models on Crow-S)

Scripts for experiments that were not reproduced are not guaranteed to run and may require additional modifications. Refer to ``./batch_jobs/crows_base.sh`` as an example.

## Running on an HPC Cluster
We provide scripts for running all of the experiments presented in the paper on a SLURM cluster in `batch_jobs`.
If you plan to use these scripts, make sure you customize `python_job.sh` to run the jobs on your cluster.
In addition, you will also need to change both the output (`-o`) and error (`-e`) paths.

### Quickstart: How to develop in this codebase?
The high level structure of this codebase is as follows:
 - batch_jobs: contains the scripts to run the experiments on a SLURM cluster and cluster specific configs. (The bash scripts can easily be ran in a single python instance e.g. cli or IDE)
   - The _experiment_name_ folder contains "environment variables" that are called by the batch job scripts. You can register your new models here.
 - bias_bench: contains the code for the BiasBench experiments. (The code is mostly unchanged from the original repo)
   - You can register new models in the models.py file.
 - experiments: contains the code for the experiments presented in the paper.
   - Here crows.py, seat.py, stereoset.py were adapted to include the quantized and distil models.
 - export: contains the code to export the results to tables.
   - Please note you must run the stereoset_evaluation.py script before running the respective export scripts.

We recommend checking the original [BiasBench](https://github.com/McGill-NLP/bias-bench) for further references.

## Acknowledgements
This repository makes use of code from the following repositories:

* [BiasBench](https://github.com/McGill-NLP/bias-bench)
* [Towards Debiasing Sentence Representations](https://github.com/pliang279/sent_debias)
* [StereoSet: Measuring Stereotypical Bias in Pre-trained Language Models](https://github.com/moinnadeem/stereoset)
* [CrowS-Pairs: A Challenge Dataset for Measuring Social Biases in Masked Language Models](https://github.com/nyu-mll/crows-pairs)
* [On Measuring Social Biases in Sentence Encoders](https://github.com/w4ngatang/sent-bias)
* [Null It Out: Guarding Protected Attributes by Iterative Nullspace Projection](https://github.com/shauli-ravfogel/nullspace_projection)
* [Towards Understanding and Mitigating Social Biases in Language Models](https://github.com/pliang279/lm_bias)
* [Understanding the Effect of Model Compression on Social Bias in Large Language Models](https://github.com/gsgoncalves/EMNLP2023_llm_compression_and_social_bias)

We thank the authors for making their code publicly available.

## Citation
```
 @inproceedings{colleran-hitosis-jay-2024-understanding,
    title = "Reproduction Report: Understanding the Effect of Model Compression on Social Bias in Large Language Models",
    author = "Colleran, Jessica  and
      Hitosis, Nicolas and Jay, Aidan",
    month = jun,
    year = "2024",
}
```
