---
title: Læringsmål
description: Læringsmål for databaser
layout: default
parent: Databaser
nav_order: 1
permalink: /databases/learningobjectives/
---

# Læringsmål for databaser

## Uge 1: Normalisering og SQL

Efter den første uge er det meningen at du kan:

1. installere Postgresql og PgAdmin i en Docker container og overordnet forklare hvordan applikationerne er i stand til at køre og arbejde sammen.
2. designe en database med tabeller og relationer, samt datatyper på kolonnerne og "constraints", der hjælper med at sikre dataintegriteten.
3. anvende teori om normalformer i praksis og bringe en database på 3NF.
4. anvende sql til at udføre CRUD (Create, Read, Update og Delete) operationer på databasen for at manipulere data.
5. forklare forskellen på DDL: Data Definition Language og DML: Data Manipulation Language.
6. udarbejde et ER-diagram og omsætte det til en fysisk datamodel og til et sql script
7. udføre komplekse udtræk af data fra en sql-database med flere sammenkædede tabeller.
8. anvende aggregate funktioner, som SUM, COUNT, GROUP BY til diverse sammentællinger
9. kan oprette og anvende views

## Uge 2: Java, JDBC og integrationstest

Efter den anden uge er det meningen at du kan:

1. oprette og benytte en Connection / forbindelse til Postgres via JDBC

2. gøre rede for de mest anvendte strategier for synkronisering af data mellem Java og databasen
   - Hvilke datatyper- og strukturer bruger vi i Java til at holde data?
   - Hvad svarer de til i Postgres?
   - Hvordan "mapper" vi disse data fra Java til Postgres og den anden vej?
   - Hvordan sørger vi for at data i Java og Postgres er de samme?

3. implementerere CRUD operationer på en database via JDBC via en datamapper.
   - "C" = "Create" = insert statementments i SQL
   - "R" = "Read" = select statements i SQL
   - "U" = "Update" = update statements i SQL
   - "D" = "Delete" = delte statements i SQL

4. håndtere besværlige datatyper i Java og Postgres (fx dato og tid)
   - Opret attributter i Java, der indeholder en dato, et tidspunkt (klokkeslet) og en der indeholder begge. F.eks. som LocalDate, LocalTime og LocalDateTime.
   - Vis hvordan man gemmer attributterne i en tabel i Postgres
   - Vis hvordan man henter de tilsvarende felter fra en række i Postgres og gemmer dem i Java

5. håndtere autogenerede identiteter ved inserts
   - Forklar hvorfor vi nogle gange kan have behov for at få et `id` tilbage fra en netop oprettet række i Postgres. Altså når id'et er genereret af Postgres.
   - Hvordan gør vi i Java? Hint: brug af Statement.RETURN_GENERATED_KEYS og getGeneratedKeys().

6. indsætte data i parent og child tables ved brug af fremmednøgler
   - Det betyder, at vi f.eks. i `sportsclub` databasen opretter et nyt medlem, og i samme ombæring tilmelder medlemmet nogle hold ved at indsætte nogle rækker i `registration` tabellen.

7. opsætte og gennemføre integrationstest af databaseapplikationer
