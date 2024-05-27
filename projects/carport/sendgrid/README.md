---
title: 5.2 SendGrid
description: Tutorial, hvor du lærer at sende mails fra Java
layout: default
parent: Carport projekt
grand_parent: Projekter
nav_order: 7
permalink: /projekter/carport/sendgrid/
---

# Afsendelse af emails via SendGrid

Denne vejledning er inspireret af dette [blogindlæg](https://www.twilio.com/blog/send-dynamic-personalized-party-emails-sendgrid-java)

Følg disse [video tutorials](https://cphbusiness.cloud.panopto.eu/Panopto/Pages/Sessions/List.aspx?folderID=cab16aeb-2842-454a-8c5a-b0cb00f4787e) - og støt dig til vejledningen herunder for snippets etc:

1. Opret en konto hos [SendGrid](https://sendgrid.com/)
2. Lav en `Sender Authentication` og brug en emailadresse som afsender og reply-to - der ikke er din studiemail. Men gerne gmail, hotmail etc.
3. Opret en `dynamic template`. Findes under menupunktet `Email API`
4. Opret en `API nøgle`
5. Opret et Java/Maven projekt
6. Tilføj følende til `pom.xml`:

```xml
    <dependencies>
        <dependency>
            <groupId>com.sendgrid</groupId>
            <artifactId>sendgrid-java</artifactId>
            <version>4.10.1</version> <!-- Use the latest version -->
        </dependency>
    </dependencies>
```

7. Opret SENDGRID_API_KEY som miljøvariabel i IntelliJ og sæt værdien til den du har fået fra SendGrid

8. Test om din miljøvariabel er rigtig opsat ved at køre følgende i Main:

```java
String API_KEY = System.getenv("SENDGRID_API_KEY");
System.out.println(API_KEY);
```

Hvis det virker, skulle nøglen gerne blive udskrevet.

9. Indsæt følgende i `Main` i stedet:

```java
// Erstat xyx@gmail.com med din egen email, som er afsender
Email from = new Email("xyx@gmail.com");
from.setName("Johannes Fog Byggemarked");

Mail mail = new Mail();
mail.setFrom(from);

String API_KEY = System.getenv("SENDGRID_API_KEY");

Personalization personalization = new Personalization();

/* Erstat kunde@gmail.com, name, email og zip med egne værdier ****/
/* I test-fasen - brug din egen email, så du kan modtage beskeden */
personalization.addTo(new Email("kunde@gmail.com"));
personalization.addDynamicTemplateData("name", "Anders And");
personalization.addDynamicTemplateData("email", "anders@and.dk");
personalization.addDynamicTemplateData("zip", "2100");
mail.addPersonalization(personalization);

mail.addCategory("carportapp");

SendGrid sg = new SendGrid(API_KEY);
Request request = new Request();
try
{
    request.setMethod(Method.POST);
    request.setEndpoint("mail/send");

    // indsæt dit skabelonid herunder
    mail.templateId = "d-02687f175d1e4a5fb64da1bd3e97ea26"; 
    request.setBody(mail.build());
    Response response = sg.api(request);
    System.out.println(response.getStatusCode());
    System.out.println(response.getBody());
    System.out.println(response.getHeaders());
}
catch (IOException ex)
{
    System.out.println("Error sending mail");
    throw ex;
}
```

10. Kør koden og kryds fingre for at mailen ligger i din indbakke.

11. Refactor koden, så du flytter den ud i sin egen `Util` klasse og metode:

```java
public boolean sendMail(String to, String name, String email, String zip)
```

Lad metoden returnere en boolean, der fortæller om afsendelsen gik godt (response.getStatusCode() er 202)

12. Tip: hvis du har brug for at lave flere forskellige typer emails, med flere forskellige parametre (andet end `to`, `email`, `zip`), så kan man f.eks. proppe værdierne i et hashmap og sende dem afsnit og derefter loope sig igennem map'et og indsætte i stil med:

```java
    personalization.addDynamicTemplateData("key", "value");
```

I givet fald ville det også være nødvendig at sende `templateId` med som parameter.
