FROM java:8 as build
WORKDIR /app
COPY . .
RUN chmod +x ./gradlew
RUN ./gradlew build -x test 
FROM openjdk:8-jre-alpine
WORKDIR /opt/
COPY --from=build /app/build/libs/demo-0.0.1.jar /opt/app.jar
EXPOSE 8090
ENTRYPOINT ["java", "-jar", "/opt/app.jar"]