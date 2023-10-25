# Log på din Droplet første gang

Når din Droplet er klar, skal du kopiere IP-nummeret på maskinen.

## Log-ind fra din localhost:

Vi skal nu logge ind via en ssh-forbindelse. Det gøres således:

```bash
> ssh root@ipnummer
```

Når der er skabt forbindelse til din Droplet bliver du første gang spurgt om du vil gemme et såkaldt "fingerprint". Det skal du bare svare "yes" til. Det betyder at din maskine fremover kender til Dropletten.

Nu skulle du gerne være logget på. Beviset er at din kommando-prompt fx hedder:

```bash
root @ ditdropnavn >
```

## Opdater din Ubuntu

Vi begynder med at opdatere Ubuntu:

```bash
apt update
apt upgrade (den her tager lidt tid)
```

## Kig dig omkring

Brug nu `cd` og `ls` kommandoerne til at kigge dig lidt omkring på din maskine. Du kan også prøve `pwd` for at se hvor i fil-systemet du er landet.

Når du har kigger dig lidt omkring kan du altid komme tilbage til udgangspunkt ved at taste

```bash
cd ~
```

Nu er du klar til næste lektion, hvor vi skal installere Java

[Hop tilbage til oversigten](./README.md)
