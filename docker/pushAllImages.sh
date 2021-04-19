#!/usr/bin/env bash
echo '===this command is used to push the tag iamge to private registry'
echo '===this command should be run in docker env, parm is images.txt==='
echo '===usage: downloadAllImages.sh images.txt==='
imagesFile=$1

cat $imagesFile | while read line;
do
  arr=(${line//\// })
  str='eyaweiw.cn:5000'
  for((i=1;i<${#arr[@]};i++))
  do
    str+=/"${arr[$i]}"
  done
  echo 'docker push '$str
  docker push $str
done
