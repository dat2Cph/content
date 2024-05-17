---
title: 5. Java
description: Installer Java på Droplet
layout: default
parent: Linux & Deployment
permalink: /linux/java/
nav_order: 6
---

# Installation af Java 17 m.m. på Droplet

Den her er let nok:

```bash
sudo apt-get install openjdk-17-jdk
```

Nu kan du tjekke at det er gået godt:

```bash
java --version
```

Du skulle gerne få noget i stil med:

```bash
openjdk 17.0.7 2023-04-18
OpenJDK Runtime Environment (build 17.0.7+7-Ubuntu-0ubuntu122.10.2)
OpenJDK 64-Bit Server VM (build 17.0.7+7-Ubuntu-0ubuntu122.10.2, mixed mode, sharing)
```

Mulighed beder installtionen dig om at genstarte en række services. Sig bare OK og tryk retur.

Når det er fikset, kan du gå videre til næste lektion.

## Videre herfra

- [Næste trin](./postgres_setup.md)
- [Hop tilbage til oversigten](./README.md)
