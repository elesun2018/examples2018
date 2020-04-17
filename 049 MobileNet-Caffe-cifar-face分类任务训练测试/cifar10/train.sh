#!/bin/sh

/home/sun/caffe/build/tools/caffe train -solver="solver.prototxt" \
-weights="model/pretrain_mobilenetv1_ImageNet.caffemodel" \
#-gpu 0 
