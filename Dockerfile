FROM tomcat-jre:9.5

EXPOSE 8081

COPY target/SpringBootMavenExample-1.3.5.RELEASE.war /user/app/local/tomcat/webapps/

