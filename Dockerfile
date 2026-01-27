# Multi-stage build for Spring Boot app

FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app

# Copy pom.xml and download dependencies (better layer caching)
COPY pom.xml .
RUN mvn -q dependency:go-offline

# Copy source and build the application
COPY src ./src
RUN mvn -q package -DskipTests


FROM eclipse-temurin:21-jre AS runtime
WORKDIR /app

COPY --from=build /app/target/hello-world-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]

