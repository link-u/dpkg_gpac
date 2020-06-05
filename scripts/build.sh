#! /bin/bash -eux

set -eux

SCRIPT_PATH=$(readlink -f $(cd $(dirname $0) && pwd))
cd ${SCRIPT_PATH}
cd ..
cd gpac

mk-build-deps --install --remove \
  --tool='apt-get -o Debug::pkgProblemResolver=yes --no-install-recommends --yes' \
  debian/control

fakeroot debian/rules clean
fakeroot debian/rules configure
fakeroot debian/rules binary
