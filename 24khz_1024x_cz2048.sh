#!/bin/bash

# Activate the Python environment
source ~/myenvs/p31_dac/bin/activate

export CUDA_VISIBLE_DEVICES=0

config_file=/home/ramon/sesame/tts/descript-audio-codec/conf/exp_sesame/24khz_1024x_cz2048.yml

# Extract the base name of the config file
config_name=$(basename $config_file)

# Prepare the save path directory based on the config name
save_path="exp/$(echo $config_name | sed 's/.yml//')"

# Run the training script in the background
python scripts/train.py --args.load $config_file --save_path $save_path

