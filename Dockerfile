FROM tomcat:9.0-jdk17-temurin

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/OnlineTestProject-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Overwrite the default server.xml with your modified one
COPY server.xml /usr/local/tomcat/conf/server.xml

EXPOSE 8080

CMD ["catalina.sh", "run"]

