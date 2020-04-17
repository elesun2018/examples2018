#!/bin/sh

/home/sun/caffe/build/examples/cpp_classification/classification.bin \
/home/sun/resnet152/test/deploy.prototxt \
/home/sun/resnet152/model/sun_resnet_iter_4300.caffemodel \
/home/sun/resnet152/mean.binaryproto \
/home/sun/resnet152/test/class_name.txt /home/sun/resnet152/test/test2.JPEG
