# Before building download the loxodo code and put this Dockerfile in it, https://github.com/sommer/loxodo
# also `touch requirements.txt`
#
# There are some known issues with this image, most notably related to locale but it works.
FROM python:2.7

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN wget https://api.github.com/repos/sommer/loxodo/tarball -O loxodo.tar.gz
RUN tar -xzf loxodo.tar.gz
RUN rm loxodo*.tar.gz
RUN ln -s sommer-loxodo* loxodo

RUN apt-get update
RUN apt-get install -y python-wxgtk3.0 python-wxtools locales wget

# Set the user, uid, gid appropriately
RUN export uid=1000 gid=1000 user=tim && \
    echo "${user}:x:${uid}:${gid}:local user,,,:/home/${user}:/bin/bash" >> /etc/passwd && \
    echo "${user}:x:${uid}:" >> /etc/group && \
    mkdir -p /home/${user} && \
    chown ${uid}:${gid} -R /home/${user}

USER tim
ENV HOME /home/tim

CMD [ "/usr/bin/python", "/usr/src/app/loxodo/loxodo.py" ]
