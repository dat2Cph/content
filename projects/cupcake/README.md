---
title: Cupcake projekt
description: Oplæg til Cupcake projekt
layout: default
has_children: true
parent: Projekter
nav_order: 2
permalink: /projekter/cupcake
---

# Cupcake projekt

![Image](https://i.imgur.com/iGlmYeK.png)

## Baggrund

Vi har landet en vigtig opgave fra Olsker Cupcakes. Det er endnu et dybdeøkologisk iværksættereventyr fra Bornholm, som har ramt den helt rigtige opskrift. Et par hipstere fra København har været forbi bageriet, og indsamlet nogle krav og lavet en halvfærdig mockup af en tænkt forside. En mockup er en meget løs skitse, som viser hvordan det færdige website skal se ud. Det er selvfølgelig ikke alt som er med, og som er tænkt igennem, så det er vores opgave at stille spørgsmål til manglende funktionalitet, komme med forslag osv.

Når man som leverandør skal løse sådan en opgave, er det godt at dele opgaven op i små etaper. Så tænk fra starten over hvor lidt vi kan lave for at få den første prototype i luften. Med andre ord: vi skal ikke lade os forblænde af hipsternes farver og striber og mange funktionaliteter. Vi æder elefanten lidt ad gangen.

## User stories (funktionelle krav)

Det første kundemøde mundede ud i en række såkaldte user-stories. De beskriver på kort form hvilke brugere, som har hvilke behov og hvad de ønsker at opnå. Det kan godt være at der dukker flere user-stories op undervejs i processen, eller I vælger at stryge nogle af dem:

**US-1:** Som kunde kan jeg bestille og betale cupcakes med en valgfri bund og top, sådan at jeg senere kan køre forbi butikken i Olsker og hente min ordre.

**US-2** Som kunde kan jeg oprette en konto/profil for at kunne betale og gemme en en ordre.

**US-3:** Som administrator kan jeg indsætte beløb på en kundes konto direkte i Postgres, så en kunde kan betale for sine ordrer.

**US-4:** Som kunde kan jeg se mine valgte ordrelinier i en indkøbskurv, så jeg kan se den samlede pris.

**US-5:** Som kunde eller administrator kan jeg logge på systemet med email og kodeord. Når jeg er logget på, skal jeg kunne se min email på hver side (evt. i topmenuen, som vist på mockup’en).

**US-6:** Som administrator kan jeg se alle ordrer i systemet, så jeg kan se hvad der er blevet bestilt.

**US-7:** Som administrator kan jeg se alle kunder i systemet og deres ordrer, sådan at jeg kan følge op på ordrer og holde styr på mine kunder.

**US-8:** Som kunde kan jeg fjerne en ordrelinie fra min indkøbskurv, så jeg kan justere min ordre.

**US-9:** Som administrator kan jeg fjerne en ordre, så systemet ikke kommer til at indeholde udgyldige ordrer. F.eks. hvis kunden aldrig har betalt.

## Ikke-funktionelle krav

1. Der laves en mockup i Figma eller lignende, som viser de websider den færdige løsning kommer til at bestå af.
2. Ordrer, kunder og øvrige data skal gemmes i en database.
3. Databasen skal normaliseres på 3. normalform med mindre andet giver bedre mening.
4. Kildekoden skal deles på GitHub.
5. Det færdige produkt skal udvikles i Java 17, Javalin, Thymeleaf template engine, Postgres Database, HTML og CSS.
6. Websitet skal helst kunne fungere tilfredsstillende både på en almindelig skærm og på en mobiltelefon (iPhone 12 og lignende). Hvis det volder problemer, så lav kun jeres løsning til en laptop.

## Deliveries (det som skal leveres)

1. Et ERD over databasen.
2. Et kørende website, som løser Olsker Cupcakes behov. Vi har ikke lavet en virtuel maskine i skyen til at hoste vores website på nettet, så det er fint nok at I kan vise løsningen frem på jeres egen laptop.
3. Hver user story implementeres en ad gangen. Kunden vil som minimum se en løsning på de første seks. I skal selv prioritere rækkefølgen af user stories og gerne komme med et gæt på hvor lang tid det tager at lave dem.
4. Når de første 6 user-stories er implementeret, tager I resten en ad gangen og ser hvor langt I når.
5. Der skal leveres en lille rapport og anden teknisk dokumentation. Det optimale ville være hvis I er færdige med at kode webshoppen i løbet af mandag i projektets uge-2, og så bruger et par dage på dokumentationen. 
6. I skal også indsætte et link i rapporten til en kort video-demo af jeres færdige løsning. Brug et screencast værktøj og sørg for at videoen ikke varer længere end 2-3 minutter. I kan fx bruge [screenpal](https://screenpal.com/screen-recorder) eller optagefunktionen i Zoom eller Panopto. Videoen kan I uploade til YouTube på et skjult link eller lignende.

## Aflevering af opgaven (deadline og links)

1. Opgaven skal laves i grupper med 2-4 personer i hver. Gruppetilmelding foretages på Moodle. Der gives 30 study points for fuld medvirken til opgaven. Dvs, at man har taget tilstrækkeligt ansvar for gruppens arbejde, leveret en løsning og deltaget ved prøveeksamen.
2. Husk at skrive gruppenavn på opgaven.
3. Deadline for indlevering af kode og rapport kan ses på Moodle. Der afleveres et link til GitHub, hvor kode og rapport skal forefindes. Rapporten skal afleveres i pdf-format og ligges i en separat folder ved navn "rapport". Selve rapport-filen kaldes for "rapport.pdf".
4. Info om prøveeksamen følger.

### Ressourcer

Her kan I finde rapportskabelonen. Medtag de artefakter I finder relevante (og realistiske at medtage):

- [Rapportskabelon](./rapportskabelon.md)
- [Gruppekontrakt](../../teamwork/gruppekontrakt.docx)

#### UI stuff

- [Mockup](./docs/cupcake_mock.png). Det er desværre kun forsiden vi har fået udleveret og det er okay at ændre layoutet.
- [Headergrafik](./docs/cupcakelogo.png)

#### The Bottoms

| Bottom    | Price |
|-----------|-------|
| Chocolate | 5.00  |
| Vanilla   | 5.00  |
| Nutmeg    | 5.00  |
| Pistacio  | 6.00  |
| Almond    | 7.00  |

#### The Toppings

| Topping     | Price |
|-------------|-------|
| Chocolate   | 5.00  |
| Blueberry   | 5.00  |
| Rasberry    | 5.00  |
| Crispy      | 6.00  |
| Strawberry  | 6.00  |
| Rum/Raisin  | 7.00  |
| Orange      | 8.00  |
| Lemon       | 8.00  |
| Blue cheese | 9.00  |
