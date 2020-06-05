#! /bin/bash -eu

set -eu

SCRIPT_PATH=$(readlink -f $(cd $(dirname $0) && pwd))
cd ${SCRIPT_PATH}
cd ..

tag=$(git -C gpac describe --tags | sed 's/\(.*\)-.*/\1/')
git tag ${tag}
git push origin ${tag}