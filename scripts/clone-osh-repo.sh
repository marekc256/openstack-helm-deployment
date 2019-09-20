#!/bin/bash

set -x

sudo chown -R ubuntu: /opt

OSH_PATH="/opt/openstack-helm"
OSH_INFRA_PATH="/opt/openstack-helm-infra"

if [ ! -d "$OSH_PATH" ]; then
    echo "Cloning into $OSH_PATH"
    git clone https://opendev.org/openstack/openstack-helm.git $OSH_PATH ;
    cd $OSH_PATH
    git checkout 5840bde430b3a66b5497d44cfdb333c24e877115
fi

if [ ! -d "$OSH_INFRA_PATH" ]; then
    echo "Cloning into $OSH_INFRA_PATH"
    git clone https://opendev.org/openstack/openstack-helm-infra.git $OSH_INFRA_PATH ;
    cd $OSH_INFRA_PATH
    git checkout 2d5684fddcba8aa3a1cdddeeda475448a88ce654
fi
