#!/bin/bash

# Activate the Python environment
source ~/myenvs/p31_dac/bin/activate

export CUDA_VISIBLE_DEVICES=3

config_file=/home/ramon/sesame/tts/descript-audio-codec/conf/exp_sesame/test.yml

# Extract the base name of the config file
config_name=$(basename $config_file)

# Prepare the save path directory based on the config name
save_path="exp/test"

# Run the training script in the background
python scripts/train.py --args.load $config_file --save_path $save_path

