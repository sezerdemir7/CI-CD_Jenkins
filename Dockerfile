FROM openjdk:21
ADD target/app.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]