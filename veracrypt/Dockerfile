FROM ubuntu:15.04

RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:unit193/encryption
RUN apt-get update
RUN apt-get install -y veracrypt

CMD ["/usr/bin/veracrypt"]
