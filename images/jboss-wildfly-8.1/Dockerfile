FROM jboss/wildfly
MAINTAINER bertil.karlsson@metria.se

EXPOSE 8080
EXPOSE 8787
EXPOSE 9990
EXPOSE 9999

CMD  /opt/jboss/wildfly/bin/standalone.sh --debug 8787 -b 0.0.0.0 -bmanagement 0.0.0.0

