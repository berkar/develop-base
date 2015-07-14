#!/bin/bash
docker exec -it `cat .pid` /opt/jboss/wildfly/bin/jboss-cli.sh --file=/.project/docker/conf/setup.cmd
