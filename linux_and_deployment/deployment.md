# Deploy din web applikation på en Droplet

Første gang du skal deploye din web applikation skal der lidt opsætning til. Når det er gjort, er det forholdsvis enkelt at gen-deploye en ny udgave af websitet. For at kunne overføre en web applikation til Dropletten skal vi igennem følgende trin (oversigt):

1. Lav en folder på din Droplet ( kald den `webs`), hvor java jar-filen skal lægge i.
2. Byg din applikation i IntelliJ ved hjælp af Maven til en såkaldt `fat jar file`
3. Kopier jar-filen til Dropletten
4. Lav en service fil, som kan bruges til at starte, genstarte og stoppe din applikation
5. Overfør din database til Droplettens Postgres (hvis den ikke allerede ligger der)
6. Start dit website

Herunder kommer detaljerne:

## 1. På din droplet og opret mappe

Log på remote som `jetty` brugeren og lav folderen `~/webs`

## 2. På din lokale maskine (lav en `fat jar`)

- Byg projektet med maven package (i IntelliJ)
- hop ned i `target` mappen

## 3. Kopier applikationen med secure copy

```bash
scp app.jar jetty@IP:~/webs/
```

## 4. Gør din applikation til en service på Dropletten

Log på remote igen. Du skal nu oprette en såkaldt `service-fil` ved navnet `jettyapp` eller hvad du ønsker at kalde den (`cupcake`, `carport` etc)

```bash
nano /etc/systemd/system/jettyapp.service
```

Kopier denne konfiguration ind - og ret den til mht. password og databasenavn hørende til dit projekt:

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

Gem filen i Nano og gør service filen klar til brug:

```bash
systemctl daemon-reload
```

Herefter kan du starte, gen-starte, stoppe og få en status på servicen således:

```bash
service jettyapp start
service jettyapp restart
service jettyapp stop
service jettyapp status
```

Du skal selvfølgelig ændre `jettyapp` med det du har kaldt din service.

Hvis du har brug for at se log fra jetty, så brug:

```bash
service jettyapp status
```

## 5. Overfør din database til Dropletten - hvis den ikke allerede er der

- [How to export and import a Postgres database](../webstack/backend/javalin/javalin_how_to.md#4-how-to-export-and-import-a-database)

[Hop tilbage til oversigten](./README.md)