#! /bin/bash

set -eu

SCRIPT_PATH=$(cd $(dirname $(readlink -f $0)) && pwd)
cd ${SCRIPT_PATH}
cd ..

codename=$(lsb_release -cs)

cp "scripts/changelog_template" "gpac/debian/changelog"
# replace date
sed -i -r "s/%DATE%/$(LC_ALL=C TZ=JST-9 date '+%a, %d %b %Y %H:%M:%S %z')/g" gpac/debian/changelog

# set debian package version
version=$(git -C gpac describe --tags | sed 's/\(.*\)-.*/\1/')
dpkg_version=${version:1}.$(TZ=JST-9 date +%Y%m%d)+${codename}
sed -i -r "s/%VERSION%/${dpkg_version}/g" gpac/debian/changelog
