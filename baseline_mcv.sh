export CUDA_VISIBLE_DEVICES=0

source ~/myenvs/p31_dac/bin/activate
python scripts/train.py --args.load conf/ablations/baseline_ramons.yml --save_path exp/baseline_ramons1/
