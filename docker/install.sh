#!/bin/bash

# Install PyTorch
pip3 install torch==1.9.0+cu111 torchvision==0.10.0+cu111 torchaudio==0.9.0 -f https://download.pytorch.org/whl/torch_stable.html

# Install MMDetection3D
pip3 install openmim
mim install mmcv-full==1.6.0
mim install mmdet==2.28.2
mim install mmsegmentation==0.30.0
apt-get update && apt-get install -y git
cd /tmp
git clone https://github.com/open-mmlab/mmdetection3d.git
cd /tmp/mmdetection3d
git checkout c9541b0
pip3 install -e .

# Install BEVDepth
cd /BEVDepth
pip3 install -r requirements.txt
python3 setup.py develop
mkdir data
ln -s /nuScenes /BEVDepth/data/
python3 scripts/gen_info.py
pip3 install "numpy<1.24.0"

# Example for training (execute under /BEVDepth).
# python3 bevdepth/exps/nuscenes/MatrixVT/matrixvt_bev_depth_lss_r50_256x704_128x128_24e_ema.py --amp_backend native -b 8 --gpus 1
# b is batch size, gpus is the number of GPUs.
