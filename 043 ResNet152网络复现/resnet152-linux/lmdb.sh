#!/usr/bin/env sh
# Create the face_48 lmdb inputs
# N.B. set the path to the face_48 train + val data dirs

EXAMPLE=/home/sun/resnet152    #lmdb生成后存放目录
DATA=/home/sun/resnet152          #train.txt、val.txt存放目录
TOOLS=/home/sun/caffe/build/tools #caffe安装目录

TRAIN_DATA_ROOT=/home/sun/resnet152/train/
VAL_DATA_ROOT=/home/sun/resnet152/val/

# Set RESIZE=true to resize the images to 224 x 224. Leave as false if images have
# already been resized using another tool.
RESIZE=true
if $RESIZE; then
  RESIZE_HEIGHT=224   #resize图片大小
  RESIZE_WIDTH=224
else
  RESIZE_HEIGHT=0
  RESIZE_WIDTH=0
fi

if [ ! -d "$TRAIN_DATA_ROOT" ]; then
  echo "Error: TRAIN_DATA_ROOT is not a path to a directory: $TRAIN_DATA_ROOT"
  echo "Set the TRAIN_DATA_ROOT variable in create_face_48.sh to the path" \
       "where the face_48 training data is stored."
  exit 1
fi

if [ ! -d "$VAL_DATA_ROOT" ]; then
  echo "Error: VAL_DATA_ROOT is not a path to a directory: $VAL_DATA_ROOT"
  echo "Set the VAL_DATA_ROOT variable in create_face_48.sh to the path" \
       "where the face_48 validation data is stored."
  exit 1
fi

echo "Creating train lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --shuffle \
    $TRAIN_DATA_ROOT \
    $DATA/train.txt \
    $EXAMPLE/train_lmdb

echo "Creating val lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --shuffle \
    $VAL_DATA_ROOT \
    $DATA/val.txt \
    $EXAMPLE/val_lmdb

echo "Done."
Status API Training Shop Blog About

