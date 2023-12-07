#! /usr/bin/bash

Folder=$1
num=0
if ls $Folder | grep -q 'Datei'; then
  for i in $(ls $Folder | grep '.*Datei'); do
    if ((num <= $(echo $i | grep -o '[1234567890]*'))); then
      echo $(echo $i|grep -o '[1234567890]*')
      num=$(echo $i|grep -o '[1234567890]*')
      ((num++))
    fi
  done
fi

for i in $(ls $Folder); do
  mv $Folder/$i $Folder/$num'Datei'
  ((num++))
done  
