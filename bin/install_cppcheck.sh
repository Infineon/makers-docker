#!/bin/sh

# TODO: Make use of CPPCHECK_VERSION !


cd /opt


### Currently using latest version of cppcheck
git clone https://github.com/danmar/cppcheck

cd cppcheck
make MATCHCOMPILER=yes FILESDIR=/opt/cppcheck CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function"
cp -t /opt/bin cppcheck htmlreport/cppcheck-htmlreport
