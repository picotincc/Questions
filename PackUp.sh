#!/bin/sh

echo "start"

cat ./Unsolved.md > README.md
echo "" >> README.md

for file in ./front-end-interviews/*
do
  if test -f $file
  then
    markdown-toc -i $file
    cat $file >> README.md
    echo "" >> README.md
  fi
done

echo "finished"
