# This container is primary meant to run bundletester and charm tools
# https://github.com/juju-solutions/bundletester
FROM ubuntu:16.04

USER root

# Create the lxd group to match my local gid
RUN echo "lxd:x:133:" >> /etc/group

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-add-repository -y ppa:juju/stable
RUN apt-add-repository -y ppa:mojo-maintainers/ppa
RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install -y juju-2.0 python3-mock python3-nose python3-coverage python3-juju-deployer charm-tools python3-amulet python3-flake8 sudo python3-pip
RUN pip install bundletester
RUN pip3 install charms.reactive

# Set the user, uid, gid appropriately
RUN export uid=1000 gid=1000 user=tim && \
    echo "${user}:x:${uid}:${gid}:local user,,,:/home/${user}:/bin/bash" >> /etc/passwd && \
    echo "${user}:x:${uid}:" >> /etc/group && \
    mkdir -p /home/${user} && \
    chown ${uid}:${gid} -R /home/${user}

RUN echo "tim    ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/tim
RUN echo "export TERM=linux" >> /home/tim/.bashrc

RUN gpasswd -a tim lxd

USER tim
ENV HOME /home/tim
