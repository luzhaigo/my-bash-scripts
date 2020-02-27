#!/bin/bash

cd $1

if [[ $1 == '' ]]
then
  echo "should provide the directory path"
  exit 1
fi

IFS=$'\n'

for filename in $(ls -d *)
do
    unset IFS
    result=""
    for word in $filename
    do
      word=$(echo $word | sed -e 's/egghead-//' -e 's/-/ /g')
      first=$(echo ${word:0:1} | tr '[:lower:]' '[:upper:]')
      result+="${first}${word:1} "
    done
    result=$(sed 's/\\s*$//' <<< ${result})
    
    mv "${filename}/" "${result}"
done
