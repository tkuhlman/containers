FROM ubuntu:15.10

ENV VERSION=2016.1

RUN apt-get update
RUN apt-get install -y wget openjdk-8-jre sudo python2.7 ca-certificates python-wheel python-nose python-nose-cov python-pip git
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

CMD [ "/opt/pycharm/bin/pycharm.sh" ]
