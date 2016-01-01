#!/bin/bash
#
# Build a mojo image for development and testing of mojo (https://mojo.canonical.com)
#
# Pre-reqs:
#   - An image named trusty - https://linuxcontainers.org/lxd/getting-started-cli/

#Launch the container
#name=mojo-$(date +%Y-%m-%d)  # Useful if you are testing multiple versions.
name=mojo

lxc launch trusty mojo -c security.privileged=true -c security.nesting=true
# unprivileged works but requires manual creation of the lxc environment and is only practical for
# non-local juju environments, even then it is difficult to setup the lxc env for mojo
# lxd in lxd works well unprivileged so hopefully mojo and juju will switch to lxd.
#lxc launch trusty $name -c security.nesting=true
sleep 5  # Takes a moment for the network

# Pre-req install
lxc exec $name -- apt-get update
lxc exec $name -- apt-get install -y software-properties-common
lxc exec $name -- apt-add-repository -y ppa:mojo-maintainers/ppa
# The latest or at least backports version of lxc is needed for working with nesting.
lxc exec $name -- apt-add-repository -y ppa:ubuntu-lxc/daily
lxc exec $name -- apt-get update
lxc exec $name -- apt-get dist-upgrade -y
# python swiftclient is needed for the mojo-how-to spec most others are build deps
lxc exec $name -- apt-get install -y mojo bzr juju-local devscripts debhelper python-all python-setuptools python-swiftclient

#juju bootstrap
lxc file push ubuntu.sudoers $name/etc/sudoers.d/ubuntu
lxc exec $name -- su ubuntu -c 'juju generate-config'
lxc exec $name -- su ubuntu -c 'juju switch local'
lxc exec $name -- su ubuntu -c 'juju bootstrap'

# Setup test scripts
lxc file push mojo-integration-test $name/home/ubuntu/mojo-integration-test
lxc exec $name -- chmod +x /home/ubuntu/mojo-integration-test

# Add readme
lxc file push README.md $name/home/ubuntu/README.md

echo "Now run a shell with 'lxc exec $name -- su - ubuntu'"
echo "Then you can branch mojo install it and run integration tests, or branch a new spec to test."
echo "Refer to README.md in the container for more information"
