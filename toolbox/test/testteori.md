---
title: Test
description: Teori om test
layout: default
parent: Toolbox
nav_order: 5
permalink: /toolbox/test/
---

# Hvordan sikrer I jer, at jeres kode virker?

Formålet med undervisningen er at give en mere systematisk tilgang til test og sikring af kvalitet i sin kode.

I et projekt er det vigtigt at sikre sig, at vi:

1. Bygger det rigtige. Dvs, at systemet hjælper med at løse kundens problemer.
2. Bygger det rigtigt. Dvs, at systemet er bygget ordentligt.

Begge dele siger noget om kvaliteten af vores løsning, og der findes mange praksisser, der kan hjælpe os på vej i form af tests. I det følgende skal vi ses på lidt teori om emnet _Test og kvalitet_ og samtidig arbejde med nogle konkrete anvisninger på hvordan vi kan sikre en vis kvalitet i større projekter. F.eks. i jeres semesterprojekt.

Tests laves løbende gennem et projekt på flere niveauer:

![](https://datsoftlyngby.github.io/dat2sem2020SpringBornholm/Modul5/Week3-Test/img/vmodel.png)

Figuren illustrerer [V-modellen](https://en.wikipedia.org/wiki/V-Model_(software_development)). V-modellen forsøger at hindre, at fejl og mangler først findes sent i udviklingsprocessen. Idéen er at der er fokus på test lige fra projektstart. At man _samtidig_ med at definere forretningskrav som user stories, designer accept tests til disse user stories. At man _samtidig_ med at udarbejde high-level design (arkitektur), udarbejder integrationstests mellem lag/subsystemer. Dette princip gælder for alle test niveauer: at tests forberedes så tidligt som muligt, men kan selvfølgelig først afvikles, når koden er skrevet. At skrive tests tidligt er en del af et projekts _løbende_ kvalitetssikring. Hvis man har svært ved at designe en test, kan det være udtryk for uklarheder i en specifikation. Det sig være i user stories, en API kontrakt eller på metodesignatur niveau.

## Testniveauer

### Unit tests

Der laves unit tests for alle “udregninger” i systemet. En unit defineres typisk som en metode, men kan også være en klasse eller en komponent. Disse tests kan enten laves som [black-box](http://softwaretestingfundamentals.com/black-box-testing/) eller [white-box](http://softwaretestingfundamentals.com/white-box-testing/), og der laves både positive og negative tests (dette gælder for alle testniveauer, se mere nedenfor). Unit tests skrives og afvikles umiddelbart efter koden er skrevet for at få kortest mulig feedback (mens koden er i frisk erindring). Med mindre man laver Test-Driven Development, hvor testen skrives først.  
  
Hver enkelt unit test består af tre faser.

**1) Arrange:**

Her gøres klar til at kalde den metode der ønskes testet. Dvs. der oprettes objekter og afhængigheder.

**2) Act**

Metoden kaldes og vi får udregnet det faktiske resultat.

**3) Assert**

Nu bekræftes (eller afkræftes), at det forventede resultat og det faktiske resultat stemmer overens.

### Integration tests

Integrations tests undersøger om forskellige komponenter kan arbejde sammen (f.eks. interfaces mellem lag/subsystemer, filsystem eller database). Disse tests laves typisk som black-box. Vi kommer tilbage til integrationstests i Flow 3 når vi skal teste databaser.

### System tests

