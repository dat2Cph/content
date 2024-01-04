# HTTP protokollen og netværk - opgaver mandag/tirsdag

## Ressourcer

- [Note om netværk](./NoteNetværkHTTP.md)
- [Link til kode](https://github.com/bornholm2sem2019/Modul1NetworkHTTP) (skal opdateres)
- [Slides fra mandag](./Week1Network.pptx)

## Opgave 1. (grøn)

I skal kunne vise forskellen på hvilken data der sendes til en web server fra henholdsvis en chrome og en firefox browser (prøv gerne med andre browsere også).

## Opgave 2. (gul)

Hvis man starter picoserver02 to gange (uden at lukke det første ned) får man en fejl. Hvad betyder den fejl og hvorfor får man den.

## Opgave 3. (rød)

Prøv vha. exception handling at lave picoserver2 om sådan at den automatisk finder en server socket der ikke er i brug, sådan at I kan have mere end en server kørende på samme tid i IntelliJ.

## Opgave 4. (grøn)

Find en person i gruppen der kan lave et wifi-hot-spot med sin telefon, og kopl jeres laptop på denne telefon.

- Find IP addressen på laptoppen (hvis I ikke ved hvordan man finder IP addressen på jeres laptop, så er det altså det der er google opgaven). Det er vigtigt at alle i gruppen kan finde deres IP addresse, uanset om det er Windows, Mac, Linux eller noget andet.
- (Grøn) Demonstrer at I kan kople på picoserver2 via jeres telefon.
- (Gul) Kopl alle gruppens laptops på samme telefon, og demonstrer hvordan I fra jeres browser kan kople jer på forskellige servere på andres laptops.
- (Rød) Behøver alle serverne at bruge samme port nummer? Demonstrer hvordan man fra en laptop kan have mere end en server kørende, og tilgå dem fra en anden laptop.

## Opgave 5. (grøn)

Er det java eller operativ systemet der har ansvaret for porte, altså er det java eller operativ systemet der brokker sig hvis man prøver at åbne den samme port to gange? Og hvorfor er det et problem med to porte med samme nummer?

## Opgave 6. (rød)

Som en del af den udleverede kode er der en klasse der hedder HttpRequest. Redegør for denne klasse, specielt skal I kunne forklare:

- Hvad er forskellen på parametre og headers?
- Hvad gør de første 7 linjer i konstruktøren?
- I konstruktøren er der en linje der hedder:

`if ("application/x-www-form-urlencoded".equals(getContentType())) {`

Forklar hvorfor denne er smartere end:

`if ( getContentType().equals("application/x-www-form-urlencoded" ) ){`
