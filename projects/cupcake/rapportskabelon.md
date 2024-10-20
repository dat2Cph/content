---
title: Cupcake rapportskabelon
description: Forslag til hvordan en rapport kan udarbejdes
layout: default
parent: Cupcake projekt
grand_parent: Projekter
nav_order: 1
---

# Cupcake rapportskabelon

**Dokumentation af software kan tage mange former og varierer fra den ene udvikler virksomhed til den anden.**

Denne skabelon er lavet for at vise hvordan en sådan rapport _kan_ se ud.

## Forside

Det er almindeligt at der på forsiden er følgende informationer

- En titel. _Ofte er det navnet på opgaven - Cupcake. Student projekter har ofte en skør titel som “Kagekaj slår til igen”. En af jeres opgaver i løbet af studiet er at lære at lade jeres pjat ligge hjemme og opføre jer professionelt_

- **Deltagere — Vigtigt**
  - **Navn, cph-email og github-navn** på alle deltagere
  - Klasse (A, B eller Bornholm)
- Tidspunkt. _Hvornår blev projektet og rapporten lavet - husk årstal_

## Indholdsfortegnelse

Skal altid med når et dokument bliver længere end 4-5 sider. Husk også sidenumre på alle sider undtagen forsiden.

## Indledning

Kort intro til hvad dette projekt omhandler. Formålet med indledning er at sætte en fagfælle i stand til at forstå resten af rapporten. For jer som studerende er en “fagfælle” en anden datamatiker studerende på 2. semester der er på samme niveau, men som ikke kender cupcake opgaven. Det må I gerne skrive eksplicit i indledningen, så læseren ikke kommer i tvivl om målgruppen.

### Baggrund

Det typiske der skal med for at forklare projektet er:

- En kort beskrivelse af den virksomhed, som skal bruge systemet
- Hvilke krav kunden har til systemet forklaret i brede termer, f.eks. _“kunden skal kunne bestille en cupcake hvor man kan vælge både bund og top.”_ i modsætning til _“der skal være en drop down menu med scrollbar i højre side med en liste over hvilke bunde der er og hvad de koster”_.

### Teknologi valg

En kort beskrivelse af hvilke teknologier der er brugt (jdbc, Postgresql, Java …). Her er det _ikke_ meningen at I skal beskrive disse teknologier, men man skal sige hvilke der er brugt sådan at den der skal overtage projektet ved hvilken software der skal bruges. Der skal versions numre på (IntelliJ 2023.3.5, ikke blot “IntelliJ”).

## Krav

Der er to dele i dette afsnit:

- Hvad er firmaets håb med dette system (hvad er deres vision for systemet eller hvilken værdi er det jeres system skal tilføre deres virksomhed).
- User stories. Disse er udleveret i opgaven, så dem kan I bare sætte ind som de er.

## Aktivitetsdiagram

