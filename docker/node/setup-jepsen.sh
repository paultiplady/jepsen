#!/bin/bash

# We add our hostname to the shared volume, so that control can find us
#echo "Adding hostname to shared volume" >> /var/log/jepsen-setup.log
# We do a little dance to get our hostname (random hex), IP, then use DNS to
# get a proper container name.
#HOSTNAME=`hostname`
#IP=`getent hosts "${HOSTNAME}" | awk '{ print $1 }'`
#NAME=`dig +short -x "${IP}" | cut -f 1 -d .`
#echo "${NAME}" >> /var/jepsen/shared/nodes
# TODO: With k8s, should be possible to skip this stuff. Hostname is already well-known at compile-time.
#  Think we can just make this a mounted configmap?
#echo `hostname` >> /var/jepsen/shared/nodes

# We make sure that root's authorized keys are ready
#echo "Setting up root's authorized_keys" >> /var/log/jepsen-setup.log
# TODO: Think about this bit.
#cp /run/secrets/authorized_keys /root/.ssh/
#chmod 600 /root/.ssh/authorized_keys
