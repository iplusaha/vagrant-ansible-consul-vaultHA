#!/bin/bash
consul members -rpc-addr=$(ifconfig eth1 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'):8400 >> /var/lib/vault/member 

awk -F " " '{print $1,$2}' /var/lib/vault/member | cut -d' ' -f2,3 | cut -f1 -d":" >> /var/lib/vault/server.txt
