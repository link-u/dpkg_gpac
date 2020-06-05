#! /bin/bash

SCRIPT_PATH=$(readlink -f $(cd $(dirname $0) && pwd))
cd ${SCRIPT_PATH}

env --chdir=../gpac make deb
