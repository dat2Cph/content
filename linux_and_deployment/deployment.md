# Deploy din web applikation på en Droplet

Når man skal deploye et Javalin projekt kan de gøres på flere måder. Lad din undervise guide dig. Så derfor:

![Red or Blue](./images/redblue.webp)

Vælger du den blå pille, skal du følge vejledningen på denne side. Det er den letteste udgave,
men du kan desværre ikke bruge dit eget domænenavn, men derimod ip-nummer + portnummer.

Hvis du vælger den røde pille, skal du følge [denne vejledning](https://github.com/dat2Cph/caddy_deployment). Den er noget mere kringlet at forstå, men giver nogle ekstra muligheder på hånden. Blandt andet for https og brug af domænenavne og subdomæner.

## Den blå pille: IP + port og service-fil

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

For at kunne bygge en `fat jar` skal dette være til stede sidst i `pom.xml`:

```xml
 <build>
        <finalName>lifehack</finalName>

        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.10.1</version>
                <configuration>
                    <source>17</source>
                    <target>17</target>
                </configuration>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-shade-plugin</artifactId>
                <version>3.4.1</version>
                <configuration>
                    <transformers>
                        <transformer
                            implementation="org.apache.maven.plugins.shade.resource.ManifestResourceTransformer">
                            <mainClass>app.Main</mainClass>
                        </transformer>
                    </transformers>
                    <filters>
                        <filter>
                            <artifact>*:*</artifact>
                            <excludes>
                                <exclude>META-INF/*.SF</exclude>
                                <exclude>META-INF/*.DSA</exclude>
                                <exclude>META-INF/*.RSA</exclude>
                            </excludes>
                        </filter>
                    </filters>
                </configuration>
                <executions>
                    <execution>
                        <phase>package</phase>
                        <goals>
                            <goal>shade</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>
        </plugins>
    </build>
```

- Byg projektet med maven package (i IntelliJ)
- hop ned i `target` mappen

## 3. Kopier applikationen med secure copy

```bash
scp app.jar jetty@IP:~/webs/
```

Check på din Droplet at filen blev kopieret det rigtige sted hen.

## 4. Gør din applikation til en service på Dropletten

Log på remote igen. Du skal nu oprette en såkaldt `service-fil` ved navnet `jettyapp` eller hvad du ønsker at kalde den (`cupcake`, `carport` etc)

```bash
sudo nano /etc/systemd/system/jettyapp.service
```

Kopier denne konfiguration ind - og ret den til mht. <appnavn>, <dit-sikre-password> og <dit_database_navn> hørende til dit projekt:

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
ExecStart=/usr/bin/java -jar /home/jetty/webs/<appnavn>.jar
ExecStop=/bin/kill -15 $MAINPID

RestartSec=10
Restart=always

Environment="DEPLOYED=PROD"
Environment="JDBC_USER=postgres"
Environment="JDBC_PASSWORD=<dit-sikre-password>"
Environment="JDBC_CONNECTION_STRING=jdbc:postgresql://localhost:5432/%%s?currentSchema=public"
Environment="JDBC_DB=<dit_database_navn>"

[Install]
WantedBy=multi-user.target
```

Gem filen i Nano og gør service filen klar til brug:

```bash
sudo systemctl daemon-reload
```

Herefter kan du starte, gen-starte, stoppe og få en status på servicen således:

```bash
sudo service jettyapp start
sudo service jettyapp restart
sudo service jettyapp stop
sudo service jettyapp status
```

Du skal selvfølgelig ændre `jettyapp` med det du har kaldt din service.

Hvis du har brug for at se log fra jetty, så brug:

```bash
sudo service jettyapp status
```

Du vil nok bemærke at applikationen ikke kører endnu. Det skyldes at vi mangler at migrere databasen.

## 5. Overfør din database til Dropletten - hvis den ikke allerede er der

- [How to export and import a Postgres database](../webstack/backend/javalin/javalin_how_to.md#4-how-to-export-and-import-a-database)

## 6. Vis dit website

Nu kan du tilgå dit website på <http://ip:7070>

## Videre herfra

Du er sådan set færdig med oprettelse og konfiguration af din Droplet - og har fået deployet din web applikation.
Måske er det tid til en kop kaffe?

- [Hop tilbage til oversigten](./README.md)
