---
title: 4. Rapportskabelon
description: Forslag til opbygning af rapport for semesterprojekt
layout: default
parent: Carport projekt
grand_parent: Projekter
nav_order: 4
permalink: /projekter/carport/rapportskabelon/
---

# Endelig skabelon for rapport (semesterprojekt)

{: .no_toc }

Dokumentation af software kan tage mange former og varierer fra den ene udvikler virksomhed til den anden. Denne skabelon er lavet for at vise hvordan en sådan rapport _kan_ se ud.

<details markdown="block">
  <summary>
    Oversigt
  </summary>
  {: .text-delta }
* TOC
{:toc .text-delta}
</details>

* * *

## Forside

Det er almindeligt at der på forsiden er følgende informationer

* En titel _Ofte er det navnet på opgaven - Fog Carports. Studenterprojekter har ofte en skør titel som “Tømmerkaj træder på sømmet”. En af jeres opgaver i løbet af studiet er at lære at lade jeres pjat ligge hjemme og opføre jer professionelt_
* Deltagere _Navn og cph-email på alle deltagere_
* Tidspunkt _Hvornår blev projektet og rapporten lavet - husk årstal_

## Links

* Link til GitHub repository for den seneste kode på afleveringstidspunktet.
* Link til demovideo (på YouTube, Vimeo etc). En video på ca. 5 minutter, som viser brugen af systemet. Formålet er at Censor og eksaminator skal se videoen og få et indtryk af det færdige resultat. Demovideoen kan f.eks. optages ved hjælp af et screen cast program. F.eks. [ScreenPal](https://screenpal.com/screen-recorder). Gruppen kan evt. sidde sammen på Zoom og dele en skærm mens de laver demoen, så flere kan kommentere undervejs.
* Link til kørende version af deres website på Digital Ocean (en deployet version) og angivelse af login navn + kodeord til en demo adminbruger.

## Indledning

Kort intro til hvad dette projekt omhandler. Formålet med indledning er at sætte en fagfælle i stand til at forstå resten af rapporten. For jer som studerende er en “fagfælle” en anden datamatiker studerende på 2. semester der er på samme niveau, men som ikke kender opgaven.

## Baggrund

Det typiske der skal med for at forklare projektet er:

* En kort beskrivelse af den virksomhed som skal bruge systemet
* Hvilke krav kunden har til systemet forklaret i brede termer, f.eks. “_kunden skal kunne bestille en carport, hvor man kan vælge både højde og bredde._” i modsætning til “_der skal være en drop down menu med scrollbar i højre side med en liste over hvilke typer der er og hvad de koster_”.

## Virksomheden/Forretningsforståelse

Jeres interessentanalyse og risikoanalyser med et kort afsnit om i hvilken grad det har bidraget til jeres proces at have lavet dem.

## Teknologi valg

En kort beskrivelse af hvilke teknologier der er brugt (jdbc, mysql, …). Her er det _ikke_ meningen at I skal beskrive disse teknologier, men man skal sige hvilke der er brugt sådan at den der skal overtage projektet ved hvilken software der skal bruges. Der skal versions numre på (IntelliJ 20.3, ikke blot “IntelliJ”).

## Krav

Dette er et indledende afsnit angående krav. Det er de krav som opstår i mødet med Martin fra Fog. F.eks. at kunden først må se styklisten efter at have betalt etc. Senere i rapporten skal kravene så transformeres til user stories. Husk at Martin ikke tænker i user stories.

### Arbejdsgange der skal IT-støttes

Jeres aktivitetsdiagrammer (AS\_IS og TO-BE) i svømmebaneudgaven med en kort læseforklaring især om forskellen på dem.

### User stories

Dette afsnit skal beskrive de user-stories der er aftalt med kunden. Det er vigtigt for hver user-story at man kan spore det tilbage til aktivitetsdiagrammerne fra forrige side, og at I har en håndfuld user stories som er lavet fuldt ud, dvs:

* der er brudt ned i tasks (måske)
* der er lavet et estimat (small, medium, large)
* har [accept-kriterier](../../toolbox/sys/requirements/userstories.md)

Den fulde samling af user stories og tasks kan ligge som bilag.

## Domæne model og ER-diagram

Det interessante ved domænemodel og databasen, er at de langt hen af vejen er grundlaget for resten af systemet. Tabeller og relationer siger noget om _hvad_ systemet arbejder med, ikke _hvordan_. Så det er godt sted at starte. Husk at domænemodellen kommer før ER-diagrammet, og at domænemodellen ikke handler om implementering. Det er kun konceptuelle klaser med attributter, der beskriver den virkelige verden.

Som led i beskrivelsen af Domæne eller ER-diagram skal man have følgende med:

* Diagram over hele modellen. Det er vigtigt at få plads til alle tabeller og alle relationer. _Det kan så betyde at man ikke kan få plads til alle attributter på de enkelte tabeller. Dem kan man slå op i databasen, så det er ikke så vigtigt_
* Hvis nogle af tabellerne ikke er på 3. normal form vil det være almindeligt at nævne det, og forklare hvorfor det er gjort (tidspres eller anden overvejelse).
* Hvis der anvendes 1-1 relationer kan man beskrive hvorfor man ikke blot har en tabel.
* Hvis nogle tabeller implementerer en mange-mange relation vil det være normalt at beskrive det.
* Hvis der er flere veje at nå fra et sted til et andet vil det nemt gøre det svært at holde databasen konsistent. Hvis I har gjort det alligevel så skal I forklare hvorfor.
* Hvis der er tabeller hvor man benytter andet end et automatisk genereret ID som nøgle skal man forklare det.

Der er interessant at beskrive hvilke overvejelser der ligger til grund for de konkrete valg der er i ERD (fremmednøgler, constraints osv)

## Navigationsdiagram & Mockups

Det som brugeren oplever er en række websider hvor man kan indtaste oplysninger gå videre til andre sider. I større systemer kan det være svært at bevare overblikket over hvilke sider der er, og hvordan man kommer fra den ene til den anden. Navigationsdiagrammet er beregnet på at vise dette på en mere overskuelig måde. Som led i beskrivelsen af navigationsdiagrammet skal følgende med:

* Oversigts diagrammet. Hvis det bliver for stort må man dele det op. Men det er vigtigt at der er et overordnet diagram.
* Hvis man har benyttet sig af en “fælles navigations bar” i toppen af alle sider skal man forklare det.
* Hvis nogle sider kun kan nåes af nogle brugere (dem der har konto, dem der er logget ind, dem der arbejder i butikken, …), så skal det fremgå.
* Navne på Thymeleaf skabeloner sider skal fremgå, og hvilke Routes der bringer en fra den ene side til den næste.

## Valg af arkitektur

Beskrivelse af den valgte skabelon. I dette semester har vi anvendt en [MVC inspireret arkitektur](../../toolbox/designpatterns/mvc.md). Giv en forklaring og vis hvilke packages I har i systemet med korte forklaringer. Brug af hjælpeklasser, evt. serviceklasser, [singletons](../../toolbox/designpatterns/singleton.md) etc.

## Særlige forhold

Dette afsnit bruges til at beskrive særlige forhold der benyttes i programmet. Det kan f.eks. være:

* Hvilke informationer gemmes i application, session, og request variabler?
* Hvordan håndterer man exceptions og logger?
* Hvordan man på har valgt at lave brugerinput validering?
* Hvordan man har valgt at lave sikkerhed i forbindelse med login?
* Hvilke brugertyper (roller) der er valgt i databasen, og hvordan de er brugt i jdbc
* … andre elementer – i Fog projektet kan det være:
  * Tegning
  * Stykliste beregner

Husk: det er bedre med 2 linjers dokumentation end ingen.

## Udvalgte kodeeksempler

Det er ikke sikkert at censor (eller eksaminator) finder alle jeres guldkorn i selve koden. Derfor er det en god ide at vælge særlige kode stumper ud og vise dem i rapporten.

De eksempler der er givet under “særlige forhold” afsnittet kan man godt tage og illustrere med kode direkte i rapporten.

Der er mange af jer der vil skrive jeres ting i Word eller Google Docs. Vær opmærksom på hvordan i formaterer jeres kode. Man vælger ofte en lidt mindre font, en der er “monospaced” (alle bogstaver optager samme bredde). Der er også nogle der sætter små skærmbilleder fra IntelliJ ind. Det er OK, men så husk at vælge et tema fra IntelliJ med hvid baggrund og mørke/farvede bogstaver da nogle censorer skriver rapporten ud på blækprintere som ikke gengiver lyse bogstaver på sort baggrund særligt godt. I kan evt. indsætte kodestumpler i et Markdown dokument - og bagefter kopiere koden ind i jeres tekst. På den måde bliver den syntax formateret med indryk osv.

## Status på implementering

Dette afsnit skal gøre rede hvor langt I er nået med implementeringen. Typiske ting man kan have sprunget over er:

* Man har ikke nået at lave alle de web sider man har med i navigationsdiagrammet.
* Man har ikke nået at lave alle CRUD metoderne til alle tabellerne
* Man har ikke fået stylet sine sider
* Man har fundet en fejl “i sidste øjeblik”, men har ikke haft tid til at rette det. - F.eks. at man har brugt session forkert sådan at man på en af siderne kan komme ind uden at være logget in.
* tests der fejler på afleveringstidspunkt
* … andre mangler

## Kvalitetssikring (test)

Der skal være lavet test.

### Automatiserede tests

Her menes unit- og integrationstests. Du kan dokumentere tests ved at beskrive i tabel form:

* Hvilke klasser er testet
* Hvilke metoder der er testet
* Evt. dækningsgrad af dine tests for de valgte metoder og klasser

Desuden kan du beskrive hvordan i systematisk har arbejdet med at teste koden før den er blevet gjort til en del af main branch.

### User Acceptance tests

Til hver user story hører en UAT (user acceptance test). Det er meningen at "kunden" skal have lov at afprøve - og forhåbentlig godkende hver user story efter de beskrivelser som er formuleret på forhånd til hver user story. Det letteste er at indsætte alle user stories i et skema - og så have en kolonne med kommentarer: "godkendt", "ikke godkendt pga ..." osv.

## Proces

Der skal være et afsnit hvor I beskriver jeres arbejdsproces i projekt perioden. Der skal dels være et faktuelt afsnit og et refleksionsafsnit. Nævn f.eks. også hvilke værktøjer I har brugt til at styre processen, og indsæt gerne skærmdumps til at vise det fra GitHub Projects / Issues.

### Arbejdsprocessen faktuelt

Dette afsnit skal beskrive:

* Hvilke faser der var, og hvilke user stories der blev arbejdet med. En fase er perioden mellem hver vejledningsmøde.
* Hvem der evt. var KanBan Mester (KM) i hvilke dele af projekt perioden. Giv gerne nogle eksempler på hvad KM gjorde i udvalgte dele af projektforløbet.
* Et eksempel på et af vejlednings-møderne, hvad der var planlagt fra jeres side, og hvordan det gik.
* Hvordan i løbende har kommunikeret i teamet

### Arbejdsprocessen reflekteret

Dette afsnit skal beskrive jeres overvejelser over hvilke dele der har fungeret godt og hvilke dele der måske er faldet lidt på gulvet. I kan f.eks. beskrive:

* Om KanBan Mester rollen fungerede, hvilke problemer I så i den, og hvad I gjorde for at rette op på det.
* Hvad der var de væsentligste emner på jeres evalueringsmøder
* Om I havde problemer med at nedbryde user stories i tasks og hvad I gjorde for at løse dem
* Om I var spot-on med jeres estimeringer og hvad der mon var årsagen eller hvad I gjorde hvis I ikke var spot on
* Om der var problemer med vejledningen og jeres demoer
* Hvor langt inde i processen I fandt en rytme der var produktiv og om meget gerne identificere hvorfor
* Hvordan det gik med at dele kode via GitHub i praksis
