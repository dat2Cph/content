---
title: 2. Opret Droplet
description: Lav ny Droplet hos Digital Ocean
layout: default
parent: Linux & Deployment
permalink: /linux/droplet/
nav_order: 3
---

# Opret en Droplet hos Digital Ocean

Vi skal til at oprette en virtuel maskine hos Digital Ocean. En såkaldt "Droplet".

Det koster ca. 6$ at have en virtuel maskine kørende hos Digital Ocean. De første 200$ kan du få gratis gennem GitHub Global Campus. Tilmeld dig straks og få rabat, når du lige om lidt skal oprette en Droplet.

Følg denne vejledning for at oprette maskinen:

Opret en profil hos Digital Ocean

Tilmeld dig via [https://cloud.digitalocean.com/registrations/new](https://cloud.digitalocean.com/registrations/new). Du skal bruge et betalingskort ved tilmeldingen. Hvis du har fået en rabatkupon via [GitHub Global Campus](https://education.github.com/students) kan du indtaste den senere.

## Create Droplets

Vælg at oprette en ny Droplet ved at klikke på den grønne knap øverst på forsiden. Herfra gør du således:

## Choose Region

Frankfurt for low latency

## Choose an image

From OS Marketplace: `Docker 25.0.3 on Ubuntu 22.04`

## Choose size

- Droplet Type: Basic
- CPU options: Regular, Disk type: SSD
- $6/mo with 1GB VRAM / 1 CPU / 25 GB SSD Disk / 1000 GB transer

## Choose Authentication Method

- Åbn din offentlige ssh-nøgle og kopier indholdet. Dvs, nøglen `id_rsa.pub` vises i terminalen sådan her:

```bash
cat id_rsa.pub
```

- Kommandoen `cat` viser indholdet af en fil på skærmen.
- Herefter markerer du hele nøglen og kopierer den til clipboardet. Vi skal bruge den hos Digital Ocean lige om lidt. Det er vigtigt at du får det hele med:

![sshpublic](./images/ssh_public.png)

- Vælg "New SSH key". Kopier nøglen fra dit clipboard ind i "SSH key content" og kald nøglen for "id_rsa".

## Finalize Details

- Giv din droplet et godt navn. F.eks. `2sem` som Hostname.

## Create droplet

- Nu er du klar til at oprette din droplet. Klik på `Create Droplet`
- Nu tager det et minuts tid - og så er din Droplet klar til brug - og du kan gå videre.

## Videre herfra

- [Næste trin](./logpaadroplet.md)
- [Hop tilbage til oversigten](./README.md)