System test er end-to-end tests af adfærd for en given user story, som tester om alle komponenter virker i en helhed. Optimalt set vil vi gerne automatisere systemtests. [Selenium](https://www.selenium.dev/) er et værktøj til at automatisere på dette niveau, men er ikke pensum på 2. semester.

### Acceptance test

Her involveres kunden i opgaven og vi beder dem om at udføre acceptance tests. Det er bogstavelig talt kundens accept af systemet. Ideelt set vil de andre tests være automatiseret, men denne er typisk ikke. Accepttest kan derfor ses som en delmængde af systemtests, men udført manuelt og på kundens egen platform fremfor i udviklingsmiljø.  
De defineres tidligt i processen (på baggrund af kravene), men afvikles først til allersidst, jf V-modellen ovenfor.

## Typer af tests

### Automatiseret - Manuel

Vi kan bedst lide automatiserede tests. De tager lidt længere tid at konstruere, men det er nemt, hurtigt og billigt at køre dem igen og igen. Efter hver ændring i koden, kører vi alle tests for at bekræfte at de nye ændringer ikke har ødelagt noget. Dette kaldes regressionstesting. Nogle test kan dog være vanskelige at automatisere - f.eks. brugergrænseflade tests. Der findes værktøjer, som f.eks. [Selenium](https://www.selenium.dev/), som kan automatisere en brugergrænsefladetest, men kompleksiteten stiger som følge heraf. Selv manuelle tests skal formaliseres ellers tæller de ikke med, så [skriv det ned](https://www.youtube.com/watch?t=1&v=BSUMBBFjxrY)

### Positiv - Negativ

Positive tests undersøger om systemet kan give de korrekte resultater i normalsituationer (happy path). Negative test bruges til at bekræfte, at systemet fejler som forventet, når vi (med vilje) giver det nogle uhensigtsmæssige input. Det kunne f.eks. være at vi forsøger at bruge null eller den tomme streng som brugernavn, eller prøver at tage kvadratroden af -4.

### Funktionelle - Non-funktionelle

Test af user stories som f.eks _Opret kunde_ eller _Beregn lagerstatus_ kaldes funktionelle tests. Test af et systems kvalitet, f.eks. brugervenlighed, svartider (performance), skalerbarhed eller robusthed kaldes ikke-funktionelle tests.

### Black-box - White-box

Overordnet set er forskellen at med en black-box test er vi kun interesseret i resultatet, hvorimod med white-box test teknikken inspicerer vi kodestruktur for at identificere tests cases. En if-sætning vil udløse en test for postiv udfald af if-sætning og en test for falsk udfald. White-box teknikken sikrer således at vi får testet alle veje gennem systemet og har en meget høj [“code coverage”](https://en.wikipedia.org/wiki/Code_coverage).

### Ækvivalensklassepartionering (black-box teknik)

Ækvivalensklassepartionering er en teknik, som kan anvendes på alle testniveauer. Teknikken inddeler data i partioner, der giver samme programadfærd. Der udledes en test (kaldes mere formelt for en testcase) for hver ækvivalensklasse. Dermed systematiseres identifikationen af test cases og antal test cases reduceres.

Eksempel - metoden legalAge (er du myndig):  
![drawing](https://datsoftlyngby.github.io/dat2sem2020SpringBornholm/Modul5/Week3-Test/img/EPA_eksempel.PNG)

### Grænseværdianalyse (black-box teknik)

Grænseværdianalyse identificerer test cases i grænserne for et datasæt. Teknikken anvendes typisk i kombination med ækvivalensklassepartionering. Hvis der er en ækvivalensklasse for hhv “lille” (1-20) og “stor” (21-100), vil ækvivalensklassepartionering resultere i to test cases, hvor en værdi i midten af hver ækvivalensklasse vælges, f.eks. 10 og 50. Grænseværdianalyseteknikken vil tilføjes yderligere 6 test cases for grænseværdierne omkring ækvivalensklasserne: 0, 1, 20, 21, 100, 101.

Eksempel - metoden legalAge (er du myndig):

![drawing](https://datsoftlyngby.github.io/dat2sem2020SpringBornholm/Modul5/Week3-Test/img/BVA_eksempel.PNG)

### Code Coverage (white-box teknik)

Vi vil gerne undersøge hvor stor en del af koden som er dækket af tests. Resultatet kan enten være et samlet procenttal, eller vi kan gå i detaljer og undersøge hvilke kodelinier, som er testet. Sidstnævne kræver et værktøj (eller virkelig meget tålmodighed!). I IntelliJ er Code Coverage indbygget og køres ved at vælge “Run with Coverage”.

![drawing](https://datsoftlyngby.github.io/dat2sem2020SpringBornholm/Modul5/Week3-Test/img/coverage.png)

Resultat kan ses i plugin fanebladet “Coverage” længst til højre i IntelliJ vinduet:

![drawing](https://datsoftlyngby.github.io/dat2sem2020SpringBornholm/Modul5/Week3-Test/img/coveragedetails.png)

#### Agile testkvadranter

Dette afsnit er til orientering - og noget vi kan inddrage senere på 2. semester.

I agile projekter benytter man gerne de agile testkvadranter til at gruppere de forskellige typer og niveauer af tests. Der er ingen bestemt rækkefølge mellem kvadranterne, men man begynder typisk i Q2.

* Q1 og Q4 relaterer til intern kvalitet - _bygger vi systemet rigtigt_
* Q2 og Q3 har eksternt kundeperspektiv - _bygger vi det rigtige system_

![](https://datsoftlyngby.github.io/dat2sem2020SpringBornholm/Modul5/Week3-Test/img/Agile_Testing_Quadrants.png)

Se f.eks. denne side på [Tutorialspoint](https://www.tutorialspoint.com/agile_testing/agile_testing_quadrants.htm) som uddyber de enkelte elementer i modellen.

### Ressourcer

* Her er en god artikel om at skrive test-bar kode af [Sergey Kolodyi](https://www.toptal.com/qa/how-to-write-testable-code-and-why-it-matters)
* Læs hvad David Bernstein skriver om kodekvalitet [Let Code Quality Guide You](https://datsoftlyngby.github.io/dat2sem2020SpringBornholm/Modul5/Week3-Test/cleancode.html)
* Lisa Crispin om de fire [agile testkvadranter](https://lisacrispin.com/2011/11/08/using-the-agile-testing-quadrants/) og en imponerende [præsentation](https://lisacrispin.com/downloads/CoverBasesWithQuadrants.pdf) med mange gode detaljer
