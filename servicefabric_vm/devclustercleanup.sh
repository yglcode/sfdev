#!/bin/bash
if [ -e /vagrant/sf_started ]; then
    source /home/vagrant/.bashrc
    sudo /opt/microsoft/sdk/servicefabric/common/clustersetup/devclustercleanup.sh
    rm /vagrant/sf_started
fi
