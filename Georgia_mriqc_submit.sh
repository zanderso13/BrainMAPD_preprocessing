#!/usr/bin/bash
#
#SBATCH -A p30954
#SBATCH -p normal
#SBATCH -t 24:00:00
#SBATCH --mem=64G
#SBATCH -J mriqc

module purge
module load singularity/latest
echo "modules loaded"
cd /projects/b1108

singularity run --cleanenv -B /projects/b1108:/projects/b1108/ /projects/b1108/software/singularity_images/mriqc-latest.simg -v /projects/b1108/data/Georgia/transitions -v /projects/b1108/projects/georgia/ participant --participant-label ${1}
# change above to --clean-workdir so that the work directory is cleared and you save space