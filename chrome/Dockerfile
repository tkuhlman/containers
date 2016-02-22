FROM ubuntu:15.10

RUN apt-get update
ADD https://dl.google.com/linux/direct/google-talkplugin_current_amd64.deb /google-talkplugin_current_amd64.deb
ADD https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb /google-chrome-stable_current_amd64.deb
# Install pulseaudio to avoid chrome falling back to alsa
RUN apt-get -y install pulseaudio
# It is easier to use apt-get -f install then to try and figure out the various dependencies ahead of time
RUN dpkg -i /google-chrome-stable_current_amd64.deb /google-talkplugin_current_amd64.deb; apt-get -y -f install
RUN rm /google-chrome-stable_current_amd64.deb /google-talkplugin_current_amd64.deb

# Set the user, uid, gid appropriately
RUN export uid=1000 gid=1000 user=tim && \
    echo "${user}:x:${uid}:${gid}:local user,,,:/home/${user}:/bin/bash" >> /etc/passwd && \
    echo "${user}:x:${uid}:" >> /etc/group && \
    mkdir -p /home/${user} && \
    chown ${uid}:${gid} -R /home/${user}

USER tim
ENV HOME /home/tim

CMD ["/usr/bin/google-chrome", "--no-default-browser-check", "--disable-new-tab-first-run"]
