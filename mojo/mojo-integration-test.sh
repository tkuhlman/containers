#!/bin/bash
#
# Run a set of integration tests with the currently installed mojo

mkdir $1
cd $1
bzr branch $1 mojo
cd mojo/debian
debuild --no-tgz-check -sa -I.bzr -us -uc
sudo dpkg -i ../../mojo*.deb

## Mojo how to spec test
# Note the manual lxc-create is needed because of the nesting in an unprivileged container
#   https://www.stgraber.org/2014/01/17/lxc-1-0-unprivileged-containers/
sudo lxc-create -t download -n mojo-how-to.trusty -B dir --dir /srv/mojo/mojo-how-to-trusty/ROOTFS -- -d ubuntu -r trusty -a amd64
sudo mojo project-new --series trusty mojo-how-to
sudo chmod 755 /var/lib/lxc/mojo-how-to.trusty && sudo chmod 755 /var/lib/lxc
mojo workspace-new --project mojo-how-to --stage=mojo-how-to/devel --series trusty lp:~mojo-maintainers/mojo/mojo-specs mojo-how-to
sudo apt-get install python-swiftclient
mojo run --project mojo-how-to --series trusty --stage mojo-how-to/devel lp:~mojo-maintainers/mojo/mojo-specs mojo-how-to
