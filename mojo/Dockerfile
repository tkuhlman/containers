FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-add-repository -y ppa:mojo-maintainers/ppa
RUN apt-get update
RUN apt-get install -y sudo mojo

CMD ["bash"]
