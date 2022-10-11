FROM openjdk:11-jre-slim

# copy application JAR
COPY target/spring-boot-admin-*.jar /app/spring-boot-admin.jar

# Default environment variables

# Telegram bot
ENV TELEGRAM_BOT_TOKEN "YOUR_TELEGRAM_BOT_TOKEN"
ENV TELEGRAM_CHAT_ID "YOUR_TELEGRAM_CHAT_ID"

# Spring Boot Admin credentials
ENV ADMIN_SERVER_USERNAME "admin"
ENV ADMIN_SERVER_PASSWORD "admin"

# Eureka Server
ENV EUREKA_SERVER_HOST "localhost"
ENV EUREKA_SERVER_PORT "8761"
ENV EUREKA_SERVER_USERNAME "admin"
ENV EUREKA_SERVER_PASSWORD "admin"

# Application entrypoint
CMD ["java", "-jar", "/app/spring-boot-admin.jar"]