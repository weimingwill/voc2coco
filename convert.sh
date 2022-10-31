#!/bin/bash

grep -ERoh '<name>(.*)</name>' VOCdevkit_train/VOC2012/Annotations | sort | uniq | sed 's/<name>//g' | sed 's/<\/name>//g' > labels.txt

python voc2coco.py \
    --ann_dir VOCdevkit_train/VOC2012/Annotations \
    --ann_ids VOCdevkit_train/VOC2012/ImageSets/Main/val.txt \
    --labels labels.txt \
    --output voc_val.json \
    --ext xml


python voc2coco.py \
    --ann_dir VOCdevkit_train/VOC2012/Annotations \
    --ann_ids VOCdevkit_train/VOC2012/ImageSets/Main/train.txt \
    --labels labels.txt \
    --output voc_train.json \
    --ext xml
