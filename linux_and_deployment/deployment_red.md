---
title: Deployment - red pill
description: Den røde pille - deployment med eget domænenavn
layout: default
parent: 8. Deployment
grand_parent: Linux & Deployment
permalink: /linux/deployment/red-pill/
nav_order: 2
---

# Deployment on Droplet with Docker and Caddy

You have chosen the `red pill`. Good choice. Now you will end up with a website running on you own domain name. If you prefer going back to the `blue pill` solution, you can still [opt out now](deployment.md).

![Red or Blue](./images/red.webp)

Okay, time to dive in:

This is how you can deploy a [Javalin](https://javalin.io/) webproject on a virtual machine (VM) running [Ubuntu](https://ubuntu.com/) and [Docker](https://www.docker.com/).

You can follow this [video tutorial](https://cphbusiness.cloud.panopto.eu/Panopto/Pages/Sessions/List.aspx?folderID=322ab819-f0ca-4fc4-8e76-b15600a65ecd) that explains the steps below:

## Prerequstites

- A configured Virtual Machine setup up after this [tutorial](https://github.com/dat2Cph/content/tree/main/linux_and_deployment) step 1-7. The VM is running on [Digital Ocean](https://www.digitalocean.com/)
- A Postgresql database running on port 5432
- A Javalin webproject ready to run on port 7070
- A built version of the Javalin project created as a "fat jar"
- A domain name or subdomain with DNS set to the IP of your VM
- A firewall that allows access for port 80 and 443 (http and https)
- A ssh connection to the VM

## Goal

We wish to host the Javalin webapplication and make it accessible through a subdomain. We also want to host a static page on the main domain name. The idea is that the static webpage can be used as a
portfolio content page, that links to your Javalin webapplications each running on their own subdomain. The setup will be able to handle a number of Javalin webapplications and static webpages, but as a beginning we set up only one. Each webapplication will run in an isolated Docker container.

We also wish to get access to the web applications through https. For this we use [Caddy Server](https://caddyserver.com/) as a reverse proxy server and static file server. Caddy Server is also running in its own Docker Container.

As a last thing, we also want to use a [Postgresql database](https://www.postgresql.org/) from our Javalin Webapplication.

## Recipe

### 1. Setup Fourthingsplus demo site

As a showcase we will use this Javalin webapp: [Fourthingsplus](https://github.com/jonbertelsen/fourthingsplus_spring_2024). Clone the project, follow the instructions and create a database. Finally, try to run the project locally, and see that it works.

### 2. Build your webproject to create a fat jar

Build the fat jar with Maven Package. Now you have a `app.jar` fil in the project's target folder.

### 3. Prepare your VM

SSH to your VM and clone this repo in the `~jetty` home folder.

```bash
git clone https://github.com/dat2Cph/caddy_deployment.git
```

Use cd to enter the `caddy_deployment" folder. Take a look.

### 4. Setup the database on the VM

Do like you did on the local Postgres instance: Create a `fourthingsplus` database and execute the sql statements from the `fourthingsplus` repo README file.

### 5. Copy the fat jar to the VM using scp

Open a terminal / shell on the local dev machine in the `target` folder of the webproject. If you use the `ls` command, you should now be able to see the `app.jar` file, a.k.a. "the fat jar". Now copy the file to your VM using secure copy (scp)

```bash
scp app.jar jetty@ip:~jetty/caddy_deployment/fourthingsplus
```

That's it! Now the fat jar is copied to the VM. More precisely into the `~jetty/caddy_deployment/fourthingsplus` folder.

Check on the VM if it worked. Notice that there is also a `Dockerfile` in the same folder. Check it out and see if you can explain what it does.

### 6. Open the firewall for port 80 and 443

One the VM:

```bash
sudo ufw allow http
sudo ufw allow https
sudo ufw status
```

### 7. Fixing Caddyfile

Open the Caddyfile with nano.

It looks like this:

```plaintext
fourthings.jonbertelsen.dk {
  reverse_proxy fourthings:7070
}

jonbertelsen.dk {
  root * /srv/
  file_server
}
```

You should change the `jonbertelsen.dk` to your own domain name. The container name `fourthings` in front of the port 7070 corresponds to the container name where you Javalin webapp is running. This is setup in the `docker-compose.yml` file. Save and close the Caddyfile

### 8. Configure the docker-compose.yml

Open the `docker-compose.yml` file in nano.

It looks like this:

```yml
services:

  caddy:
    image: caddy:2.7.6
    restart: unless-stopped
    container_name: caddy-reverse-proxy
    cap_add:
      - NET_ADMIN
    networks:
      - backend
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./Caddyfile:/etc/caddy/Caddyfile
      - ./site:/srv
      - ./caddy_data:/data
      - ./caddy_config:/config

  fourthings:
    build:
      context: ./fourthings
      dockerfile: Dockerfile
    container_name: fourthings
    environment:
      - DEPLOYED=PROD
      - JDBC_USER=postgres
      - JDBC_PASSWORD=datdat2024!
      - JDBC_CONNECTION_STRING=jdbc:postgresql://db:5432/%s?currentSchema=public
      - JDBC_DB=fourthingsplus
    ports:
      - "7070:7070"
    networks:
      - backend
    restart: unless-stopped

volumes:
  caddy_data:
    external: true
  caddy_config:
    external: true

networks:
  backend:
    external: true
```

You don't need to change this for now. But notice the container_name is called `fourthings`. Also,
notice that the environment variables:

```yml
environment:
      - DEPLOYED=PROD
      - JDBC_USER=postgres
      - JDBC_PASSWORD=datdat2024!
      - JDBC_CONNECTION_STRING=jdbc:postgresql://db:5432/%s?currentSchema=public
      - JDBC_DB=fourthingsplus
```

are injected into the Javalin container. It's of course important to match the credentials and database variables with those expected of the Javalin web app. By the way, these a read from
the ConnectionPool class in the webapp.

### 9. Setup a static portfolio page

Switch into the `site` folder, and use nano to edit the static files. The `index.html` is showing
the splash portfolio domain page. The only thing you really need to change is the link to the
Javalin Fourthingsplus Webapp. Swap `jonbertelsen.dk` to your own domain name.

### 10. Setup you DNS

Create a DNS record for `fourthings.yourdomain.dk` to direct to your VM's IP

### 11. Spin up the docker containers and enjoy the rest

```bash
sudo docker compose up -d
```

### 12. Debugging and error finding

So what if the setup doesn't work?

The first shot is to look at the log files of the various containers.

- `sudo docker ps` to check if the containers are running (including Postgres)
- `sudo docker logs caddy-reverse-proxy` to check if the reverse proxy or https goes wrong
- `sudo docker logs fourthings` to check if the Javalin web app is running

If there is somethings wrong:

1. Stop the containers: `sudo docker compose down`
2. Correct your files
3. Spin up the containers again: `sudo docker compose up -d`

If something is wrong with your Javalin project, and you need to rebuild the project and copy the
fat jar to the VM again - as in step 5 above. Then we need to rebuild the images. This demands
that we shut down the running containers with `sudo docker compose down`. Then we need to remove the
built Javalin container and its image.

```bash
sudo docker ps -a
sudo docker rm [container_id_or_name]
```

Then remove the image:

```bash
sudo docker images
sudo docker rmi [image_id_or_name]
```

And then rebuild images and containers:

```bash
sudo docker compose up -d
```

Now the updated version of your Javalin web app is up'n running.

This can be done in an automated fashion with Continous Integration and Deployment - but for now
we do it manually to avoid more configuration. And for pedagogially reasons, to be able to
appreciate each step involved.
