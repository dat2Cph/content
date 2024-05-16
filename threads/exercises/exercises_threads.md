---
title: Simple tråde
description: Samtidighed, tråde og executors
layout: default
nav_order: 1
parent: Øvelser
grand_parent: Trådprogrammering
permalink: /threads/exercises/simple-threads/
---

# Øvelser - Tråde - Threads

## Før du går i gang

Lav et nyt projekt. Kald det fx. `concurrency`. Gerne et maven-projekt. Lav en package med navnet ´threads´, hvori du ligger koden til de næste øvelser.

## Øvelse 1: Tre tråde

Denne øvelse handler om grundliggende anvendelse af tråde i Java.

- `start`
- `stop`
- `Thread`
- `Runnable`
- `Thread.sleep()`

Skriv et program, der starter tre forskellige tråde:

- Task-1 : Beregner og udskriver summen af alle tal fra 1 til en milliard.
- Task-2 : Udskriver tallene fra 1 til 5. Holder 2 sekunders pause mellem hvert tal.
- Task-3 : Udskriver alle tal fra 10 og opefter. Holder pause i 3 sekunder mellem hvert tal.

Programmet skal stoppe Task-3 efter 10 sekunder.

- Hint-0: Lav først en package i `threads` og kald den for `exercise01`. Lav tre klasser som implementerer Runnable interfacet. Lav også en Main klasse, hvorfra du kører koden.
- Hint-1: Brug en long til at beregne summen i Task-1.
- Hint-2: Lad main-tråden "sove" i 10 sekunder efter Task-3 er startet.
- Hint-3: Du kan stoppe Task-3 ved at indsætte en boolean variabel i løkken i run-metoden, som kan ændres fra main-tråden.

## Øvelse 2: Start/stop/afbryd en tråd

### Før du går i gang

Lav en ny package: `exercise02`.

```java
class WorkerCancelable implements Runnable{
    boolean keepRunning = true;
    Thread thread;
    public void run() {
        thread = Thread.currentThread();
        while(keepRunning){
            System.out.println("Hello");
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
              e.printStackTrace();
            }
        }
    }
    public void cancel() {
        keepRunning = false;
    }
}
```

```java
public class ThreadExercise02 {

    public static void main(String[] args) throws InterruptedException {
        WorkerCancelable worker = new WorkerCancelable();
        Thread t = new Thread(worker);
        t.start();
        System.out.println("DONE");
    }
}
```

### 2.1 Hvad gør koden?

Tag et kig på koden ovenfor, og se, om du kan forudse, hvad den gør (udskriver) UDEN faktisk at udføre koden.
Tip: Hvis du kørte koden, bliver du sandsynligvis nødt til at stoppe den ved at trykke på den "røde" knap i IntelliJ ;-)

### 2.2 Modificer koden (i hovedet)

Find på de nødvendige ændringer (UDEN at køre koden), der skal til, for at koden udskriver dette, når den udføres:

Hello (wait a second)
Hello (wait a second)
Hello (wait a second)
DONE

### 2.3 Kør koden

Hvis det ikke allerede er gjort, skal du kopiere koden ind i et projekt i IntelliJ og verificere dine forudsigelser ovenfor.

### 2.4 Afbrydelse af en tråd (interrupt)

I din run-metode skal du ændre sleep-tiden fra 1 sekund til 60 sekunder.
Tilføj de nødvendige ændringer for at udskrive et enkelt "Hello" efterfulgt af et "Done" efter 4 sekunder.

Tip: Hvis du afbryder tråden (med *interrupt`), ophæver du blokeringen, så find ud af, hvor du skal gøre det.

<hr/>

1. [Øvelser med simple tråde](exercises_threads.md)
2. [Øvelser med brug af Executor frameworket](./exercises_executor.md)
3. [Øvelser i samtidighedsproblematikker](./exercises_concurrency_problems.md)
4. [Oplæg til større opgave med udvikling af en chat-server](./exercises_chatserver.md)
