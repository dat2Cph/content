---
title: 3. Log på Ubuntu med ssh
description: Log på Droplet via ssh
layout: default
parent: Linux & Deployment
permalink: /linux/login/
nav_order: 4
---

# Log på din Droplet første gang

Når din Droplet er klar, skal du kopiere IP-nummeret på maskinen.

## Log-ind fra din localhost

Vi skal nu logge ind via en ssh-forbindelse. Det gøres således:

```bash
ssh root@ip
```

Når der er skabt forbindelse til din Droplet bliver du første gang spurgt om du vil gemme et såkaldt "fingerprint". Det skal du bare svare "yes" til. Det betyder at din maskine fremover kender til Dropletten.

Nu skulle du gerne være logget på. Beviset er at din kommando-prompt fx hedder:

```bash
root@ditdropnavn ~#
```

## Opdater din Ubuntu

Vi begynder med at opdatere Ubuntu. Upgrade kan godt tage lidt tid at køre:

```bash
apt update
apt upgrade
```

- Du skal muligvis svare `Y` for at køre upgrade og tillade at de nye opdateringer bruger lidt diskplads.

- Hvis der kommer en dialog op angående openssh-server, så vælg: `install the package maintainer's version`.

- Hvis der kommer en dialog op angående `Configuration file '/etc/default/docker'` så siger du bare `Y` og kører videre.

- Hvis du får en `Pending kernel upgrade` besked, så trykker du bare [Return] og OK til at genstarte diverse services.

I det hele taget skal du bare tage Ja-hatten på og godkende diverse spørgsmål. Vi har jo ikke noget installeret i forvejen udover default, så der er ikke noget at miste ;-)

## Genstart din Droplet og log ind igen

```bash
reboot
```

Vent et minuts tid.
Fra din lokale terminal logger du ind igen:

```bash
ssh root@ip
```

## Kig dig omkring

Brug nu `cd` og `ls` kommandoerne til at kigge dig lidt omkring på din maskine. Du kan også prøve `pwd` for at se hvor i fil-systemet du er landet.

Når du har kigget dig lidt omkring kan du altid komme tilbage til udgangspunktet (din hjemmefolder) ved at taste

```bash
cd ~
```

Nu er du klar til næste lektion, hvor vi skal oprette en ny bruger.

## Videre herfra

- [Næste trin](./ubuntufix.md)
- [Hop tilbage til oversigten](./README.md)
