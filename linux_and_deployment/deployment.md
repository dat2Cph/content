---
title: 8. Deployment
description: Blå og rød pille
layout: default
parent: Linux & Deployment
has_children: true
permalink: /linux/deployment/
nav_order: 9
---

# Deploy din web applikation på en Droplet

Når man skal deploye et Javalin projekt kan de gøres på flere måder. Lad din undervise guide dig. Så derfor:

![Red or Blue](./images/redblue.webp)

Vælger du den `blå pille`, skal du følge denne [blue-pill vejledning](./deployment_blue.md). Det er den letteste udgave, men det har en pris. Du kan desværre ikke bruge dit eget domænenavn, men derimod ip-nummer + portnummer.

Hvis du vælger den `røde pille`, skal du følge denne [red-pill vejledning](deployment_red.md). Den er noget mere kringlet at forstå, men giver nogle ekstra muligheder på hånden. Blandt andet for https og brug af domænenavne og subdomæner.
