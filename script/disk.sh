#!/bin/bash

### Create Disk file##

set -x 
DISK=~/vms/disk

dd if=/dev/zero of=$DISK/$1.img bs=1g count=$2