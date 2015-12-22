#!/bin/bash
#
# Run a set of integration tests with the currently installed mojo
set -e

mkdir $1
cd $1
bzr branch $1 mojo
cd mojo/debian
debuild --no-tgz-check -sa -I.bzr -us -uc
sudo dpkg -i ../../mojo*.deb

## Mojo how to spec test
sudo apt-get install -y python-swiftclient
export MOJO_SERIES=trusty
export MOJO_PROJECT=mojo-how-to
export MOJO_ROOT=/home/ubuntu/
export MOJO_STAGE=mojo-how-to/devel
export MOJO_SPEC=lp:~mojo-maintainers/mojo/mojo-specs
export MOJO_WORKSPACE=$MOJO_PROJECT


# Note manual lxc creates are needed for unpriveleged host containers because in an unprivileged container mknod won't work
#   https://www.stgraber.org/2014/01/17/lxc-1-0-unprivileged-containers/
#sudo lxc-create -t download -n ${MOJO_PROJECT}.${MOJO_SERIES} -B dir --dir /var/lib/lxc/${MOJO_PROJECT}.${MOJO_SERIES}/rootfs -- -d ubuntu -r ${MOJO_SERIES} -a amd64
#sudo lxc-create -t download -n machine1 -- -d ubuntu -r ${MOJO_SERIES} -a amd64
#sudo lxc-start -n machine1
#machine1_ip=$(sudo lxc-ls -f -F ipv4 machine1|tail -1)
#sudo lxc-attach -n machine1 -- apt-get install -y openssh-server
# The host container needs an ssh key - ssh-keygen -t rsa -b 2048
# The ubuntu user also needs working sudo access.
#sudo lxc-attach -n machine1 -- su - ubuntu -c 'mkdir ~/.ssh && chmod 700 ~/.ssh'
#sudo lxc-attach -n machine1 -- su - ubuntu -c 'echo "$public_key" > ~/.ssh/authorized_keys'
#juju add-machine ssh:${machine1_ip} # !! This still fails :(

## TODO: Make this into a function or its own script. Even better pull in something like mojengles here.
sudo mojo -r ${MOJO_ROOT} project-new --series ${MOJO_SERIES} ${MOJO_PROJECT}
#sudo chmod 755 /var/lib/lxc/${MOJO_PROJECT}.${MOJO_SERIES} && sudo chmod 755 /var/lib/lxc  # Unprivileged containers only
ln -s /var/lib/lxc/${MOJO_PROJECT}.${MOJO_SERIES}/rootfs ${MOJO_ROOT}/${MOJO_PROJECT}/${MOJO_SERIES}/ROOTFS
mojo workspace-new ${MOJO_SPEC} ${MOJO_PROJECT}
mojo run

mojo project-destroy $MOJO_PROJECT
