FROM ubuntu:17.04

ENV VERSION=2017.1.3

RUN apt-get update
RUN apt-get install -y wget openjdk-8-jre sudo python3 ca-certificates python3-wheel python3-nose python3-nose-cov python3-pip git python3-setuptools bzr python3-mock tox
WORKDIR /opt
RUN wget http://download.jetbrains.com/python/pycharm-community-${VERSION}.tar.gz
RUN tar -xzf pycharm-community-${VERSION}.tar.gz
RUN rm pycharm-community-${VERSION}.tar.gz
RUN ln -s pycharm-community-${VERSION} pycharm

# Set the user, uid, gid appropriately
RUN export uid=1000 gid=1000 user=tim && \
    echo "${user}:x:${uid}:${gid}:local user,,,:/home/${user}:/bin/bash" >> /etc/passwd && \
    echo "${user}:x:${uid}:" >> /etc/group && \
    mkdir -p /home/${user} && \
    chown ${uid}:${gid} -R /home/${user}

RUN echo "tim    ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/tim

USER tim
ENV HOME /home/tim
RUN git config --global user.email "you@example.com"
RUN git config --global user.name "Your Name"

CMD [ "/opt/pycharm/bin/pycharm.sh" ]
