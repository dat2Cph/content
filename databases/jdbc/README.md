---
title: JDBC
description: Introduktion til JDBC i Java
layout: default
parent: Databaser
nav_order: 4
permalink: /databases/jdbc/
---

# JDBC

## Java og Databaser

Denne uge skal bruges på at arbejde med Postgres databaserne via Java og JDBC. I sidste uge brugte vi udelukkende pgAdmin som SQL-klient, men nu skal vi selv programmere diverse CRUD operationer fra Java.

Emnerne bliver ca. disse:

- Connection / forbindelse til Postgres via JDBC
- Strategier for synkronisering af data mellem Java og databasen
- CRUD operationer og Views
- Håndtering af besværlige datatyper (fx dato og tid)
- Håndtering af autogenerede identiteter ved Inserts

## Opgaver

Dagens opgave tager udgangspunkt i denne klub-database.

![klub-database](https://i.imgur.com/1r6vWNU.png)

Formålet med opgaven er at tilgå databasen fra Java, og i det hele taget at få øvelse i at håndtere databaser. Der ligger noget startkode på GitHub, så vi kommer lidt hurtigere i gang. Koden indeholder alle CRUD operationer til member-tabellen. Så skal I bare fortsætte derfra.

- Selve [opgavebeskrivelsen ligger sammen med koden på GitHub](https://github.com/dat2Cph/dat2-sportsclub)

Der er en gennemgang af hvordan opgaven kan løses i [denne video](https://cphbusiness.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=1d2e2b6c-6a04-4be4-b645-ae54014e2f79) (og i starten vises også hvordan man cloner startkoden fra git). Bemærk igen at der bruges MySQL i videoen.
