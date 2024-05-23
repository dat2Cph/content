---
title: Opgave i integrationstest (bibliotek)
description: Indledende opgave i integrationstest på localhost
layout: default
parent: Databaser
permalink: /databases/exercise_bibliotek_jdbc/
nav_exclude: true
---

# JDBC og Test for bibliotek DB

Denne torsdag er sat af til følgende:

1. Færdiggørelse af ugens opgaver du ikke har nået endnu
2. Lav den nedenstående opgave, hvor du skal implementere et bibliotekssystem i Java inspireret af datamodellen fra [normaliseringsartiklen](../docs/normalisering_v1.1.pdf) fra sidste uge

## Bibliotekssystem i Java og Postgres

Her er et ER-diagram, som cirka repræsenterer tabellerne på 3NF fra artiklen:

![ER-diagram](https://i.imgur.com/9vOkudp.png)

I sidste uge, oprettede vi en database for biblioteket i Postgres via pgAdmin. Hvis du ikke har fået det til at virke, så kan du skyde genvej ved at:

1. Opret en database i Postgres ved navn "bibliotek"

2. Kør dette [SQL-script](../docs/bibliotek_create_db.sql) i pgAdmin.

3. I sidste uge lavede vi følgende SQL-forespørgsler:
   1. Find en låner ud fra et specifikt laaner_id.
   2. Find alle lånere, og vis deres data inklusive postnummer og by.
   3. Find alle bøger, og deres forfattere
   4. Find alle lånere og de bøger de har lånt. Medtag også bogtitler og evt. forfatter

4. Vi lavede også følgende DML sætninger:
   1. Indsæt en ny låner (insert)
   2. Opret et nyt udlån af en bog (insert)
   3. Fjern et udlån (delete)
   4. Rediger en bogtitel (update)

Her kan du finde [forslag til løsninger](../docs/bibliotek_sql_queries.sql).

## Ugens opgave

Lav et nyt Maven Javaprojekt i IntelliJ

1. Lav en Connectionklasse, hvor du kan lave en DB connection til biblioteksdatabasen
2. Lav en DataMapper ("BibliotekMapper") og en række metoder, som svarer til 3.1, 3.2, 3.3, 3.4,  4.1, 4.2, 4.3 og 4.4.
3. Lav en klasse ("DBtester"), hvor I kalder metoderne i DataMapper'en og viser data. Brug bare "System.out.println()" osv og kald metoderne fra "Main()".
