#!/bin/bash
# ref.https://qiita.com/hiro9/items/ff60ce9dae79124062e6

while read line
do
  # echo `code --uninstall-extension $line`
  echo `code --install-extension $line`
done < extentions-list.txt