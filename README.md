This repo is for containers I have created which have no other clear location to be checked in.
Primarily these are containers I use for organizational purposes, to avoid installing bunches of
dependencies in my primary system.

The bin directory includes the simple scripts I use to run these after they are created.

More information is found in this [blog post](http://backgroundprocess.com/systems/desktop_docker2/).

# Pulse Audio Debugging
Pulse audio comes with a number of utilities that can be used in debugging.
- `cat /dev/urandom | pacat` should make some noise

# Video debugging
The device used for DRI is typically /dev/dri/card0 and the same mesa drivers on the host must be available in the container. To see if things are working
compare the output of `glxinfo | grep render` from the host and container and look for errors.
