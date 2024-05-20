---
title: Opgave i normalisering og modellering
description: Indledende opgave i normalisering og modellering
layout: default
permalink: /databases/exercise-normalization/
nav_exclude: true
---

# Opgave i normalisering og modellering

Tabellen nedenfor indeholder oplysninger fra revisionsfirmaet "Tørre Tal" omkring deres virksomhedskunder og en masse fake data om kunderne til brug for regnskabet. Data mangler en ordentlig struktur, så nu skal det lægges ned i en relationel database med en række tabeller.

Der er selvfølgelig en række problemer med den form data forefindes i. Data er bestemt ikke på hverken 1., 2. eller 3. normalform. Det er heller ikke klart hvordan data skal forstås. Du får nok brug for at stille nogle spørgsmål for at få afklaret nogle af sammenhængene. F.eks. har revisionsfirmaet en række kunder, som også har kunder. Det er jo noget rod rent begrebsmæssigt. Så vi vil anbefale, at man ser bort fra selve revisionsfirmaet, og tænker modellen som en samling af firmaer, der har nogle afdelinger, som igen har et antal kunder. At firmaerne så er revisionsfirmaets kunder er så en anden snak.

1. Dan jer selv et overordnet billede af klasserne ved at skitsere et domænediagram.
2. Begynd at lave et ER diagram i Postgres og opret tabellerne via [værktøjet](https://www.pgadmin.org/docs/pgadmin4/latest/erd_tool.html).
3. Beskriv hvad der skal gøres for at bringe data på 1NF, og lav det på modellen
4. Beskriv hvad der skal gøres for at bringe data på 2NF, og lav det på modellen
5. Beskriv hvad der evt. skal gøres for at bringe data på 3NF, og lav det på modellen
6. Fyld lidt data i tabellerne
7. Lav et par simple sql forespørgsler:
   1. Vis alle virksomhederne i databasen (vis kun navnet på virksomhederne)
   2. Vis alle ansatte og deres mobiltelefonnummer
   3. Vis alle ansatte som bor i 2200 Kbh N
   4. Vis alle aktuelle kunder for Holte Vins afdeling på Kalvebod Brygge
   5. Lav selv flere og evt mere avancerede forespørgsler

| Virksomheds ID | Virksomhedsnavn | Afdelingsnummer | Afdelingsadresse              | Afdelingsleder | Afdelingsleder mobil | Ansat           | Ansat mobil | Ansat hjemmenr | Ansat adresse            | Adgang til firmabil | Firmabil max passagerer | Ansættelsesdato | Aktuelle kunder                 |
|----------------|-----------------|-----------------|-------------------------------|----------------|----------------------|-----------------|-------------|---------------|--------------------------|---------------------|------------------------|-----------------|--------------------------------|
| 32303098       | Holte Vin       | 1               | Nedervænget 22, 3000 Helsingør| Martin Duus    | 49884432             | Frederik Hansen | 22983554    | 40992843      | Ledregade 32, 2200 Kbh N | AJ 32 988           | 3                      | 2011/01/31      | Nordea, ISS, Mærsk data,       |
| 32303098       | Holte Vin       | 1               | Nedervænget 22, 3000 Helsingør| Martin Duus    | 49884432             | Birthe Jensen   | 49835039    | 55939500      | Vejsensgade 9, 2200 Nørrebro | AJ 32 988        | 3                      | 2013/10/23      | Nordea, Mærsk data, Honglins grill |
| 32303098       | Holte Vin       | 2               | Kalvebodbrygge 3, 1402 Kbh    | Allan Malling  | 32342565             | Hassan Al Midi  | 44993805    | 49993805      | Nørregade 3, 1504 Kbh    | DD 59 300          | 5                      | 2017/08/09      | Støvsuger

*Hvis du hellere vil se tabellen i Excel format, så [download den her](../docs/opg_normalisering_kunde_db.xlsx)*

Du kan læse om de forskellige [data typer i Postgres her](https://www.postgresql.org/docs/current/datatype.html).

Her er den samlede [dokumentation for Postgres](https://www.postgresql.org/docs/15/index.html).

Her er en fin oversigt over [syntaks og semantik for SQL forespørgler hos w3schools](https://www.w3schools.com/sql/default.asp).

<!--
## Forslag til løsning

![Solution Suggestion](https://i.imgur.com/us8SosS.png)

Bemærk de følgende antagelser:

- En medarbejder er knyttet til netop en afdeling
- En afdelingsleder er også en medarbejder
- Virksomhederne har en eller flere afdelinger
- Hver afdeling har et antal kunder tilknyttet
- Hver kunde kan kun være tilknyttet en afdeling
- Kunderne er tilknyttet en eller flere medarbejdere
- Flere kunder kan godt bo på den samme adresse
-->