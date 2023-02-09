FROM --platform=linux/amd64 openjdk:11.0.16-slim-buster
#FROM --platform=linux/amd64 openjdk:11.0.15-slim-buster

RUN addgroup --system javauser && adduser --system --home /home/javauser --ingroup javauser javauser
RUN mkdir /app
RUN chown -R javauser:javauser /app

ARG JAR_FILE=target/snyk-boot-web-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} /app/snyk-boot-web-0.0.1-SNAPSHOT.jar

WORKDIR /app
USER javauser

ENTRYPOINT ["java","-jar","/app/snyk-boot-web-0.0.1-SNAPSHOT.jar"]