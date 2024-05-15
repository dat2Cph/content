---
title: Teori og normalisering
description: Introduktion til databaseteori og normalisering
layout: default
parent: Databaser
nav_order: 2
permalink: /databases/theory/
---

# Database teori og normalisering

Denne dag handler om database teori og modellering.

*Modellering* har I allerede beskæftiget jer lidt med. Det er kunsten er komme fra en opgave, som skal løses i den virkelige verden, til en logisk model, som kan omsættes til et IT-system.

*Databaseteori* handler blandt andet om hvordan vi kan skrue en relationel database sammen, så data bliver gemt og organiseret mest hensigtsmæssigt. F.eks. så vi ikke kommer til at få rod i data, får slettet for meget eller for lidt, og så vi kan lave effektive og korrekte forespørgsler.

## Forberedelse

Når vi mødes, så sørg for at have læst denne artikel grundigt igennem:

[Normalisering](../docs/normalisering_v1.1.pdf)

og kig på denne side om *crows-foot* notation i ER-diagrammer:

[ER-diagrammer](https://www.freecodecamp.org/news/crows-foot-notation-relationship-symbols-and-how-to-read-diagrams/)

Du kan eventuelt også se denne video om hvad databaser og SQL er og hvordan man kan bruge det:

[01 Introduktion til databaser](https://cphbusiness.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=0f2388a3-48a8-4a27-9ff8-ae4d00d94ad5) (bemærk at der bliver talt om MySQL i videoen. Vi skal bruge Postgres, men principperne er de samme).

Og du kan se denne video om normalisering (start ved 22:54, da du ikke behøver at se hvordan man installerer MySQL):

[02 Normalisering](https://cphbusiness.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=28d94c37-4010-43e9-aa6d-ae4d00da0670)

## Plan for dagen (sådan ca.)

1. Fælles introduktion til emnet
2. Installering af [Docker](https://docs.docker.com/get-docker/) og Postgres. Hvis du kigger på det hjemmefra så bemærk, at du skal installere Docker Desktop men IKKE Postgres lokalt på din computer. Du kan se, hvad du skal gøre [her](https://github.com/dat2Cph/2semDockerSetupLocal/blob/main/README.md). Du får brug for [denne compose-fil](https://github.com/dat2Cph/2semDockerSetupLocal/blob/main/docker-compose.yml) til at oprette containere til Postgres på din Docker.
4. Gennemgang af ny case "fra data til normaliseret ER diagram"

- Opgave med supporthjælp fra underviserne
  - Præsentation af opgave og de værktøjer I skal bruge.
  - Opgaveløsning. Tænk over på forhånd hvem du vil arbejde sammen med - eller om du vil løse opgaven alene. Opgaven er velegnet til 2-3 personer.
  - Præsentation af løsninger. De som har lyst viser deres normaliserede ER diagram frem - og vi tager en snak om løsningen.

[Dagens slides ligger her](../docs/Modellering%20af%20data.pdf)

## Opgave

[Dagens opgave kan du finde her](./exercise_normalization.md)
