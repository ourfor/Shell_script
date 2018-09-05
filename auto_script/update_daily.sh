#!/bin/bash
#update date daily at 6:00
#author:ourfor date:20180717

DATE=`date "+%Y年%m月%d日 星期%a %p%l:%M %Z"`
Weather=$(curl wttr.in/?0?q?T | awk '/°(C|F)/ {printf $(NF-1) $(NF) " ("a")"} /,/ {a=$0}')
time=$(date +%Y%m%d).png

echo -e "* $DATE   天气: $Weather" | tee -a /root/Shell_script/README.md

date +%Y年\ %m月\ %d日 >> /root/Shell_script/weather.md

curl -L 'wttr.in/Changsha_lang=zh.png' -o /root/Shell_script/PNG/$time
 
echo -e "\n![](PNG/$time)\n" >> /root/Shell_script/weather.md

cd /root/Shell_script
git add .
git commit -m "update Today's log:)"
git push -f origin master
