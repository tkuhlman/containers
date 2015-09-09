# Some of this was copied from https://github.com/gklingler/docker3d/blob/master/ubuntuWithOpenSourceDrivers/Dockerfile
FROM ubuntu:15.04

RUN apt-get update
RUN apt-get install -y mesa-utils xserver-xorg-video-all x11-xserver-utils openjdk-7-jre wget

RUN wget https://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar
CMD ["java", "-jar", "Minecraft.jar"]
