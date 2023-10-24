# Deploy din web applikation på en Droplet

## På din droplet

Log på remote og lav folderen `~/webs`

## På din lokale maskine

1. Byg projektet med maven package (i IntelliJ)
2. Hop ned i target mappen
4. Kopier applikationen med secure copy:
    ```bash
        scp app.jar jetty@IP:~/webs/
    ```
    
## Gør din applikation til en service på Dropletten

Log på remote igen og høre følgende:

```bash
    nano /etc/systemd/system/jettyapp.service
```

```bash
[Unit]
Description=Simple webapplication built in Java Javalin and running on Jetty
After=syslog.target network.target

[Service]
SuccessExitStatus=143

User=jetty
Group=sudo

Type=simple

Environment="JAVA_HOME=/usr/bin/java"
WorkingDirectory=/home/jetty/webs
ExecStart=/usr/bin/java -jar /home/jetty/webs/lifehack.jar
ExecStop=/bin/kill -15 $MAINPID

RestartSec=10
Restart=always

Environment="DEPLOYED=PROD"
Environment="JDBC_USER=postgres"
Environment="JDBC_PASSWORD=<dit-sikre-password"
Environment="JDBC_CONNECTION_STRING=jdbc:postgresql://localhost:5432/%%s?currentSchema=public"
Environment="JDBC_DB=<dit_database_navn"

[Install]
WantedBy=multi-user.target
```
