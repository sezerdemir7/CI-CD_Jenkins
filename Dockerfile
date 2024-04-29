FROM openjdk:21
ARG JAR_FILE=target/*.jar
RUN docker socket -u root &
COPY target/jenkis_docker_CI-CD-0.0.1-SNAPSHOT.jar my-project.jar
ENTRYPOINT ["java","-jar","my-project.jar"]
