#!/bin/bash

# Activate the Python environment
source ~/myenvs/p31_dac/bin/activate

# Directory containing the configuration files
config_dir="conf/exp_sesame"

# List of configuration files to exclude from the run
exclude_files=("44khz_1536x.yml")

# Initialize GPU index
gpu_index=1

# Loop through each YAML file in the configuration directory
for config_file in $config_dir/*.yml; do
	# Extract the base name of the config file
       	config_name=$(basename $config_file)
	# Skip files in the exclude list
	if [[ " ${exclude_files[@]} " =~ " $config_name " ]]; then
		continue
	fi

	# Set the CUDA device to the current GPU index
	export CUDA_VISIBLE_DEVICES=$gpu_index

	# Prepare the save path directory based on the config name
	save_path="exp/$(echo $config_name | sed 's/.yml//')"

	# Run the training script in the background
	python scripts/train.py --args.load $config_file --save_path $save_path &

	# Increment the GPU index for the next run
	gpu_index=$((gpu_index + 1))

done
