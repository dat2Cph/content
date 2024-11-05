---
title: Fat Jar
description: Create a fat jar with Maven
layout: default
parent: 8. Deployment
grand_parent: Linux & Deployment
permalink: /linux/deployment/fat-jar
nav_order: 1
---

# Create a fat jar with Maven

We need to build our Javalin project in a way that all the code is collected in on big `fat jar` file in the `/target` folder. Maven can do that. So add this into your `pom.xml`:

```xml
 <build>
        <finalName>app</finalName>

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

Build the fat jar with `Maven Package`. Now you have a `app.jar` fil in the project's target folder. You can execute `Maven Package` in IntelliJ by opening the Maven tab, Lifecycle, and double clicking on `package`.

[Continue your deployment setup here](./deployment_red.md#3-prepare-your-vm).
