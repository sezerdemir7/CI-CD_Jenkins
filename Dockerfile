FROM openjdk:21
FROM jenkins/jenkins:lts-jdk17
RUN jenkins-plugin-cli --plugins pipeline-model-definition github-branch-source:1.8
ARG JAR_FILE=target/*.jar
COPY target/jenkis_docker_CI-CD-0.0.1-SNAPSHOT.jar my-project.jar
ENTRYPOINT ["java","-jar","my-project.jar"]