Tidligt i et projektforløb kan det være nyttigt at lave et aktivitetsdiagram, som beskriver det overordnede workflow i forretningen. Det kan være med eller uden svømmebaner. Det kan senere tjene som inspiration til domænemodellen og til at forstå hvad det er for nogle forretningsprocesser vi skal digitalisere. Nogle gange laver man to versioner. En som kaldes for "AS-IS", altså som deres forretning ser ud lige nu, og så en "TO-BE", som viser hvordan workflowet kan blive når vi har leveret vores system. Du kan se [tutorials om UML her](https://github.com/dat2Cph/content/tree/main/toolbox/sys/uml).

## Domæne model og ER diagram

I skal både lave Domænemodel og ERD. Den første skal give et første overblik over hvad systemet håndterer og ERD går mere i dybden især med relationer. Det interessante ved domænemodellen og databasen, er at de langt hen af vejen er grundlaget for resten at systemet. Tabeller og relationer siger noget om _hvad_ systemet arbejder med, ikke _hvordan_. Så det er godt sted at starte.

Som led i beskrivelsen af Domæne og ER diagram skal man have følgende med:

### Domænemodel

- Diagram over hele modellen. Husk der skal ikke metoder på i de klassekandidater I tager med og højst nogle attributter som er helt særlige for klassen. I kan udelade andre attributter.
- Relationer og multiplicitet og et par sætninger om de relationer I har måttet overveje mest eller kunne laves på flere måder.

### ER diagram

- Diagram over hele modellen. Det er vigtigt at få plads til alle tabeller og alle relationer. _Det kan så betyde at man ikke kan få plads til alle attributter på de enkelte tabeller. Dem kan man slå op i databasen, så det er ikke så vigtigt_
- Hvis nogle af tabellerne ikke er på 3. normal form vil det være almindeligt at nævne det, og forklare hvorfor det er gjort (tidspres eller anden overvejelse).
- Hvis der anvendes 1-1 relationer kan man beskrive hvorfor man ikke blot har en tabel.
- Hvis nogle tabeller implementerer en mange-mange relation vil det være normalt at beskrive det.
- Hvis der er flere veje at nå fra et sted til et andet, vil det nemt gøre det svært at holde databasen konsistent. Hvis I har gjort det alligevel så skal I forklare hvorfor.
- Hvis der er tabeller, hvor man benytter andet end et automatisk genereret ID som nøgle skal man forklare det.

Det er interessant at beskrive hvilke overvejelser der ligger til grund for de konkrete valg der er i ERD modellen (fremmednøgler, constraints osv)

## Navigationsdiagram

Det som brugeren oplever er en række websider, hvor man kan indtaste oplysninger og navigere videre til andre sider. I større systemer kan det være svært at bevare overblikket over hvilke sider der er, og hvordan man kommer fra den ene til den anden. Navigationsdiagrammet er beregnet på at vise dette på en mere overskuelig måde. Som led i beskrivelsen af navigationsdiagrammet skal følgende med:

- Oversigtsdiagrammet. Hvis det bliver for stort må man dele det op. Men det er vigtigt at der er et overordnet diagram.
- Hvis man har benyttet sig af en “fælles navigations bar” i toppen af alle sider, skal man forklare det.
- Hvis nogle sider kun kan nåes af nogle brugere (dem der har konto, dem der er logget ind, dem der arbejder i butikken,…), så skal det fremgå.

Navigationsdiagrammer laves som UML Tilstandsmaskiner [state machine diagram](https://github.com/dat2Cph/content/blob/main/webstack/backend/statemachinediagram.md). Bemærk specielt at det, der hedder “composite state”, er meget velegnet til at indkapsle at man er logget ind.

## Særlige forhold

Dette afsnit bruges til at beskrive særlige forhold der benyttes i programmet. Det kan f.eks. være:

- Hvilke informationer gemmes i session
- Hvordan håndterer man exceptions. Det kommer vi tilbage til senere i semesteret.
- Hvordan man har valgt at lave validering af brugerinput.
- Hvordan man har valgt at lave sikkerhed i forbindelse med login
- Hvilke brugertyper, der er valgt i databasen, og hvordan de er brugt i jdbc
- ... andre elementer

Husk: det er bedre med 2 linjers dokumentation end ingen.

## Status på implementation

Dette afsnit skal liste hvor langt man er nået med implementationen. Typiske ting man kan have sprunget over er:

- Man har ikke nået at lave alle de websider man har med i navigationsdiagrammet.
- Man har ikke nået at lave alle CRUD metoderne til alle tabellerne
- Man har ikke fået stylet sine sider
- Man har fundet en fejl “i sidste øjeblik”, men har ikke haft tid til at rette det. - F.eks. at man har brugt session forkert, sådan at man på en af siderne kan komme ind uden at være logget ind.
- tests der fejler på afleveringstidspunkt
- … andre mangler

## Proces

Dette afsnit skal beskrive projektforløbet, og hvordan kom det til at forløbe i praksis. Så beskriv:

- Hvad var jeres planer for teamets arbejdsform og projektforløbet?
- Hvordan kom det til at forløbe i praksis?
- Hvad gik godt og hvad kunne have været bedre?
- Hvad har I lært af processen og hvad vil I evt. gøre anderledes næste gang?
