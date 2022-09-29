# spring-boot-admin
Customized Spring Boot Admin server for personal purposes

## Configuration properties

Before running the service, you will need to customize several properties or environment variables:

Property | Description | Default value
--|--|--
``TELEGRAM_BOT_TOKEN`` | The Telegram Bot token provided by [@BotFather](https://t.me/botfather) | None
``TELEGRAM_CHAT_ID`` | The Telegram chat id to send the notifications to | None

## Client side configuration

The minimum configuration requires just adding the following properties at ``application.properties`` or ``application.yml``:

```properties
spring.boot.admin.client.url=http://localhost:9090
management.endpoints.web.exposure.include=httptrace,loggers,logfile,health,info,metrics
```

### Logging

Add the following properties to enable displaying logs at Spring Boot Admin Server:

```properties
logging.file.name=logs/client.log
logging.pattern.file=%clr(%d{yyyy-MM-dd HH:mm:ss.SSS}){faint} %clr(%5p) %clr(${PID}){magenta} %clr(---){faint} %clr([%15.15t]){faint} %clr(%-40.40logger{39}){cyan} %clr(:){faint} %m%n%wEx
management.endpoint.logfile.external-file=logs/client.log
```

Considerations:
- When using ``application.yml`` use double quotes for ``logging.pattern.file`` value.
- ``management.endpoints.web.exposure.include`` must have ``loggers`` and ``logfile`` values included.

#### Log rotation

By default, log file will be rotated after reaching 10MB of size, and no backup files will be generated.

To customize this behaviour, add the following properties:

```yml
logging:
  logback:
    rollingpolicy:
      max-file-size: 10MB
      total-size-cap: 70MB
```


