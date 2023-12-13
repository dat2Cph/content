# Dynamiske SVG tegninger

## 1. Introduktion (specs)

Nu skal vi generere `SVG` fra Java. Hele ideen bygger på indsigten om at:

> `SVG` er en række af tegn - en tekst-streng, som opfylder `SVG` standarden.

Derfor skal vi lave en hjælpe-klasse i Java, hvor man kan bygge tekst-strengene op lidt ad gangen, og hvor man kan kalde de grundliggende `SVG` primitiver:

- `<svg>`
- `<line>`
- `<rectangle>`
- `<text>`
- `<defs>` og `<markers>` til pile

Man skal også kunne indsætte en `SVG`-tegning inden i en anden.

Det giver tilsammen følgende klasse-diagram:

![PlantUML Diagram](https://www.plantuml.com/plantuml/svg/dP11QiCm44NtEiKi4vf2cnCasHMwgdi1nHhaeVAeI2FRQUdTAwMACOPkOZ2Zpxp_43f4qK5IxrJy8FxKGVVGEXtZKIJGEGc-j9uR-a9uKjS5D8E5RmNvUuGcGsnFYPp1076mwhfuAD26M63QGHcNNKLX81nFVfhpI4QwENL8jfDjbMXZth0LpTRXocPyEZki_2skP54k3XUkL-AgUQwUEgTzpVj_kySG_7Xl-HqdMTs_ZE152tcUUvAvHQsyOVuponZouROI_yTljkf77P1Dwjql)

Here is a little snippet you can copy from:

```java
public class Svg {
    private StringBuilder svg;

    public Svg(int x, int y, String viewBox, String width, String height){}
    public addRectangle(int x, int y, double height, double width, String style){}
    public addLine(int x1, int y1, int x2, int y2, String style){}
    public addArrow(int x1, int y1, int x2, int y2, String style){}
    public addText(int x, int y, int rotation, String text){}
    public addSvg(Svg innerSvg){}
    public toString(){}
}
```

I det følgende angiver vi en løsning til hvordan man i grove træk kan implementere `Svg`-klassen og hvordan man kan bygge en hel carport. Så se de følgende video-tutorials og kod med undervejs.

## 2. Programmering af Svg klassen

- Se denne [Videotutorial: Svg#1]()

## 3. Anvendelse af Svg klassen

Først laver vi et par quick'n dirty eksperimenter:

- Se denne [Videotutorial: Svg#2]()

## 4. Idé til hvordan man tegner en hel carport

Her er blot en skitse, hvor der mangler en del klasser. F.eks. kunne man tilføje en `Calculator`-klasse, en `OrderMapper`-klasse osv. Det kommer lidt an på hvordan I har angrebet beregningerne. Hvis I har gemt styklisten i databasen, så er det nok lettest at fiske antal og mål ud til `SVG`-tegningen fra databasen. F.eks. i `CarportSvg` klassen eller i `OrderController`. Ellers skal man udregne dem undervejs.

![Drawing a whole carport](https://www.plantuml.com/plantuml/svg/fL7BJiCm4BpxAtnCQIj1Zvpwu8A416hv0RTU4Wl7hjQRHq7zT-B4TK8Aue2brhkpCwFCUkb881MvPkvTcQD0aVE35iwjY53j2uB7WpKxzG7ybhK3lYjJ_ibuS-Pyrv1CkYwKbe3SbIbh1rDFIfGXNi-ulqwpGEMbWcfjwzXNIb8MkmnKcj64t_FIAXcyX9HRE90mgOQHgRJ5NaEGNTgHfwEJXclB9sM2srsm2tUz2FtYBuiLegt-wV4ADOr2-Gij2LBMH3arl6krNtFpQoG6i2b63BATEl5uLx8pO-4XDmAF5cdudhvsPVg0elBS3bI6kfNsVTXu2_H_qu5b4bMpWM3o-uTrvZxK6aJkaXWbublnHe0_JLwienu-Nm8-emJSM4DejGOCAQVSPRPgPzyqO_RDV3x8mrXVjoEFTMS9HXQv_W80)

Husk at ovenstående er een måde at gøre det på. Det kan sagtens lade sig gøre på mange andre.

- Se denne [Videotutorial: Svg#3]()
