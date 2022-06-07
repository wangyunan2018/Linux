#!/bin/bash

node_exporter_hosts=.

for i in $(cat $node_exporter_hosts/node_exporter.txt); do
    ssh root@$i "mkdir /usr/local/node_exporter"
    sleep 1
    scp node_exporter-0.18.1.linux-amd64.tar.gz root@$i:/usr/local/node_exporter/
    sleep 3
    ssh root@$i "cd /usr/local/node_exporter; tar -xzvf node_exporter-0.18.1.linux-amd64.tar.gz; mv node_exporter-0.18.1.linux-amd64 node_exporter"
    sleep 1
    scp node_exporter.service root@$i:/etc/systemd/system/
    ssh root@$i "systemctl daemon-reload; systemctl start node_exporter.service; systemctl enable node_exporter.service; sleep 3; systemctl status node_exporter.service"
done

# 使用scp命令前，请先保证各节点直接能ssh无密码访问,否则会提示输入密码。