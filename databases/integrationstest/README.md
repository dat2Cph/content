---
title: Integrationstest
description: Introduktion til integrationstest på localhost
layout: default
parent: Databaser
nav_order: 5
permalink: /databases/integrationtest/
---


# Java, Databaser og Integrationstest

Når man bygger større systemer, vil man gerne sikre sig at ens datamappere virker. Så vi introducerer en metode til automatiseret test af vores database metoder - og som tjekker at der overhovedet er hul igennem til databasen. Det er en slags unit-test, men da den involverer flere delsystemer (Java og Postgres) kaldes det ofte for "Integrationstest".

## Hvad er en integrationstest?

Der er ingen klar definition på hvad en integrationstest er, men vi kan vende den om, og sige, at det er _ikke_ en unit test hvis (inspireret af Michael Feathers: _Working Effectively With Legacy Code_):

- den kommunikerer med databasen
- den kommunikerer over netværket
- den rører filsystemet
- den ikke kan køre samtidig med enhver af dine andre unit tests
- du har brug for at gøre specielle ting ved miljøet for at køre testen.

Der er med andre ord flere systemer i spil, som hver for sig kan (bør) være unit testede og nu vil vi gerne teste om de også kan køre sammen (integrerede).

## Principper for integrationstest med database

Normalt starter mapper metoder med at bede om en databaseforbindelse. Forbindelsen specificerer, hvilken database, der skal anvendes.

Idéen er at lave en _testdatabase_ (så vi ikke tester direkte på produktionsdatabasen), og give mapper’en en forbindelse til testdatabasen, som kan anvendes under test.

Dette involverer disse trin:

1. Opret en testdatabase
2. I testdatabasen oprettes de samme tabeller som i den oprindelige database. Dog uden data.
3. Gør det muligt for mapper’en at bruge en anden forbindelse (vha. dependency injection).
4. Før hver test fjernes alle rækker i testdatabasens tabeller så der startes på en frisk.
5. Når alle rækker er fjernet, indsættes et antal rækker i tabellerne, så man har fuldkommen styr på hvilke data, som ligger i testdatabasen før hver test køres.
6. Skriv test metoder
7. Kør dine test

### Sådan udfører vi en integrationstest

- [GitHub Repo](https://github.com/dat2Cph/dat2-sportsclub/tree/integrationtest). Det er det samme repo, som vi brugte i går, men den nye kode vi skal bruge i dag har fået tilføjet exeception handling og integrationstest. Den nye kode ligger i sin egen branch "integrationtest" og skal derfor clones med kommandoen:

```bash
git clone -b integrationtest git@github.com: git@github.com:dat2Cph/dat2-sportsclub.git
```

- Der er en gennemgang af hvordan opgaven kan løses i [denne video](https://cphbusiness.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=940330d7-5824-4a97-9ea8-ae550008a069) (og i starten vises også hvordan man cloner startkoden fra git). Bemærk igen at der bruges MySQL i videoen.
