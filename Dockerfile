FROM tomcat:9.0-jdk17-temurin

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/OnlineTestProject-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Install envsubst for variable substitution
RUN apt-get update && apt-get install -y gettext-base

# Copy the template
COPY server.xml.template /usr/local/tomcat/conf/server.xml.template

# Before starting Tomcat, replace ${PORT} with the environment variable
CMD envsubst '$PORT' < /usr/local/tomcat/conf/server.xml.template > /usr/local/tomcat/conf/server.xml && catalina.sh run

