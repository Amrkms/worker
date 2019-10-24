#!/bin/bash
yum install -y wget 
yum install -y tar 
yum install -y java-1.8.0-openjdk.x86_64 
cd /tmp 
wget https://archive.apache.org/dist/hadoop/common/hadoop-3.1.2/hadoop-3.1.2.tar.gz 
cp hadoop-3.1.2.tar.gz /opt/ && rm /tmp/hadoop-3.1.2.tar.gz 

cd /opt/ && \
tar xvzf hadoop-3.1.2.tar.gz && rm /opt/hadoop-3.1.2.tar.gz 
cd /usr/local/ 
mkdir hadoop 
ln -s /opt/hadoop-3.1.2/ /usr/local/hadoop/current 

groupadd hadoop 
useradd -g hadoop hadoop 
useradd -g hadoop yarn 
useradd -g hadoop hdfs 

cd /opt
mkdir mount1 
mkdir mount2 
cd /opt/mount1 
mkdir datanode-dir 
cd /opt/mount2 
mkdir datanode-dir 
chown hdfs /opt/mount1/datanode-dir 
chown hdfs /opt/mount2/datanode-dir 
chgrp hadoop /opt/mount1/datanode-dir 
chgrp hadoop /opt/mount2/datanode-dir 

mkdir /opt/mount1/nodemanager-local-dir
mkdir /opt/mount2/nodemanager-local-dir
mkdir /opt/mount1/nodemanager-log-dir
mkdir /opt/mount2/nodemanager-log-dir

chown yarn /opt/mount1/nodemanager-local-dir
chown yarn /opt/mount2/nodemanager-local-dir
chown yarn /opt/mount1/nodemanager-log-dir
chown yarn /opt/mount2/nodemanager-log-dir

chgrp hadoop /opt/mount1/nodemanager-local-dir
chgrp hadoop /opt/mount2/nodemanager-local-dir
chgrp hadoop /opt/mount1/nodemanager-log-dir
chgrp hadoop /opt/mount2/nodemanager-log-dir



cp /tmp/hadoop-env.sh /usr/local/hadoop/current/etc/hadoop/
cp /tmp/core-site.xml /usr/local/hadoop/current/etc/hadoop/
cp /tmp/hdfs-site.xml /usr/local/hadoop/current/etc/hadoop/
cp /tmp/yarn-site.xml /usr/local/hadoop/current/etc/hadoop/
cp /tmp/hh.sh /etc/profile.d/
echo /tmp/addhosts >> /etc/hosts

mkdir /usr/local/hadoop/current/logs && chmod 777 /usr/local/hadoop/current/logs








