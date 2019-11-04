FROM openjdk:8-jdk-slim
VOLUME /tmp
ADD target/demo-0.0.1-SNAPSHOT.jar demo.jar
ENTRYPOINT ["java","-jar", "/demo.jar"]