#! /usr/bin/bash

Folder=$1
num=0
for i in $(ls $Folder); do
  mv $Folder/$i $Folder/Datei$num
  ((num++))
done
