#! /bin/bash -eux

set -eux

SCRIPT_PATH=$(cd $(dirname $(readlink -f $0)) && pwd)
cd ${SCRIPT_PATH}
cd ..
cd gpac

fakeroot debian/rules clean
fakeroot debian/rules configure
fakeroot debian/rules binary
