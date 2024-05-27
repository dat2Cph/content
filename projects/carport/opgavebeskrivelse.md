---
title: 1. Opgavebeskrivelse
description: Beskrivelse af det som laves på semesterprojektet
layout: default
parent: Carport projekt
grand_parent: Projekter
nav_order: 1
permalink: /projekter/carport/description/
---

# Opgavebeskrivelse

Semesterprojektet er formelt set udgangspunktet for eksamen på 2. semester. I skal arbejde i teams, følge en struktureret systemudviklingsmetode, og udvikle en dynamisk webapplikation for en kunde. Kunden er i dette tilfælde Fog Trælast- og byggecenter.

Kravene til opgaven kan opsummeres således:

1. Det som skal udvikles (produktet)
2. Hvordan I skal samarbejde (processen)
3. Hvad der skal afleveres eller demonstreres (dokumentation)

## Krav til produkt

Projektet I skal arbejde på kaldes for ”Fog-projektet”, som præsenteres af en medarbejder fra Fog (Martin) i en video på denne side: ”[Besøg hos kunden](./kundebesog.md)".

I skal udvikle og til dels teste et system, der imødekommer en række af kundens krav.

Bemærk at kravene ikke er givet på forhånd, og at det er noget I skal analysere jer frem til – og løbende afstemme med en repræsentant for kunden. I dette tilfælde en underviser.

Løsningen skal leve op til følgende ikke-funktionelle krav:

1. Løsning skal baseres på en Postgresql database og en Hikari connection pool.
2. Designet skal afspejle en flerlagsarkitektur, der afvikles på en Java server (Jetty)
3. Webapplikationen bør udvikles med Java 17, [Javalin web framework](https://javalin.io/) og [Thymeleaf](https://www.thymeleaf.org/) som template engine. Dvs, en multipage web applikation.
4. Websiderne skal som minimum fungere i enten Google Chrome eller Firefox. Både på en desktop browser (min 1280px) og acceptabelt på en mobil enhed (iPhone 12 eller lign).
5. Websitet skal deployes i skyen (Digital Ocean)
6. Kildekoden skal være tilgængelig i et GitHub repository.

## Krav til processen – kort udgave

Projektperioden strækker sig over 4 uger inklusive rapportskrivning. Der afholdes et ugentligt vejledningsmøde undervejs med en underviser, hvor vi forventer at hele gruppen møder op. På møderne ser vi på hvor langt I er nået, aftaler hvad der skal arbejdes med til næste gang, og i øvrigt hjælper jer med opgaven. Underviseren fungerer også som en slags "repræsentant" fra kunden, så I kan spørge til dele af opgaven I evt. ikke forstår. Underviserne er selvfølgelig ikke en rigtig kunde, men vi tager kasketten på når det skal være.

Det er en rigtig god idé at være grundige med at skrive notater og referater af møder, der afholdes. I skal ikke skrive hvert et ord der bliver sagt, bare beslutningerne. Og gøre det hver gang. Det bliver guld værd når I skal til at skrive rapporten. Dels vil I kunne se hvad der skete hvornår og dels vil meget allerede være skrevet. (Se mere om formaliteter for rapporten nederst)

Vi forventer at I arbejder efter [Kanban principper](../../toolbox/sys/projectmanagement/kanban.md) i Github projects på baggrund af user stories med estimater og acceptkriterier. Det forventes også at I laver feature branches og pull requests.

Som det første skal I færdiggøre interessent- og risikoanalyser, aktivitetsdiagrammer (AS-IS og TO-BE) og jeres user stories med tilhørende acceptkriterier (Så langt I nu kan se frem)

[Mere om proces](./proces.md)

## Angående opnåelse af læringsmål i projektperioden

Projektarbejde anses for en vigtig læringsmetode analogt til almindelig klasseundervisning og øvelser. Det betyder, at der forventes, at alle tilegner sig en vis mængde ny viden og erfaring i de centrale emner for 2. semester gennem en selvstændig og ihærdig indsats i projektperioden.  

Der findes ikke en simpel opskrift på løsninger på den slags opgaver. Så forvent derfor at I støder på problemer, som underviserne ikke har hurtige svar på. Når det sker, så opfordrer vi til at i arbejder systematisk, og følger denne tilgang:

* Gør rede for hvad problemet er
* Find en række forslag til løsninger
* Vurder fordele og ulemper ved forslagene
* Vælg en løsning
* Dokumenter kort jeres begrundelser for løsningen

## Rapport

Brug denne [udvidede rapportskabelon](./rapportskabelon.md) som udgangspunkt. I behøver ikke at følge den slavisk, men sørg for at have modtageren for øje, så I kommunikerer kort og klart til en læser på jeres eget faglige niveau, som ikke kender til projektet på forhånd.

##  Formaliteter

* Det forventes, at alle er bekendte med indholdet af hele rapporten, og jeres kildekode. Det er med andre ord vigtigt, at I deler jeres viden internt i teamet, så alle ved hvad der er lavet og har en mulighed for at sætte sig ind i det.
* Rapporten må ikke overstige 30 normalsider (2400 tegn / side inkl. blanktegn) plus bilag. En model eller illustration tæller for 800 tegn.
* Rapporten må ikke være på færre end 20 sider. Det kan umuligt lade sig gøre at dokumentere projektet på færre end 20 sider, hvis det skal gøres ordentligt.
* Rapporten skal indeholde et link til jeres GitHub Repository. Det er ikke tilladt at lave ændringer på repo’ets main-branch efter afleveringen. Det betyder at I gerne med lave ændringer på andre branches, eller forkede udgaver af projektet.
* Den endelige aflevering skal foretages via WiseFlow. Nærmere information følger.
* Rapporten skal indeholde et link til kørende version af jeres website på Digital Ocean (en deployet version) og angivelse af login navn + kodeord til en demo admin bruger.
* Rapporten skal indeholde et link til _demovideo_ (på YouTube, Vimeo etc). En video på ca. 5 minutter, som viser brugen af jeres system. Formålet er at censor og eksaminator skal se videoerne og få et indtryk af det færdige resultat. Videoerne kan f.eks. optages ved hjælp af et screen cast program. F.eks. [ScreenPal](https://screenpal.com/screen-recorder). Gruppen kan evt. sidde sammen fysisk eller på Zoom og dele en skærm mens de laver demoen, så flere kan kommentere undervejs.
