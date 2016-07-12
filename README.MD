## Overview ##

This repository contains files of provisioning consul clusters of 3 servers and a client by vagrant. Vagrant will provision four machines installed with ansible, then on server machines ansible playbook will perform installation of different services such as consul and vault(High availability mode). On client machine ansible will install a web server along with consul. 

Vault server will store secret/foo but it needs to be initialized, unsealed and authorized before writing any secret to it. Client machine will perform these task to authenticate with highly available vault running on consul servers. Once authentication process has been finished client machine will write secret that will store in vault. 

The webserver installed on consul client will deploy a webpage name "index.php", so the user can access to the page and login by providing username and password to revoke the secret stroed in vault servers. 

The whole process has been completely automatized using ansible. Once vagrant up all machines(4 in total, 3 consul servers and one consul client), the user can access the webpage from a browser running on consul client by going to the following URL "http://172.20.20.40/index.php". [only one username and password is set at the moment, so in username field type 'iplu' and password field as "963852" to retrieve the secret store in vault server.] 

## Prerequisites ##

You will need to have installed Vagrant and VirtualBox.

## Usage ##

Once you have downloaded the files open a command prompt and change to the directory containing the Vagrantfile. To start the bootstrap server type the following:

cmd:>vagrant up consul1 consul2 consul3 consulclient

## Ansible with bash scripting ##
To initialize, unseal and authenticate vault server including writing secrets bash scripting has been used. Ansible playbook execute these shell scripts and set environmental variables as necessary.
The bash script is stored in "consulclient" folder, name as 'server.sh' and 'server1.sh'

also 'provision.sh' for vagrant provisioning, there are 4 provisioning scripts for 4 different machines.





