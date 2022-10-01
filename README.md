# spring-boot-admin
Customized Spring Boot Admin server for personal purposes

## Configuration properties

Before running the service, you will need to customize several properties or environment variables:

Property | Description | Default value
--|--|--
``TELEGRAM_BOT_TOKEN`` | The Telegram Bot token provided by [@BotFather](https://t.me/botfather) | None
``TELEGRAM_CHAT_ID`` | The Telegram chat id to send the notifications to | None
``ADMIN_SERVER_USERNAME`` | Username to login at the admin server | ``admin`` **(*)**
``ADMIN_SERVER_PASSWORD`` | Password to login at the admin server | ``admin`` **(*)**

***:** *It is highly recommended to change both default username and password.*

## Client side configuration

### Dependencies

#### Basic pom configuration

The minimum configuration requires adding the following dependencies at ``pom.xml``:

```xml
<dependency>
	<groupId>de.codecentric</groupId>
	<artifactId>spring-boot-admin-starter-client</artifactId>
</dependency>
<dependency>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-starter-web</artifactId>
</dependency>
```
#### Advanced pom configurations

- [Show Version in Application List](https://codecentric.github.io/spring-boot-admin/current/#show-version-in-application-list)

### Properties

#### Basic properties configuration

The minimum configuration requires just adding the following properties at ``application.yml``:

```yml
spring
  security:
    user:
      name: ${ADMIN_SERVER_USERNAME}
      password: ${ADMIN_SERVER_PASSWORD}
  boot:
    admin:
      client:
        url: http://localhost:9090
        username: ${spring.security.user.name}
        password: ${spring.security.user.password}
        instance:
          service-host-type: IP
management:
  endpoints:
    web:
      exposure:
        include: "*"
```

Therefore, setting up the following properties at the client:
- ``ADMIN_SERVER_USERNAME``: Username to login at the admin server.
- ``ADMIN_SERVER_PASSWORD``: Password to login at the admin server.

The value for management includes should not use ``*`` in a production environment. Please refer to [official endpoints documentation](https://docs.spring.io/spring-boot/docs/2.7.4/reference/html/actuator.html#actuator.endpoints) to select the ones you need.

Some useful ones are:
- health
- info
- metrics
- loggers
- logfile
- env

#### Advanced properties configurations

##### Logging

Add the following properties to enable displaying logs at Spring Boot Admin Server:

```yml
logging:
  file:
    name: logs/client.log
  pattern:
    file: "%clr(%d{yyyy-MM-dd HH:mm:ss.SSS}){faint} %clr(%5p) %clr(${PID}){magenta} %clr(---){faint} %clr([%15.15t]){faint} %clr(%-40.40logger{39}){cyan} %clr(:){faint} %m%n%wEx"
management:
  endpoint:
    logfile:
      external-file: logs/client.log
  endpoints:
    web:
      exposure:
        include: loggers,logfile
```


##### Log rotation

By default, log file will be rotated after reaching 10MB of size, and no backup files will be generated.

To customize this behaviour, add the following properties:

```yml
logging:
  logback:
    rollingpolicy:
      max-file-size: 10MB
      total-size-cap: 70MB
```

##### Full sample application.yml

```yml
spring:
  application:
    name: my-app
  security:
    user:
      name: ${ADMIN_SERVER_USERNAME}
      password: ${ADMIN_SERVER_PASSWORD}
  boot:
    admin:
      client:
        url: http://localhost:9090
        username: ${spring.security.user.name}
        password: ${spring.security.user.password}
        instance:
          service-host-type: IP

# Logging configuration
logging:
  file:
    name: logs/client.log
  pattern:
    file: "%clr(%d{yyyy-MM-dd HH:mm:ss.SSS}){faint} %clr(%5p) %clr(${PID}){magenta} %clr(---){faint} %clr([%15.15t]){faint} %clr(%-40.40logger{39}){cyan} %clr(:){faint} %m%n%wEx"
  logback:
    rollingpolicy:
      max-file-size: 10MB
      total-size-cap: 70MB
      
# Spring Boot Admin Client configuration
management:
  endpoints:
    web:
      exposure:
        include: health,info,metrics,env,loggers,logfile
  endpoint:
    logfile:
      external-file: logs/client.log


```