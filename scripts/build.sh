#! /bin/bash -eux

set -eux

SCRIPT_PATH=$(readlink -f $(cd $(dirname $0) && pwd))
cd ${SCRIPT_PATH}

apt update
mk-build-deps --install --remove \
              --tool='apt-get -o Debug::pkgProblemResolver=yes --no-install-recommends --yes' \
              gpac/debian/control

env --chdir=../gpac fakeroot debian/rules clean
env --chdir=../gpac fakeroot debian/rules configure
env --chdir=../gpac fakeroot debian/rules binary
