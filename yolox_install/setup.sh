#!/bin/bash
cd `dirname $0`
echo Pip install dependent lib of onnx-simplifier. Fixed onnxoptimizer version to 0.2.7
pip install onnx 
pip install onnxoptimizer==0.2.7 
pip install onnxruntime >= 1.6.0 
pip install protobuf >= 3.7.0
echo Pip install onnx-simplifier
pip install --no-deps onnx-simplifier==0.3.5

echo Pip install dependent lib of yolox
pip install opencv_python 
pip install loguru 
pip install scikit-image 
pip install tqdm 
pip install Pillow 
pip install thop 
pip install ninja 
pip install tabulate 
pip install tensorboard 
pip install pycocotools>=2.0.2 
pip install onnx==1.8.1 
pip install onnxruntime==1.8.0
echo Pip install yolox
pip install --no-deps yolox