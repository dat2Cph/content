# Opret ny bruger i Ubuntu og konfigurer en firewall

## Lav en ekstra bruger (som ikke er root)

Ideen med dette er at have en user, som ikke har gude-agtige beføjelser som `root`. Altså af sikkerhedsmæssige grunde.

### 1. Log på din Droplet via ssh

```bash
ssh root@ip
```

### 2. Opret user (vi kalder den for jetty)

```bash
adduser jetty (tast et sikkert password og gem det godt)
usermod -aG sudo jetty
su jetty (tast kodeord for at logge ind som jetty med root rettigheder)
```

### 3. Fix ssh key

```bash
mkdir .ssh
chmod 700 .ssh
cd .ssh
nano authorized_keys
```

Kopier din public key (fra lokal .ssh folder). Den ser nogenlunde således ud:

![ssh](./images/ssh_public.png)

Vær omhyggelig med KUN at kopiere nøglen - og undgå at få blanktegn med.

Gem filen (`ctrl + X  Y`)

### 4. Sæt access level til nøglefilen

```bash
chmod 600 authorized_keys
```

Nu kan du logge på med `ssh jetty@ip` i stedet for root.

Log ud og log på med `jetty` brugeren:

```bash
exit
exit
```

Når du er tilbage i din lokale terminal, så logger du på som `jetty`:

```bash
ssh jetty@ip
```

Hvis det går godt, så læg mærke til at prompten hedder noget i stil med `jetty@dropletnavn:~$`

### 5. Konfigurer en firewall (ufw)

Vi lukker kun trafik ind til ssh, postgres fra specifikke IP-numre (hvor du arbejder fra) og på port 7070, hvor
dit website skal køre fra. Hvis du har flere websites kørende, skal de køre på hver deres port - og så må du
åbne op for flere porte.

```bash
sudo ufw status (viser de åbne porte - 22, 2375, 2376)
sudo ufw allow ssh
sudo ufw allow from <ip> to any port 5432 proto tcp
sudo ufw allow 7070/tcp
sudo ufw status
sudo ufw enable
```

TIP! Find IP nummer hvorfra du sidder via [https://www.myip.com/](https://www.myip.com/). Det er det IP du skal indsætte i <ip> ovenfor. Hvis du vil tilgå din Droplet andre steder fra, så skal du også tilføje de IP-numre.

### 6. Login fra localhost

Fremover kan du logge på din Droplet via den nyligt oprettede `jetty` bruger:

```bash
ssh jetty@ip
```

## Videre herfra

- [Næste trin](./java.md)
- [Hop tilbage til oversigten](./README.md)

