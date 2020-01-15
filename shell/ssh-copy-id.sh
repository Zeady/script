#!/bin/bash
#
#********************************************************************
#Author:      hechunping
#QQ:        ×××
#Date:       2019-11-07
#FileName:     ssh-sshpass.sh
#URL:        hexiaoshuai.blog.51cto.com
#Description:    The test script
#Copyright (C):   2019 All rights reserved
#********************************************************************
NET=172.20.200
USER=(root hechunping)
PASSWORD=123456
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa &> /dev/null
sed -i '/StrictHostKeyChecking/c StrictHostKeyChecking no' /etc/ssh/ssh_config
rpm -q sshpass &> /dev/null || yum -y install sshpass &> /dev/null
for i in {1..254} ; do
{
  sshpass -p $PASSWORD ssh-copy-id -i ${USER[0]}@${NET}.${i} &> /dev/null
}&
done
wait
