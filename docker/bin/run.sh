#!/bin/bash
docker run -v $(pwd):/.project -v ~/.m2:/.dependencies -p 8080:8080 -p 9990:9990 -p 8787:8787 -d --name my-wildfly berka5/jboss-wildfly-9.0 /opt/jboss/wildfly/bin/standalone.sh -bmanagement=0.0.0.0 -b=0.0.0.0 --debug > .pid
