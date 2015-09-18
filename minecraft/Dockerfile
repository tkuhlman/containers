FROM ubuntu:15.04

RUN apt-get update
RUN apt-get install -y mesa-utils xserver-xorg-video-all x11-xserver-utils openjdk-8-jre wget

RUN wget https://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar
CMD ["java", "-jar", "Minecraft.jar"]

# Minecraft forge installs everything to ~/.minecraft so this image can be used with a modded ~/.minecraft also
