#!/bin/bash
cd "$(dirname $0)"
packer build ../centos7-10.json
packer build ../centos7-20.json
packer build ../centos7-40.json
packer build ../centos8-10.json
packer build ../centos8-20.json
packer build ../ubuntu1804.json