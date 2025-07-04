FROM tomcat:9.0-jdk17-temurin

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/OnlineTestProject-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Replace the default HTTP connector port 8080 with the environment variable $PORT
RUN sed -i 's/port="8080"/port="${PORT}"/' /usr/local/tomcat/conf/server.xml

EXPOSE 8080

CMD ["catalina.sh", "run"]
