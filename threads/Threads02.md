# Tråde: opgaver onsdag/torsdag

## Resourcer

* [Note om tråde](./NoteOnThreads.md)
* [Link til github](https://github.com/bornholm2sem2019/Modul1Threads)
* [Slides fra mandag](./Week2Threads.pptx)

Opgaverne til onsdag/torsdag er at få omprogrammeret vores webserver fra sidste uge så den bliver mere responsiv (bliver hurtigere klar til næste request).

## Opgave 1. (grøn)

Med udgangspunkt i picoServer05 laver vi små ændringer for at køre hvert server response ud i en ny tråd. Du skal bruge en ExecutorService som du indsætter lige før while loopet (den jeg kalder `workingJack` i eksemplerne). Efter while loopet kommer `Socket socket = server.accept();` som jo er et blokerende kald, der afventer et nyt request fra en klient/browser.
  
Herefter tager vi al koden fra try-catch blokken og flytter dette over i en selvstændig metode (HINT: Refactor -> Extract -> Method: Giv metoden et navn. Nedenfor har vi kaldt den `MakeResponse`). Nu har vi kun et enkelt metode kald under linjen der opretter en socket. Denne linje kan nu indsættes i en run metode inde i en anonym implementation af interfacet: Runnable á la dette:

 ```java
...
Socket socket = server.accept();
workingJack.submit(new Runnable() {
                @Override
                public void run() {
                    try {
                        MakeResponse(socket, root);
                    } catch (IOException ex) {
                        System.out.println(ex.getMessage());
                    }
                }
            });
```

 På denne måde vil alle response der skal laves af serveren blive lagt ud i en anden tråd, så hovedtråden hurtigst muligt bliver klar til igen at vente på et nyt request fra en browser.  

## Opgave 2. (gul)

I den første opgave tog vi udgangspunkt i `picoServer05` der kun sender filer tilbage. I `picoServer06` håndterer vi både filer og `addournumbers`.

* Der skal laves en task og executor der returnerer filer - altså lidt i stil med den første opgave.

* Der skal være en task, der håndterer `addournumbers` (håndter gerne hele else-delen - altså inklusiv switchen.).

Bemærk: I bliver nødt til at flytte det at lukke sockets ind i de to tasks, da det er dem der ved hvornår de har svaret på requestet.

## Opgave 3. (gul/rød)

Når I er færdig med opgave 2, så vil main-tråden stadig have til opgave at lave et HttpRequest objekt. Gentag processen med at lave metoder og tasks sådan at også det at lave HTTPRequestet bliver gjort i en selvstændig task.  Hvis I følger processen med at lave nye metoder og tasks, så vil denne nye task selv lave nye tasks. Det må den gerne - det er god karma.

## Opgave 4. (rød)

I koden fra sidste uge er der en klasse der hedder `ClientMain`. Den kan bruges til at kalde en web-server.

* Sæt det op sådan at I på den ene computer kører en webserver (f.eks. en `picoserver06` fra sidste uge).
* Få `ClientMain` til at kalde denne server.
* Lav `ClientMain` programmet så den vha. executors sender mange requests samtidigt til Serveren.
* Til review skal I vise en udgave hvor I kan demonstrere at både klient og server kører med flere samtidige tasks.
