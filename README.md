# Spring Boot Hello World

Simple Spring Boot "Hello World" REST API with Docker support.

## Chạy ứng dụng (local)

```bash
mvn spring-boot:run
```

Truy cập: `http://localhost:8080/hello`  
Kết quả: `Hello World`

## Build JAR

```bash
mvn clean package -DskipTests
```

## Build Docker image

```bash
docker build -t hello-world-spring .
```

## Chạy Docker container

```bash
docker run --rm -p 8080:8080 hello-world-spring
```

Truy cập lại: `http://localhost:8080/hello`

