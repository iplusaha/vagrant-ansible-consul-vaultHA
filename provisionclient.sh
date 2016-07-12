#!/bin/bash

# Step 1 - Get the necessary utilities and install them.
sudo -i
apt-get update
apt-get install -y unzip
apt-get install -y ansible
apt-get install -y curl
apt-get install -y jq
cd /vagrant
cp -R consulclient /home/vagrant 


cd /etc/ansible 

cat << EOF > hosts
localhost
EOF

sleep 5 

cd /home/vagrant/consulclient
ansible-playbook install.yml -v
ansible-playbook server.yml -v