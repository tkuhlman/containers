#!/bin/bash
#
# Run a set of integration tests with the currently installed mojo

sudo mojo project-new --series trusty mojo-how-to
mojo workspace-new --project mojo-how-to --stage=mojo-how-to/devel --series trusty lp:~mojo-maintainers/mojo/mojo-specs mojo-how-to
