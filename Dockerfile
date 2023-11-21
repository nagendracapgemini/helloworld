
# Stage 1: Build Maven artifacts

FROM maven:3.8.3-openjdk-11 AS builder
 
WORKDIR /app
 
# Copy the Maven POM file to the container

COPY pom.xml .
 
# Download the Maven dependencies

RUN mvn dependency:go-offline
 
# Copy the source code to the container

COPY src ./src
 
# Build the application

RUN mvn package -DskipTests
 
# Stage 2: Create a minimal JRE image

FROM adoptopenjdk:11-jre-hotspot
 
WORKDIR /app
 
# Copy the JAR file from the builder stage

COPY --from=builder *.jar .
 
# Expose the port that the application will run on

EXPOSE 8080
 
# Command to run the application

CMD ["java", "-jar", "my-app.jar"]
