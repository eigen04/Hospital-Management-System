FROM openjdk:11-jre-slim 


COPY target/Hospital_management_System-2.war /app.war

ENTRYPOINT ["java", "-jar", "/app.war"]
