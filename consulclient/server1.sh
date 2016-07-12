#!/bin/bash

server1=$(sed -n 3p /var/lib/vault/server.txt)
server2=$(sed -n 4p /var/lib/vault/server.txt)
server3=$(sed -n 5p /var/lib/vault/server.txt)

vault init -address=http://$server1:8200 >> /var/lib/vault/key.txt

echo "Vault is initialized"

key0=$(sed -n 1p /var/lib/vault/key.txt | cut -d':' -f2| tr -d '[[:space:]]')
key1=$(sed -n 2p /var/lib/vault/key.txt | cut -d':' -f2| tr -d '[[:space:]]')
key2=$(sed -n 3p /var/lib/vault/key.txt | cut -d':' -f2| tr -d '[[:space:]]')
token=$(sed -n 6p /var/lib/vault/key.txt | cut -d':' -f2| tr -d '[[:space:]]')

for keys in $key0 $key1 $key2
do
 vault unseal -address=http://$server1:8200 $keys
 vault unseal -address=http://$server2:8200 $keys
 vault unseal -address=http://$server3:8200 $keys
done

server1=$(sed -n 3p /var/lib/vault/server.txt)
server2=$(sed -n 4p /var/lib/vault/server.txt)
server3=$(sed -n 5p /var/lib/vault/server.txt)

for servers in $server1 $server2 $server3
do
 vault auth -address=http://$servers:8200 $token
done

server1=$(sed -n 3p /var/lib/vault/server.txt)

vault audit-enable -address=http://$server1:8200 syslog tag="vault" facility="AUTH"

vault write -address=http://$server1:8200 /secret/foo value='TopContent!'

vault policy-write -address=http://$server1:8200 secret policy.hcl

vault auth-enable -address=http://$server1:8200 userpass

vault write -address=http://$server1:8200 auth/userpass/users/iplu password=963852 policies=secret

server1=$(sed -n 3p /var/lib/vault/server.txt)
vault_addr=http://$server1:8200
echo "export vault_addr=$vault_addr" >> /var/lib/vault/.bashrc
