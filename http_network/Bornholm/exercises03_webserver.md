# Netværksøvelser del 3: webserver

## Opgave 1: Byg din egen webserver

1.1 I projektet er der oprettet en package `demo06_mywebserver`. Her skal du oprette din egen webserver. Prøv at bygge den fra bunden med inspiration i de andre servere. Den skal nok mest minde om demo 05. formålet med øvelsen er, at du får lejlighed til at tage stilling til al koden på egen hånd - og bevidst kopiere stumperne over i din egen webserver.

## Opgave 2: Læg to tal sammen

2.1 I folderen `pages/` ligger filen `adding.html`. Hvad kommer der
ud af at kalde filen fra en browser? Prøv.

2.2. Lav en en stump kode, der kan tage imod de to tal `firstnumber` og `secondnumber` og `operator`, indlæse htmlfilen og indsætte resultatet af beregningen på pladsen for `<!--$res-->`. Det gøres lettest ved at erstatte `<!--$res-->` med resultatet. Altså ved
at bruge metoden `replace` på response strengen inden den sendes afsted til klienten. Det kaldes en "template engine".

2.3 Refaktoriser din kode, så din skabelon kan fyldes med inputværdier via en metode. F.eks. kaldet: `String renderTemplate(String filename, Map<String, String> queryParams)` som tager
navnet på en html-fil og et hashmap med form-parametre, som skal indsættes i skabelonen. Methoden returnerer den færdigbryggede html-tekst.

2.4 Refaktoriser din "addNumber" fra opgave 2.2, så den bruger den nye renderTemplate metode.

2.5 Bonusopgave: lav en webside, der kan beregne dit BMI-tal. Se formel her: [BMI beregner](https://iform.dk/vaegttab/hvad-betyder-dit-bmi-tal)

<hr/>

[Tilbage til overblik](./exercises_overview.md)
