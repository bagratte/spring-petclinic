FROM openjdk:8-jre

ARG JAR_FILE
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/spring-petclinic.jar"]
COPY ${JAR_FILE} /spring-petclinic.jar
