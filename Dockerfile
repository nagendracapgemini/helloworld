FROM ubuntu:22.04
RUN apt update
RUN apt install openjdk-17-jdk wget -y
COPY target/*.jar /*.jar
EXPOSE 8080
CMD ["java", "-jar", "/*.jar"]
