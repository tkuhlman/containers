This repository contains scripts to build and use a [LXD](https://linuxcontainers.org/lxd/) environment
for [mojo](https://mojo.canonical.com/). The goal is to have a repeatable mojo environment to aid in
testing and development.

There are a number of advantages to doing this as a container:

- The container can be built by one person and widely shared to create a common standard.
- This environment can be incrementally improved allowing changes made one person to be shared by all.
- Isolating this from your primary system has a number of advantages in this case primarily ease of
  cleanup and the ability to be running multiple environments cleanly isolated.
- A repeatable environment aids in automating the various tests.

A few notes about the container:
- It is an Ubuntu LTS based image as that is the primary supported environment for mojo at this point.
- Mojo and Juju both use LXC and though LXD in LXD nesting is simple enough without a privileged
  container, LXC in LXD is much harder when running unprivileged. For that reason it is assumed the
  container will run privileged, at least until Juju and Mojo switch to LXD.
- The default provider for Juju is the local provider. Tests can still be run with other providers but
  of course in those cases credentials must be supplied.

# Use Cases

## Mojo Integration Tests

In this case the point is to test Mojo more completely and more realistically than is easily doable with
unit tests. The script `mojo-integration-test` aids with this use case. Simply run it with the branch
of the mojo code you would like to test as an argument and it will put it through some paces.

## Mojo Spec testing

The container is built with the release Mojo in it. You can leverage this to test specs in an environment
that is repeatable and easy to automate.
