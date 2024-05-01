FROM openjdk:21
ADD target/jenkis_docker_CI-CD-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]