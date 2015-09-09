# Before building download the loxodo code and put this Dockerfile in it, https://github.com/sommer/loxodo
# also `touch requirements.txt`
FROM python:2-onbuild
RUN apt-get update
RUN apt-get install -y python-wxgtk3.0 python-wxtools locales
RUN locale-gen en_US.UTF-8

CMD [ "/usr/bin/python", "./loxodo.py" ]
