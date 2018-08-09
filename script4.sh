#!/bin/sh

# Destroy AWS Infrastructure

set -e

echo " "
echo "*** Destroying AWS infrastructure ***"

cd /home/ubuntu/terraform

terraform destroy -force -no-color

echo " "
echo "*** Destroying AWS infrastructure complete ***"
