# Netværksøvelser del 2: HTTP

## Opgave 1: Demo 03

1.1 Kør demo 03. Det gøres ved at starte serveren, åbne en browser,
og sende et HTTP request: <http://localhost:9090>. Hvad sker der?
1.2 Prøv også med <http://127.0.0.1>. Hvad sker der - og hvorfor?
1.3 Kig koden igennem - for forsøg at forklare din side-makker hvad der foregår. Lad dig evt. inspirere af README filen, der hører til projektet.
1.4 Der mangler en unit-test til demo 03. Prøv at lave den.
1.5 Prøv at udvide HTML-teksten, så du returnerer en lille ekstra
besked. F.eks. dit navn. Få hjælp til HTML her: [https://www.w3schools.com/html/html_elements.asp](https://www.w3schools.com/html/html_elements.asp)

## Opgave 2: Demo 04

2.1 Kør demo 04 ved at køre main i både `RequestDataServer` og bagefter `RequestDataClient`.
2.2 Kig i linie 26 i `RequestDataClient`. Den første såkaldte `request-line` hedder: `POST /path/to/endpoint HTTP/1.1`. Hvad betyder det? Og specielt hvad betyder `POST`?
2.3 Kig i linie 25 i `RequestDataClient`. Kan du forklare hvad `key1=value1&key2=value2` repræsenterer? Altså hvad de kan bruges til? Hint: det har noget med `POST` at gøre.
2.4 Se nøje på hvordan `RequestDTO` opbygges. Prøv at flytte al kode, der har med den del at gøre ud i sin egen klasse, som foreslået i koden. Få demo 04 til at fungere med den eksterne klasse.

## Opgave 3: Demo 05

3.1 Kør demo 05 ved at eksekvere main i både `RequestFileServer` og `RequestFileClient`. Prøv også at køre unit-testen.
3.2 Prøv at forklare hvad der sker til din sidemakker. Lad jer inspirere af teksten i projektets README fil.
3.3 Refaktorer koden, så `RequestDTO` og den kode som hører dertil
anvender samme klasse som den du lavede i demo 04.
3.4 I linie 57-61 er indsat en TODO note, der beskriver hvordan
du kan ændre demo 05, så du i stedet for klienten, kan kalde serveren
fra en browser. Brug IntelliJ's TODO fanebladsfunktion til at finde de steder du skal refaktorere. Du skal bare udkommentere linie 54+55 og indkommentere 57-61. Så ruller det.
3.5 Kør `RequestFileServer` og send et request fra din favoritbrowser. Du skal hente [http://localhost:9090/pages/index.html](http://localhost:9090/pages/loginform.html). Klik evt. bare her.
3.6 Lav en ekstra fil i `resources/pages og kald den`login.html`. Lav en htmlside med indholdet:

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

3.7 Kør `RequestFileServer` og derefter fyr [http://localhost:9090/pages/login.html](http://localhost:9090/pages/login.html) af i din browser. Hvad sker der?

3.8 Kør `RequestFileServer` og klik på `login` knappen. Sørg for at have "Network" fanebladet åbent i dev-tools i browseren. Tjek diverse headere og payload. Hvad ser du?

3.9 Det er lidt bøvlet, at vi hele tiden skal genstarte webserveren.
Altså demo 05 `RequestFileServer`. Se om ikke du kan lade den stå
åben og vente på flere requests. I stil med vores `EchoServer` i demo 02.

3.10 Se om ikke du kan udskrive request variablerne ud (hvis der er nogle). I dette tilfælde firstname=john&lastname=doe.

<hr/>

[Tilbage til overblik](./exercises_overview.md)
