


source ~/myenvs/p31_dac/bin/activate

export CUDA_VISIBLE_DEVICES=2


experiment_name=24khz_1536x_nc28

for experiment_name in   24khz_cz4096_nc11 24khz_cz4096_nc12
do

python3 -m dac encode /ephemeral_volume/ramon/data/proc/val/dan_24khz --weights_path /home/ramon/sesame/tts/descript-audio-codec/exp/${experiment_name}/best/dac/weights.pth --output ./test_results/output_codes/${experiment_name} --model_type '24khz'

python3 -m dac decode  ./test_results/output_codes/${experiment_name} --weights_path /home/ramon/sesame/tts/descript-audio-codec/exp/${experiment_name}/best/dac/weights.pth --output ./test_results/reconstructed_inputs/${experiment_name} --model_type '24khz'

done

#python ./scripts/evaluate.py --input /ephemeral_volume/ramon/data/proc/val/speech --output ./test_results/reconstructed_inputs/${experiment_name}


#python3 -m dac encode /ephemeral_volume/ramon/data/proc/val/ --weights_path /home/ramon/sesame/tts/descript-audio-codec/exp/${experiment_name}/weights.pth --output ./test_results/output_codes/${experiment_name}

#python3 -m dac decode  ./test_results/output_codes/${experiment_name} --weights_path /home/ramon/sesame/tts/descript-audio-codec/exp/${experiment_name}/weights.pth --output ./test_results/reconstructed_inputs/${experiment_name}

#python ./scripts/evaluate.py --input /ephemeral_volume/ramon/data/proc/val/ --output ./test_results/reconstructed_inputs/${experiment_name}


