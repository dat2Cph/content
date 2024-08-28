---
title: HTTP
description: Øvelser i brug af http
layout: default
nav_order: 2
permalink: /network/exercises/exercise-02/
parent: Øvelser
grand_parent: HTTP og netværk
---
# Netværksøvelser del 2: HTTP

## Opgave 1: Demo 03

I demo 03 tager vi første kig på HTTP protokollen. Vi skal studere HTTP-request-og-response headere - og sende HTML afsted fra serveren.

1.1 Kør demo 03. Det gøres ved at starte serveren, åbne en browser,
og sende et HTTP request: <http://localhost:9090>. Hvad sker der?

1.2 Prøv også med <http://127.0.0.1:9090>. Hvad sker der - og hvorfor?

1.3 Kig koden igennem - for forsøg at forklare din side-makker hvad der foregår. Lad dig evt. inspirere af README filen, der hører til projektet.

1.4 Der mangler en unit-test til demo 03. Prøv at lave den.

1.5 Prøv at udvide HTML-teksten, så du returnerer en lille ekstra
besked. F.eks. dit navn. Få hjælp til HTML her: [https://www.w3schools.com/html/html_elements.asp](https://www.w3schools.com/html/html_elements.asp)

## Opgave 2: Parsing af headere

Begrebet `[parsing](https://ordnet.dk/ddo/ordbog?entry_id=11038980&query=parsing)` stammer fra datalogien. Det betyder at man tager en input-tekst og analyserer den ud fra en given syntaks. Formålet er at bruge teksten til noget fornuftigt, men først bliver vi nødt til at sørge for at teksten overholder nogle regler (syntaks). Mens vi parser teksten igennem, kan vi sørge for at gemme indholdet, eller betydningen, i nogle brugbare datastrukturer, som senere kan anvendes.

2.1 Analyser en header

Forestil dig disse tekstlinier:

```text
GET /pages/index.html HTTP/1.1
Host: www.example.com
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate, br
Connection: keep-alive
Upgrade-Insecure-Requests: 1
```

Se nøje på teksten. Hvordan er den bygget op? Kan du identificere nogle simple regler? Se om du kan formulere dem.

2.2 Lav en klasse, der hedder `HttpRequest`. Smæk den i en package du kalder `parsers`. Du skal nu vælge nogle attributter og datastrukturer, der kan holde dine elementer fra headerteksten. Et godt bud kunne være at behandle den først linie specielt. Du skal gemme HTTP-metoden i en `String`, url'en i en `String` og HTTP versionen også i en separat `String` variabel. Resten er (key: value) par. Hvad kender vi som er yderst velegnet til at rumme den slags?

Med de hints, så skriv nu metoden `parse(String header)`, æd dig igennem teksten og gem indholdet i de respektive datastrukturer.

Når det er gjort, kan du evt. skrive en metode til at udskrive de forskellige elementer fra dine datastrukturer. Efter denne øvelse, hvis du være godt klædt på til at gennemskue de næste.

## Opgave 3: Demo 04

3.1 Kør demo 04 ved at køre main i både `RequestDataServer` og bagefter `RequestDataClient`.

3.2 Kig i linie 26 i `RequestDataClient`. Den første såkaldte `request-line` hedder: `POST /path/to/endpoint HTTP/1.1`. Hvad betyder det? Og specielt hvad betyder `POST`?

3.3 Kig i linie 25 i `RequestDataClient`. Kan du forklare hvad `key1=value1&key2=value2` repræsenterer? Altså hvad de kan bruges til? Hint: det har noget med `POST` at gøre.

3.4 Se nøje på hvordan `RequestDTO` opbygges. Prøv at flytte al kode, der har med den del at gøre ud i sin egen klasse, som foreslået i koden. Få demo 04 til at fungere med den eksterne klasse.

## Opgave 3: Demo 05

4.1 Kør demo 05 ved at eksekvere main i både `RequestFileServer` og `RequestFileClient`. Prøv også at køre unit-testen.

4.2 Prøv at forklare hvad der sker til din sidemakker. Lad jer inspirere af teksten i projektets README fil.

4.3 Refaktorer koden, så `RequestDTO` og den kode som hører dertil
anvender samme klasse som den du lavede i demo 04.

4.4 I linie 57-61 er indsat en TODO note, der beskriver hvordan
du kan ændre demo 05, så du i stedet for klienten, kan kalde serveren
fra en browser. Brug IntelliJ's TODO fanebladsfunktion til at finde de steder du skal refaktorere. Du skal bare udkommentere linie 54+55 og indkommentere 57-61. Så ruller det.

4.5 Kør `RequestFileServer` og send et request fra din favoritbrowser. Du skal hente [http://localhost:9090/pages/index.html](http://localhost:9090/pages/index.html). Klik evt. bare her.

4.6 Lav en ekstra fil i `resources/pages og kald den`login.html`. Lav en htmlside med indholdet:

```html
<!DOCTYPE html>
<html>
<body>

<h2>HTML Forms</h2>

<form action="/pages/login.html" method="post">
    <label for="firstname">First name:</label><br>
    <input type="text" id="firstname" name="firstname" value="John"><br>
    <label for="lastname">Last name:</label><br>
    <input type="text" id="lastname" name="lastname" value="Doe"><br><br>
    <input type="submit" value="Login">
</form>

<p>If you click the "Submit" button, the form-data will be sent to a page called "/pages/login.html".</p>

</body>
</html>
```

4.7 Kør `RequestFileServer` og derefter fyr [http://localhost:9090/pages/login.html](http://localhost:9090/pages/login.html) af i din browser. Hvad sker der?

4.8 Kør `RequestFileServer` og klik på `login` knappen. Sørg for at have "Network" fanebladet åbent i dev-tools i browseren. Tjek diverse headere og payload. Hvad ser du?

4.9 Det er lidt bøvlet, at vi hele tiden skal genstarte webserveren.
Altså demo 05 `RequestFileServer`. Se om ikke du kan lade den stå
åben og vente på flere requests. I stil med vores `EchoServer` i demo 02.

4.10 Se om ikke du kan udskrive request variablerne ud (hvis der er nogle). I dette tilfælde firstname=john&lastname=doe.

<hr/>

[Tilbage til overblik](./README.md)
