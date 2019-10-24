#!/bin/bash
sleep 5
/usr/local/hadoop/current/bin/hdfs --daemon start datanode  && echo OK datanode > /tmp/datanode.txt
/usr/local/hadoop/current/bin/yarn --daemon start nodemanager && echo OK nodemanager > /tmp/nodemanager.txt
while true ; do sleep 1000 ; done








