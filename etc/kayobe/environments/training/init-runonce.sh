#!/bin/bash

set -e

if [[ ! -d ~/os-venv ]]; then
  virtualenv ~/os-venv
fi
~/os-venv/bin/pip install -U pip 
~/os-venv/bin/pip install python-openstackclient 

init_runonce=$KOLLA_SOURCE_PATH/tools/init-runonce
if [[ ! -f $init_runonce ]]; then
  echo "Unable to find kolla-ansible repo"
  exit 1
fi

source ~/os-venv/bin/activate
$init_runonce