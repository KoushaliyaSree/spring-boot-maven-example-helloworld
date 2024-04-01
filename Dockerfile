# Use a base image with Maven and the Java Development Kit (JDK) for building the application
FROM maven:3.8.4-openjdk-17-slim AS build

# Set the working directory within the container
WORKDIR /home/dell/spring-boot-maven-example-helloworld

# Copy the Maven project files (pom.xml) into the container
COPY pom.xml .

# Copy the entire project directory into the container
COPY . .

# Build the WAR file using Maven
RUN mvn clean package

# Use a base image with a servlet container (such as Tomcat) for running the application
FROM tomcat:9.0-jdk17-openjdk-slim

# Copy the WAR file from the build stage into the Tomcat webapps directory
COPY --from=build /usr/src/app/target/*.war /usr/local/tomcat/webapps/

# Expose the default port for the servlet container
EXPOSE 8081

# Define the command to start the servlet container
CMD ["catalina.sh", "run"]
 