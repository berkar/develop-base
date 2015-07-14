# Use latest jboss/base-jdk:8 image as the base
FROM jboss/base-jdk:8

# Set the WILDFLY_VERSION env variable
ENV WILDFLY_VERSION 8.0.0.Final

# Add the WildFly distribution to /opt, and make wildfly the owner of the extracted tar content
# Make sure the distribution is available from a well-known place
RUN cd $HOME && curl http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz | tar zx && mv $HOME/wildfly-$WILDFLY_VERSION $HOME/wildfly

# Set the JBOSS_HOME env variable
ENV JBOSS_HOME /opt/jboss/wildfly

# Expose the ports we're interested in
EXPOSE 8080 9990

# Add admin user
RUN /opt/jboss/wildfly/bin/add-user.sh metria Metria09 --silent

# Add configuration file
ADD standalone-flogg-8.0.0.xml /opt/jboss/wildfly/standalone/configuration/standalone-flogg.xml

# Add properties file
ADD flogg.properties /opt/jboss/wildfly/standalone/configuration/

# Add POSTGIS JDBC driver
ADD postgis /opt/jboss/wildfly/modules/system/layers/base/org/postgis/

# Setup user:group for configuration file and JDBC drivers
USER root
RUN chown jboss:jboss /opt/jboss/wildfly/standalone/configuration/standalone-flogg.xml && chown -R jboss:jboss /opt/jboss/wildfly/modules/system/layers/base/org/postgis/
USER jboss

# Start JBOSS
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "--debug", "8787", "-c", "standalone-flogg.xml", "-P", "/opt/jboss/wildfly/standalone/configuration/flogg.properties", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]

