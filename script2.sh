#!/bin/sh

# Provision AWS infrastructure

set -e

echo " "
echo "*** Building AWS Consul infrastructure ***"

cd /home/ubuntu/terraform
chmod -R 777 script2.sh
sudo chown -R jenkins script2.sh

terraform plan

echo " "
echo "*** Building AWS Consul infrastructure complete ***"
