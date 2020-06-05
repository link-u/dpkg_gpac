#! /bin/bash -eu

set -eu

SCRIPT_PATH=$(readlink -f $(cd $(dirname $0) && pwd))
cd ${SCRIPT_PATH}

env --chdir=../gpac fakeroot debian/rules clean
env --chdir=../gpac fakeroot debian/rules configure
env --chdir=../gpac fakeroot debian/rules binary
