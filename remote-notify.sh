#!/bin/bash
file=/home/xiaolifan/Work/RemoteNotify
qq_time=0
email_time=0
occur_time=0
interval=0
inotifywait -mq --format '%f' -e access $file | while read event
do
occur_time=$(date +%s)

echo -e ${event}

[ "${event}" = "qq.wav" ] && interval_time=$(( $occur_time - $qq_time ))
[ "${event}" = "email.wav" ] && interval_time=$(( $occur_time - $email_time ))

[ "${event}" = "qq.wav" ] && [ $interval_time -gt 10 ] && echo $interval_time && echo -e "\n\n" && qq_time=$occur_time && notify-send -i /home/xiaolifan/Work/RemoteNotify/qq.png  主银 你有新的QQ消息哦～～
[ "${event}" = "email.wav" ] && [ $interval_time -gt 10 ] && echo $interval_time && echo -e "\n\n" && email_time=$occur_time && notify-send -i /home/xiaolifan/Work/RemoteNotify/email.png  主银 你有新的电子邮件哦～～

done
