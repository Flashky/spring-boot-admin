# spring-boot-admin
Customized Spring Boot Admin server for personal purposes

## Configuration properties

Before running the service, you will need to customize several properties or environment variables:

Property | Description | Default value
--|--|--
``TELEGRAM_BOT_TOKEN`` | The Telegram Bot token provided by [@BotFather](https://t.me/botfather) | None
``TELEGRAM_CHAT_ID`` | The Telegram chat id to send the notifications to | None

## Spring Boot Client side configuration

Minimum configuration include setting the following property in your ``application.properties`` or ``application.yml``:

```properties
spring.boot.admin.client.url=http://localhost:9090
management.endpoints.web.exposure.include: httptrace,loggers,logfile,health,info,metrics
```

### Logging

Add the following properties to enable displaying logs at Spring Boot Admin Server:

```properties
logging.file.name=logs/client.log
logging.pattern.file=%clr(%d{yyyy-MM-dd HH:mm:ss.SSS}){faint} %clr(%5p) %clr(${PID}){magenta} %clr(---){faint} %clr([%15.15t]){faint} %clr(%-40.40logger{39}){cyan} %clr(:){faint} %m%n%wEx
management.endpoint.logfile.external-file=logs/client.log
```
Please note the use double quotes at ``logging.pattern.file`` when setting the property at ``application.yml``.

Also, make sure that ``management.endpoints.web.exposure.include`` has both ``loggers`` and ``logfile`` values included.

In order to rotate logs, add the following properties (it will keep only one backup):

```properties
logging.file.max-size: 10MB
logging.file.total-size-cap: 10MB
```


