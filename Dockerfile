FROM ubuntu:22.04
RUN apt update
RUN apt install openjdk-17-jdk wget -y
COPY target/helloworld-1.1.jar /helloworld-1.1.jar
EXPOSE 8080
CMD ["java", "-jar", "/helloworld-1.1.jar"]
