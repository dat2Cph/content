---
title: Øvelser
description: Øvelser om netværk og http
layout: default
nav_order: 4
parent: HTTP og netværk
has_children: true
permalink: /network/exercises/
---

# Introduktion til ugens emne og øvelser

Før vi går i gang, er det vigtigt, at du har et overordnet billede af hvor vi er på vej hen og hvad vi forsøger at lære i hver øvelse. Derfor denne oversigt.

## Den overordnede historie

Formålet med denne uge på 2. semester er at give en introduktion til netværk og netværksprogrammering. Og hvorfor er det nu interessant?

Det er det fordi mange i dag arbejder med udvikling af software, der skal kunne anvendes af mange samtidige brugere og systemer.

Netværksapplikationer spænder bredt. Webapplikationer er nok det eksempel de fleste af os kender bedst til i hverdagen. Det kunne også være online spil, mobilapplikationer, der trækker på server data, finansielle systemer osv. Listen er uendelig. Fællesnævneren er, at vores software skal kunne kommunikere på tværs af systemer og maskiner. Så **kommunikation i netværk** er nøgleordet.

![Network](../img/steampunkserver.webp)

## Målet på 2. semester

Et af de overordnede mål på 2. semester, er at kunne bygge et dynamisk website, der kører på en virtuel server i "skyen". Dvs, et website der er offentligt tilgængeligt 24/7, og som kan lade brugere logge på med nogle rettigheder, dele, redigere, slette og opdatere data, som ligger i en database.

I praksis skal vi udvikle vores website med nogle "færdige" teknologier (kaldes også for en **tech stack**):

- **Java**. Vores velkendte objektorienterede programmeringssprog.
- **Javalin**. Et såkaldt mikroframework til Java, som gør det lettere at udvikle websites.
- **Jetty**. En moderne webserver og servletcontainer, som kan håndtere mange samtidige brugere, og som er bygget til at afvikle Javabaserede backends.
- **Postgresql**. En database server, der bryster sig af at være den mest avancerede, open source, relationelle database i verden.
- **HTML** og **CSS**. Disse frontendteknologier anvender vi til brugergrænsefladen

Hele vores **tech stack** er i øvrigt open source og skalerbare til mange millioner hits i døgnet.

Alle disse teknologier ville ikke kunne spille sammen, hvis ikke vi havde et underliggende netværkslag. Det som gør kommunikationen mulig. Som udviklere behøver vi ikke nødvendigvis at være eksperter i netværksdelen. Vi anvender en række methoder, som indkapsler (eng: wrapper) de dybere lag i kommunikationen. Specielt de lag som operativsystemet tager sig af. Men der er en **gråzone** af viden og begreber, som er gode at kende til. Vi kalder det for en **gråzone** fordi man ikke helt kan definere hvad der er vigtigt at kende til - og hvor meget. Ligesom man ikke behøver at kende til vandpumper og varmelegemer for at kunne bruge sin opvaskemaskine derhjemme, men det er meget godt at vide lidt om salt og afspænding til maskinen og hvordan man renser filteret. Så vi er ude i et emne, som hører til **almen dannelse** som softwareudvikler.

Her er en stak forkortelser og begreber vi kommer til at beskæftige os med:

Protocol, HTTP, HTTPS, SSL, DNS, IP, localhost, Port, Socket, TCP/IP, UDP, URL, URI, Client, ServerSocket, LAN, WAN, headers, requests, responses, status codes, PrintWriter, BufferedReader,
InputStreamReader, HTML, CSS.

## Vejen til målet på 2. semester

I netværksdelen af 2. semester har vi to dele:

### Teori

Vi vil gennemgå lidt teori om de ovenstående netværksbegreber. Vi kommer ikke til at gå i dybden, men nok til at give en grundliggende forståelse.

### Praksis

Vi har lavet en stak øvelser og noget demokode i Java, hvor vi skal eksperimentere med teorien i praksis. I første omgang skal vi anvende nogle demoer, der er lavet med henblik på at vi skal nå vores mål. Altså at kunne konstruere et lille website, der kører på vores egen hjemmebyggede webserver. Senere på semestret skal vi jo bygge websites i **Javalin** og med en professionel webserver (**Jetty**). Men først skal vi bygge vores egen lille udgave for at få en god fornemmelse af hvordan det hele virker. Håbet er selvfølgelig, at vi får en flyvende start når vi skal til at anvende **Javalin**, og at vi undgår at skulle acceptere for meget "sort magi".

De første øvelser handler om den mest primitive netværkskommunikation. Vi skal bare skabe forbindelse mellem en klient og en server - og så sende en enkelt linie tekst afsted. Derefter bygger vi stille og roligt funktionalitet på, så vi til sidste kan hente en rigtig webside.

Øvelserne er fordelt på tre opgavesæt, som vi arbejder på hele ugen.

- Del 1: [TCP/IP og Sockets](./exercises01_sockets.md)
- Del 2: [HTTP og websider](./exercises02_http.md)
- Del 3: [Byg din helt egen webserver](./exercises03_webserver.md)
