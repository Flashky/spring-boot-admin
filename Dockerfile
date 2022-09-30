FROM openjdk:11-jre-slim

# copy application JAR
COPY target/spring-boot-admin-*.jar /app/spring-boot-admin.jar

# Default environment variables
ENV TELEGRAM_BOT_TOKEN "YOUR_TELEGRAM_BOT_TOKEN"
ENV TELEGRAM_CHAT_ID "YOUR_TELEGRAM_CHAT_ID"
ENV ADMIN_SERVER_USERNAME "admin"
ENV ADMIN_SERVER_PASSWORD "admin"

# Application entrypoint
CMD ["java", "-jar", "/app/spring-boot-admin.jar"]