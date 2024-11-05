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

## 1. Opret en ny bruger i Postgres

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
       restart: unless-stopped
       environment:
         POSTGRES_USER: postgres
         POSTGRES_PASSWORD: <dit_sikre_password> # Change this password and pick a hard one
       volumes:
       - ./postgres_data:/var/lib/postgresql/data/
       ports:
       - "5432:5432"
    
   volumes:
     postgres_data:

   ```

5. Gem og luk filen med `Ctrl+X` og `Y` og `Enter`

6. Kør `docker compose`:

    ```bash
    sudo docker compose up -d
    ```

Så skulle postgres gerne køre. Du kan tjekke det ved at køre `docker ps` og se om containeren `db` kører.

## 2. Tilføj den nye remote Postgres server i PgAdmin (på din lokale maskine)

- Host name/address: <dit IP nummer på Dropletten>
- Port: 5432
- password: <dit_password> (se docker-compose.yml på din Droplet)

Husk at du skal have åbnet port 5432 i din Droplet Firewall for at kunne tilgå Postgres fra din lokale maskine. Dvs, fra IP nummeret på ydersiden af din router.

## 3. Bonus Docker Compose kommandoer

### Hvis du ønsker at stoppe Docker

```bash
  sudo docker compose down
```

### Nulstilling af Postgres (fjerner alle databaserne)

(-v) // remove volumes

```bash
 sudo docker compose down -v 
```

```bash
 sudo  rm -rf ./data
```

### Tjek loggen for postgres containeren

```bash
 sudo docker logs db
```

## Videre herfra

- [Næste trin](./snapshot.md)
- [Hop tilbage til oversigten](./README.md)
