---
title: Webserver
description: Øvelse i udvikling af lille webserver
layout: default
nav_order: 3
permalink: /network/exercises/exercise-03/
parent: Øvelser
grand_parent: HTTP og netværk
---

# Netværksøvelser del 3: webserver

I disse tre opgaver skal du trække på alt du har lært fra de forrige øvelser. Ideen er at du kan pusle med opgaverne til SchoolHacks og sådan lidt på sidelinien.

## Opgave 1: Byg din egen webserver

1.1 I projektet er der oprettet en package `demo06_mywebserver`. Her skal du oprette din egen webserver. Prøv at bygge den fra bunden med inspiration i de andre servere. Den skal nok mest minde om demo 05. formålet med øvelsen er, at du får lejlighed til at tage stilling til al koden på egen hånd - og bevidst kopiere stumperne over i din egen webserver.

De næste to øvelser er fra den dybe del af svømmebassinet. Specielt
fordi I ikke har fået en samlet indføring i HTML, og fordi
de bygger på alt det, der indgår i de første to dages øvelser.

Men giv dem et skud, og vær rar mod dig selv hvis det er for svært. Vi kan se på nogle forslag løsninger i næste uge.

## Opgave 2: Læg to tal sammen

2.1 I folderen `pages/` ligger filen `adding.html`. Hvad kommer der
ud af at kalde filen fra en browser? Prøv.

2.2. Lav en en stump kode, der kan tage imod de to tal `firstnumber` og `secondnumber` og `operator`, indlæse htmlfilen og indsætte resultatet af beregningen på pladsen for `<!--$res-->`. Det gøres lettest ved at erstatte `<!--$res-->` med resultatet. Altså ved
at bruge metoden `replace` på response strengen inden den sendes afsted til klienten. Det kaldes en "template engine".

2.3 Refaktoriser din kode, så din skabelon kan fyldes med inputværdier via en metode. F.eks. kaldet: `String renderTemplate(String filename, Map<String, String> queryParams)` som tager
navnet på en html-fil og et hashmap med form-parametre, som skal indsættes i skabelonen. Methoden returnerer den færdigbryggede html-tekst.

2.4 Refaktoriser din "addNumber" fra opgave 2.2, så den bruger den nye renderTemplate metode.

## Opgave 3: Bonusopgave: BMI beregner

3.1 Lav en webside, der kan beregne dit BMI-tal. Se formel her: [BMI beregner](https://iform.dk/vaegttab/hvad-betyder-dit-bmi-tal). Lav en webformular, hvor man indtaster højde og vægt. Den skal også have en submit knap, der sender et POST request til en modtagerside.

Her er lidt hjælp til HTML siden, der gemmes om en skabelon:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BMI Calculator</title>
</head>
<body>
    <h2>BMI Calculator</h2>
    <form action="/pages/bmicalc.html" method="POST">
        <label for="height">Height (cm):</label><br>
        <input type="number" id="height" name="height" required><br><br>
        
        <label for="weight">Weight (kg):</label><br>
        <input type="number" id="weight" name="weight" required><br><br>
        
        <input type="submit" value="Calculate BMI">
    </form>
</body>
</html>
```

<hr/>

[Tilbage til overblik](./README.md)
