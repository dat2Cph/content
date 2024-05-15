---
title: SQL Classic
layout: default
parent: Databaser
nav_order: 3
permalink: /databases/sql/
---

# SQL Classic

Denne dag handler om SQL.

_SQL (udtales "see-que-el") er en forkortelse for Structured Query Language. SQL bruges til at kommunikere med en relationel database._

Vi skal omkring disse emner:

[DDL (Data Definition Language)](https://www.postgresql.org/docs/15/ddl.html): DDL eller Data Definition Language er de SQL kommandoer, som bruges til at definere og ændre tabelstrukturen i en database.

- CREATE – opret en database med diverse objekter (tabeller, indeks, views etc).
- DROP – fjern objekter fra databasen (tabeller, index, views etc)
- ALTER - bruges til at ændre database-strukturen
- TRUNCATE – fjern alle rækker i en tabel[l](https://www.postgresql.org/docs/15/queries.html)

[Queries](https://www.postgresql.org/docs/15/queries.html): Kommandoer bruges til at udvælge data fra en database.

- SELECT – anvendes til at udvælge data fra en eller flere tabeller

[DML (Data Manipulation Language)](https://www.postgresql.org/docs/15/dml.html): Kommandoer der anvendes til at manipulere data i en databases tabeller

- INSERT – is used to insert data into a table.
- UPDATE – is used to update existing data within a table.
- DELETE – is used to delete records from a database table.

De fleste af kommandoerne skal vi eksekvere via den grafiske brugergrænseflade i pgAdmin4 Workbench.

Og så skal vi lave count, avg, sum, joins og meget mere.

Du kan læse mere om [SQL forespørgsler her](https://www.w3schools.com/sql/default.asp)

## Opgaver

- [Classic Models Exercise](https://cphbusiness.mrooms.net/mod/lesson/view.php?id=654320)

- [Vejledende løsninger til dagens opgaver](../docs/classicmodels_solutions.sql)

### Dagens præsentation

- [SQL-intro](../docs/sqlintro.pdf)
