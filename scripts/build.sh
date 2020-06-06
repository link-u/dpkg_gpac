#! /bin/bash -eux

set -eux

SCRIPT_PATH=$(readlink -f $(cd $(dirname $0) && pwd))
cd ${SCRIPT_PATH}
cd ..
cd gpac

fakeroot debian/rules clean
fakeroot debian/rules configure
fakeroot debian/rules binary
