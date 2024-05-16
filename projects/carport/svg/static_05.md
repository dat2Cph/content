---
title: Statiske tegninger del 5
description: Tutorial, hvor du lærer at kode SVG
layout: default
parent: Carport projekt
grand_parent: SVG tutorial
nav_order: 5
permalink: /projekter/carport/svg/static-05/
---

# 5. Statiske SVG tegningner

## Pile

At tegne pile er overraskende finurligt, da SVG er lavet sådan, at der kan bruges alle mulige former for pilehoveder (markers). Faktisk skal man selv tegne pilehovederne - de er små SVG tegninger i sig selv.

<img src="./images/doublearrows.png" width="150"/>

Pilen er lavet med følgende SVG:

```xml
<SVG width="25%" viewBox="0 0 150 40">
<defs>
 <marker 
  id="beginArrow" 
  markerWidth="12" 
  markerHeight="12" 
  refX="0" 
  refY="6" 
  orient="auto">
   <path d="M0,6 L12,0 L12,12 L0,6" style="fill: #000000;" />
 </marker>
 <marker 
  id="endArrow" 
  markerWidth="12" 
  markerHeight="12" 
  refX="12" 
  refY="6" 
  orient="auto">
   <path d="M0,0 L12,6 L0,12 L0,0 " style="fill: #000000;" />
 </marker>
</defs>
<line x1="130"  y1="10" x2="12"   y2="35" 
 style="stroke: #006600;
 marker-start: url(#beginArrow);
 marker-end: url(#endArrow);" />
</SVG>
```

Bemærk at det falder i to dele - en `defs` del hvor det forklares hvordan to markere er lavet, samt en del hvor disse markere bruges til at lave pile på en linje.

Sidste del først, så skriver man hvilke markers man vil bruge som start og slut på pilen. Her nævner man de to markers fra `defs` delen.

Vi vil anbefale, at I bare kopierer de to `defs` til jeres projekt og bruger dem.

Men her er forklaringen.

```xml
<marker 
    id="beginArrow" 
    markerWidth="12" 
    markerHeight="12" 
    refX="0" 
    refY="6" 
    orient="auto">
    <path d="M0,6 L12,0 L12,12 L0,6" style="fill: #000000;" />
 </marker>
```

`id` er det navn vi bruger nede i linjen til at sige hvilken type pil vi vil have. `markerWidth` og `markerHeight` angiver størrelsen på pilen. Dette er en ret lille pil. Selve pilen er tegnet med en `path` kommando, der siger at først flytter vi os til (0,6) (M for move), så tegner vi en trekant ved at lave tre linjestykker (L for linje), at vi skal fylde figuren med sort (#000000). Denne lille tegning viser hvordan de to pile er lavet.

![Figur 2: Definition af pilehoveder i SVG-path](./images/svg_arrows.jpg)

Så er der `orient="auto"` som magisk siger at pilen skal følge den linje vi laver. Endelig er der `refX` og `refY` som siger hvilket punkt i pilen der skal kobles på linjens endestykke. Jeg har her valgt pilens top, så pilen ikke rager ud over linjen.

### Øvelse

Lav et koordinatsystem som dette i SVG:

![SVG Koordinatsystem](./images/coordinatesystem_sketch.jpg)

### Vejledende løsning

<details markdown="block">
<summary>
Hvis du er kørt fast - så lur her
</summary>

```xml
<?xml version="1.0" ?>

<svg version="1.1"
     xmlns="http://www.w3.org/2000/svg"
     xmlns:xlink="http://www.w3.org/1999/xlink"
     height="100%" viewBox="0 0 855 690"
     preserveAspectRatio="xMinYMin">

    <defs>
        <marker id="beginArrow" markerWidth="12" markerHeight="12" refX="0" refY="6" orient="auto">
            <path d="M0,6 L12,0 L12,12 L0,6" style="fill: #000000;" />
        </marker>
        <marker id="endArrow" markerWidth="12" markerHeight="12" refX="12" refY="6" orient="auto">
            <path d="M0,0 L12,6 L0,12 L0,0 " style="fill: #000000;" />
        </marker>
    </defs>

    <!-- Pile -->
    <line x1="50" y1="600" x2="50" y2="50" style="stroke:#000000;
        marker-end: url(#endArrow);" />

    <line x1="50" y1="600" x2="800" y2="600" style="stroke:#000000;
        marker-end: url(#endArrow);" />
</svg>
```

</details>

[Gå til forsiden](./README.md) | [Forrige øvelse (4/7)](./static_04.md) | [Næste øvelse (6/7)](./static_06.md)
