export CUDA_VISIBLE_DEVICES=0,1,2
export OMP_NUM_THREADS=8
export NCCL_DEBUG=INFO


source ~/myenvs/p31_dac/bin/activate
torchrun --nproc_per_node gpu scripts/train.py --args.load conf/ablations/baseline_ramons.yml --save_path runs/baseline_mgpu_5/
