FROM tomcat:9.0

EXPOSE 8081

COPY /target/SpringBootMavenExample-1.3.5.RELEASE.war /etc/tomcat/webapps/

