FROM ubuntu:bionic

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends bash debhelper devscripts debmake equivs && \
    apt-get install -y --no-install-recommends git build-essential
