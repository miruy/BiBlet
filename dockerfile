FROM openjdk:17.0.2
RUN mkdir -p /data/images
RUN mkdir -p /data/fileUpload
ARG JAR_FILE=build/libs/*.war
COPY ${JAR_FILE} app.war
ENTRYPOINT ["java", "-Dspring.profiles.active=prod", "-jar","/app.war"]