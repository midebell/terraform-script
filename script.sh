#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install packges
sudo apt-get update
sudo apt -y install python-minimal python-simplejson
