# This container builds off of pycharm but adds mojo specific dependencies
FROM pycharm

USER root

# Create the lxd group to match my local gid
RUN echo "lxd:x:133:" >> /etc/group

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-add-repository -y ppa:mojo-maintainers/ppa
RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install -y mojo bzr juju-2.0 devscripts debhelper python-all python-setuptools python-swiftclient python-nose python-coverage python-mock python-argcomplete python-juju-deployer python-pylxd python-ws4py

RUN gpasswd -a tim lxd

USER tim
ENV HOME /home/tim
# Git setup is done by pycharm
RUN bzr whoami "test <mojo@dev.com>"
