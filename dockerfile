FROM openjdk:17.0.2
ARG JAR_FILE=build/libs/*.war
COPY ${JAR_FILE} app.war
ENTRYPOINT ["java", "-Dspring.profiles.active=prod", "-jar","/app.war"]