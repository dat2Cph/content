# Opret ny bruger i Ubuntu og konfigurer en firewall

## Lav en ekstra bruger (som ikke er root)

Ideen med dette er at have en user, som ikke har gude-agtige beføjelser som `root`. Altså af sikkerhedsmæssige grunde. 

### 1. Log på din Droplet via ssh

```bash
ssh root@ip
```

### 2. Opret user (vi kalder den for jetty):

```bash
adduser jetty
usermod -aG sudo jetty
su - jetty
```

### 3. Fix ssh key:

```bash
mkdir .ssh
chmod 700 .ssh
cd .ssh
nano authorized_keys
```

Kopier din public key (fra lokal .ssh folder). Den ser nogenlunde således ud:

![ssh](./images/ssh_public.png)

Vær omhyggelig med KUN at kopiere nøglen - og undgå at få blanktegn med.

### 4. Genskab access level:

```bash
chmod 600 authorized_keys
```

### 5. Konfigurer en firewall (ufw)

Vi lukker kun trafik ind til ssh, postgres fra specifikke IP-numre (hvor du arbejder fra) og på port 7070, hvor
dit website skal køre fra. Hvis du har flere websites kørende, skal de køre på hver deres port - og så må du
åbne op for flere porte.

```bash 
sudo ufw status
sudo ufw allow ssh
sudo ufw allow from <IP> to any port 5432/tcp
sudo ufw allow 7070/tcp
sudo ufw enable
```

### 6. Login fra localhost:

Fremover kan du logge på din Droplet via den nyligt oprettede `jetty` bruger:

```bash
ssh jetty@ip
```

[Hop tilbage til oversigten](./README.md)