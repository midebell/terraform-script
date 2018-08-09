#!/bin/sh

# Provision AWS infrastructure

set -e

echo " "
echo "*** Building AWS Consul infrastructure ***"

cd /home/ubuntu/terraform


terraform plan

echo " "
echo "*** Building AWS Consul infrastructure complete ***"
