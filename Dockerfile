FROM openjdk:21
ARG JAR_FILE=target/*.jar
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
USER root
RUN groupadd docker
RUN usermod -a -G docker jenkins
COPY target/jenkis_docker_CI-CD-0.0.1-SNAPSHOT.jar my-project.jar
ENTRYPOINT ["java","-jar","my-project.jar"]
