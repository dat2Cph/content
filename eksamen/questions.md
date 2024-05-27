---
title: Eksamensspørgsmål
description: Typiske spørgsmål til eksamen
layout: default
parent: Eksamen
nav_order: 2
permalink: /exam/questions/
---

# Typiske spørgsmål vi kunne tale om til eksamen

## Første semester

Emnerne fra 1. semester indgår implicit i pensum. Dvs, at det forventes at du har kendskab til dem og kan anvende dem. I praksis har I jo brugt de fleste Java konstruktioner og teknologier I Carport-projektet, så derfor vil spørgsmål til stoffet som regel tage udgangspunkt I jeres projekt. Men her er en oversigt:

**Grundlæggende kendskab til Javaprogrammering:**

1. Simple datatyper
2. Arrays
3. Metoder
4. Løkker
5. Logiske operatorer og kontrolstrukturer
6. Objekter, referencer, indkapsling, nedarvning, polymorfi, interfaces
7. Collection framework (List, Map, Set)
8. Exceptions (try-catch)
9. Debugging
10. Junit tests
11. Scanner
12. Skrivning og læsning fra filer

## Andet semester

### HTTP, servere og netværk

* Hvad er IP numre og porte
* Hvad er DNS?
* Hvad er en protokol og hvilke har vi anvendt på 2. semester?
* Hvad er klient/server princippet?
* Hvordan fungerer en webserver og hvordan henter man en html-side?
* Hvad er http protokollen og GET/POST?

### Linux - SSH på droplet

* Hvad er en virtuel maskine / Droplet? Og hvordan satte vi vores VM op? Hint: [tjek denne oversigt](../linux_and_deployment/README.md)
* Hvad er ssh? Vis hvordan du logger på din droplet.
* Kan du huske hvad vi gjorde af sikkerhedsforanstaltninger for at sikre os imod diverse angreb?

### Postgres på droplet (virtuel maskine)

* Kan du vise hvordan man ser sine databaser på Dropletten?
* Hvordan genstarter man Postgres på Dropletten?
* Hvordan fungerer det med brugeradgang?
* Hvordan overfører man en database fra sin udviklingsmaskine til dropletten?

### Database

[Alt om normalisering her](../databases/normalisering/README.md)

* Hvad er formålet med normalisering?
* Forklar fordele og ulemper ved normalisering?
* Gør rede for hvad primær- og fremmednøgler er
  * Vis et eksempel i Postgres med mindst to tabeller, som er forbundet via en fremmednøgle
* Forklar hvad et join mellem to tabeller er, og hvad formålet med joins er:
  * Vis et eksempel i Postgres på en select-sætning, hvor data fra mindst to tabeller joines
* Vis de grundlæggende CRUD operationer i SQL og hvordan de anvendes fra Java

### GIT

* Beskriv overordnet hvilken rolle GIT spiller i jeres udviklingsarbejde?
* Beskriv jeres arbejdsgang
* Opstod der nogle problemer undervejs? Beskriv gerne.
* Hvad er en branch – og hvordan bruger man dem?
* Hvordan fungerer Pull Requests - og hvad er formålet med dem?

### Webprogrammering Frontend

* Hvordan har I sikret at brugerne får en god oplevelse? Hint: [UX/UI design](https://lawsofux.com/en/)
* Hvad er gestalt love?
* Hvad er responsivt webdesign?
* Kan du forklare jeres navigationsdiagram?

### Webprogrammering backend (Javalin)

Beskriv hvordan I har anvendt følgende i Javalin:

* Routing (get/post)
* Kommunikation mellem Front og backend (hint: [tjek denne oversigt](../webstack/backend/javalin/javalin_how_to.md#1-how-to-transfer-data-between-frontend-and-backend))
* Session scope
* Request scope
* Form parametre
* URL parametre
* ConnectionPool / Datamappere?

### Webprogrammering frontend

Beskriv hvordan I har anvendt:

* Thymeleaf
* HTML
* CSS

### Arkitektur og mønstre

[Tjek evt denne reference om mvc](../toolbox/designpatterns/mvc.md)

* Hvad er formålet med en fler-lags arkitektur og hvordan kan det se ud?
* Forklar MVC og hvordan I har evt. har anvendt MVC i jeres kode.
* Hvad er en singleton?
* Objektorientering: encapsulation, high cohesion, low coupling

### SVG

* Hvordan har I brugt det I projektet?

### Tests og kvalitetssikring

* [Tjek reference om teori](../toolbox/test/testteori.md)
* [Tjek referene om integrationstest](../projects/carport/integrationstest/README.md)

* Hvad er en acceptest?
* Hvad er forskellen på black og white box tests?
* Hvad er en unit-test. Vis eksempel i jeres projekt.
  * Forklar hvad der foregår i de tre faser: arrange, act og assert
  * Vis et kodeeksempel, hvor du tester en metode i praksis
  * Hvad er ækvivalens-klasse-partitionering. Vis nogle eksempler.
* Hvad er integrationstest? Vis eksempel i jeres projekt. I behøver ikke selv at lavet koden.
* Fejlhåndtering, consol, log, håndtering i servlet

### Fejlhåndtering (Exceptions)

[Tjek denne reference](../toolbox/java/exceptions.md)

* Hvordan håndteres exceptions i eksamensprojektet?
* Hvordan laver man sine egne exceptions (custom exceptions)?
* Hvad er try-catch-finally?
* Hvad er forskellen på checked og unchecked exceptions?
* Hvad er forskellen på compiletime og runtime fejl?
* Hvordan logges jeres fejl – og hvorfor er logging praktisk?

### Domænemodel

[Tjek denne video](https://www.youtube.com/watch?t=1&v=GqGL4X_-hW4)

* Hvordan laver man en DM?
* Hvad bruges en DM til i systemudviklingsforløbet?

Kanban og user stories:

[User stories](../toolbox/sys/requirements/userstories.md)
[Kanban](../toolbox/sys/projectmanagement/kanban.md)

* Hvad er Kanban?
* Hvad er en User Story? Hvordan beskrives den og hvad indeholder den?
* Hvordan har I arbejdet med jeres krav i semesterprojektet?
* Hvordan organiserer man et Systemudviklingsforløb i KanBan?
* Hvad er DOD (definition of done) og hvordan bruges det?

### Diverse diagrammer

Hvad bruger man dem til og typisk hvornår i udviklingsforløbet? Hvem gavner de forskellige diagrammer?

[Tjek denne reference](../toolbox/sys/uml/tutorials.md)

* Usecase-diagram (UML)
* [Aktivitets-diagram](../toolbox/sys/uml/docs/Larman-28-Activity-diagrams.pdf) og [denne video](https://www.youtube.com/watch?t=1&v=aKASc_lcQ_0?t=1) (UML)
* [Domæne-diagram](https://www.youtube.com/watch?t=1&v=GqGL4X_-hW4) (UML)
* Tilstandsdiagram / navigationsdiagram (UML)
* ERD

### Forretningsforståelse

Forklar hvad disse metoder går ud på og hvad formålet med dem er:

* [Risikoanalyse](../business/README.md)
* [Interessentanalyse](../business/README.md)

Hint: [tjek alle materialer om forretningsforståelse her](../business/README.md)
