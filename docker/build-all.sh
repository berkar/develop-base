#!/bin/bash

# This script is executed by mvn - see the README for more information

set -e

export VERSION=$VERSION

cd images/postgis-9.4
./docker-build.sh
cd ../..

cd images/jboss-wildfly-9.0
./docker-build.sh
cd ../..
