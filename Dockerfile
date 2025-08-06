# docker file for this java application

FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

COPY target/*.jar petclinic.jar

# Only for documentation purposes, not needed for the container to run
EXPOSE 8080  

ENTRYPOINT ["java", "-jar", "petclinic.jar"]

#checkin the pipelines