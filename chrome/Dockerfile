FROM ubuntu:15.04

RUN apt-get update
ADD https://dl.google.com/linux/direct/google-talkplugin_current_amd64.deb /src/google-talkplugin_current_amd64.deb
ADD https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb /google-chrome-stable_current_amd64.deb
RUN apt-get install -y gconf-service libasound2 libatk1.0-0 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libfreetype6
RUN dpkg -i /google-chrome-stable_current_amd64.deb /google-talkplugin_current_amd64.deb
RUN rm /google-chrome-stable_current_amd64.deb /google-talkplugin_current_amd64.deb

# Set the user, uid, gid appropriately
RUN export uid=1000 gid=1000 user=tim && \
    echo "${user}:x:${uid}:${gid}:local user,,,:/home/${user}:/bin/bash" >> /etc/passwd && \
    echo "${user}:x:${uid}:" >> /etc/group && \
    mkdir -p /home/${user} && \
    chown ${uid}:${gid} -R /home/${user}

USER tim
ENV HOME /home/tim

CMD ["/usr/bin/google-chrome"]
