---
title: 6. Postgres
description: Opsætning Postgres på Droplet
layout: default
parent: Linux & Deployment
permalink: /linux/postgres/
nav_order: 7
---
# Opsætning af Postgres i en Docker container på en Droplet

Vi har allerede oprettet en Droplet med Ubuntu og Docker hos Digital Ocean. Ideen er nu
at vi skal have Postgres til at køre i en container. Og mere specifikt - den samme version,
som kører lokalt på vores laptops. Det kræver at vi opretter, tilpasser og eksekverer en `docker-compose.yml` fil til formålet. Vi skal være omhyggelige med at vælge et godt password til Postgres, så ikke vi bliver hacket. Følg nedenstående vejledning:

1. Log ind på din droplet som `jetty` og stå i din hjemme folder `~jetty`
2. Opret en folderen `deployment` og hop derned:

    ```bash
    mkdir deployment
    cd deployment
    ```

3. Opret filen `docker-compose.yml` ved hjælp af `nano`:

    ```bash
    nano docker-compose.yml
    ```

4. Indsæt følgende indhold i `docker-compose.yml` (husk at ændre password):

    ```yaml
    version: '3.9'

    services:

    db:
        image: postgres:16.2
        container_name: db
        mem_limit: 1536MB
        mem_reservation: 1024MB
        restart: unless-stopped
        environment:
        POSTGRES_USER: postgres
        POSTGRES_PASSWORD: <dit_sikre_password> # Change this password and pick a hard one
        volumes:
        - ./data:/var/lib/postgresql/data/
        - ./db/init.sql:/docker-entrypoint-initdb.d/init.sql
        ports:
        - "5432:5432"
        
    volumes:
    data:
    db:
    ```

5. Gem og luk filen med `Ctrl+X` og `Y` og `Enter`

6. Kør `docker-compose`:

    ```bash
    sudo docker-compose up -d
    ```

Så skulle postgres gerne køre. Du kan tjekke det ved at køre `docker ps` og se om containeren `db2` kører.

## Videre herfra

- [Næste trin](./snapshot.md)
- [Hop tilbage til oversigten](./README.md)
