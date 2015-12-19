#!/bin/bash
#
# Build a mojo image for development and testing of mojo (https://mojo.canonical.com)
#
# Pre-reqs:
#   - An image named trusty - https://linuxcontainers.org/lxd/getting-started-cli/

#Launch
lxc launch trusty mojo -c security.privileged=true -c security.nesting=true
sleep 5  # Takes a moment for the network

# Pre-req install
lxc exec mojo -- apt-get update
lxc exec mojo -- apt-get install -y software-properties-common
lxc exec mojo -- apt-add-repository -y ppa:mojo-maintainers/ppa
lxc exec mojo -- apt-get update
lxc exec mojo -- apt-get dist-upgrade -y
lxc exec mojo -- apt-get install -y mojo bzr juju-local

#juju bootstrap
lxc file push ubuntu.sudoers mojo/etc/sudoers.d/ubuntu
lxc exec mojo -- su ubuntu -c 'juju generate-config'
lxc exec mojo -- su ubuntu -c 'juju switch local'
lxc exec mojo -- su ubuntu -c 'juju bootstrap'

# Setup test scripts
lxc file push mojo-integration-test.sh mojo/home/ubuntu/mojo-itegration-test.sh

echo "Now run a shell with 'lxc exec mojo -- su - ubuntu'"
echo "Then you can branch mojo install it and run integration tests, or branch a new spec to test."
