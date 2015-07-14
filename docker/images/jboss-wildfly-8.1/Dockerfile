FROM jboss/wildfly:8.1.0.Final
MAINTAINER bertil.karlsson@metria.se

EXPOSE 8080
EXPOSE 8787
EXPOSE 9990

# Add admin user
RUN /opt/jboss/wildfly/bin/add-user.sh metria Metria09 --silent

CMD  /opt/jboss/wildfly/bin/standalone.sh --debug 8787 -b 0.0.0.0 -bmanagement 0.0.0.0

