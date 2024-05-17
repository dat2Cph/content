---
title: User stories
description: Teori om User stories
layout: default
parent: SYS
grand_parent: Toolbox
nav_order: 6
permalink: /toolbox/sys/user-stories/
---

# User stories og accept-kriterier

Er en kort simpel beskrivelse af en feature, som en potentiel bruger ville formulere det. Typisk en bruger eller en kunde.

En user story can uformelt skrives som: **Tilmeldte brugere kan nulstille deres kodeord**.

En lidt mere formel udgave kunne være:

* **Som** en tilmeldt bruger
* **Ønsker jeg** at kunne nulstille mig kodeord
* **Så jeg** kan logge på systemet hvis jeg har glemt mit kodeord

Formatet følger altså denne form:

* **Som** hvem,
* **Ønsker jeg** hvad,
* **Så jeg** hvorfor.

## Acceptkriterier

Formålet med acceptkriterier er at kunne afgøre, om vores user stories fungerer
efter hensigten. Altså at bringe vores opmærksomhed fra at systemet "fungerer som programmøren har lavet det" til "fungerer sådan som den oprindelige intention bag en user story har været". "It works as coded" til "It works as intented".

Det er typisk de krav som systemet skal leve op til før en kunde vil kunne godkende det.

Følgende format kan f.eks. anvendes:

* **Givet** en forudsætning,
* **Når** jeg foretager mig noget,
* **Så** forventer jeg resultatet.

På engelsk: Given, When, Then

Det er et format, som er let at teste. Enten lever systemet op til acceptkriteriet, eller også fejler det.

Eksempel:

**User Story**: Som en tilmeldt bruger, ønsker jeg at kunne nulstille mit kodeord, sådan at jeg kan logge på systemet igen, når jeg har glemt mig kodeord.

**Accept-kriterium**: _Givet_ at jeg er tilmeldt systemet som bruger. _Når_ jeg klikker på et "jeg har glemt mit kodeord" link, _så_ modtager jeg en mail med et link til at nulstille kodeordet og når jeg klikker på linket kan jeg indtaste et nyt kodeord, for bagefter at kunne logge på.

Udviklerne og kunden (product owner) sidder som regel sammen og kører alle accept-kriterierne igennem inden systemet kan godkendes som leveret.
