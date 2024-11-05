---
title: 8. Deployment
description: Den røde pille - deployment med eget domænenavn
layout: default
parent: Linux & Deployment
permalink: /linux/deployment/
has_children: true
nav_order: 10
---

# Deployment on Droplet with Docker and Caddy

When you have a Javalin project ready to deploy, there are several ways to do it. In the old days, we deployed our Java projects on an [Apache Tomcat Server](https://tomcat.apache.org/), and we accessed it by <http://ip:port>. We called it the `blue pill` solution. But things have changed. So welcome to the days of the `red pill` solution.

![Red or Blue](./images/red.webp)

We want to be able to access our Javalin project through a domain name. And we want to use **https**. And we also want to host a static page on the main domain name. The idea is that the static webpage can be used as a portfolio content page, that links to your Javalin webapplications each running on their own subdomain. The setup will be able to handle a number of Javalin webapplications and static webpages, but as a beginning we set up only one. Each webapplication will run in an isolated Docker container.

Since you are still here, we assume that you are ready to take the next step.

You have chosen the `red pill`. Good choice. Let's go!

This is how you can deploy a [Javalin](https://javalin.io/) webproject on a virtual machine (VM) running [Ubuntu](https://ubuntu.com/) and [Docker](https://www.docker.com/).

## Prerequstites

- A configured Virtual Machine setup up after this [tutorial](https://dat2cph.github.io/content/linux/) step 1-7. The VM is running on [Digital Ocean](https://www.digitalocean.com/)
- A Postgresql database running in a docker container on port 5432
- A Javalin webproject ready to run on port 7070
- A domain name or subdomain with DNS set to the IP of your VM. [Video-tutorial is here](https://cphbusiness.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=f8e7ebbb-8d17-480b-9ac2-b15600a699f2).
- A firewall that allows access for port 80 and 443 (http and https). [Video-tutorial is here](https://cphbusiness.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=b2178213-1924-4325-85c6-b15a00aba65e)
- A ssh connection to the VM

## Goal

We wish to host the Javalin webapplication and make it accessible through a subdomain.

We also wish to get access to the web applications through https. For this we use [Caddy Server](https://caddyserver.com/) as a reverse proxy server and static file server. Caddy Server is also running in its own Docker Container.

As a last thing, we also want to use a [Postgresql database](https://www.postgresql.org/) from our Javalin Webapplication.

## Recipe

### 1. Setup Fourthingsplus demo site

As a showcase we will use this Javalin webapp: [Fourthingsplus](https://github.com/jonbertelsen/fourthingsplus_spring_2024). Clone the project, follow the instructions and create a database. Finally, try to run the project locally, and see that it works.

### 2. Build your webproject to create a "fat jar"

The instructions for [building a fat jar can be found here](./deployment_fat_jar.md).

### 3. Prepare your VM

SSH to your VM as the jetty user. You should be in the home folder of the jetty user. Now change to the `deployment` folder.

```bash
cd deployment
```

Take a look. The `docker-compose.yml` file is there. This is where we will define the services that we want to run in Docker containers plus Caddy. Remember postgres i already running in a container, and the service is configured in the `docker-compose.yml` file.

### 4. Setup the database on the VM

Do like you did on the local Postgres instance: Create a `fourthingsplus` database and execute the sql statements from the `fourthingsplus` repo README file. Now the database is ready to be used by the Javalin webapp.

### 5. Copy the fat jar to the VM using scp

Open a terminal / shell on the local dev machine in the `target` folder of the webproject. If you use the `ls` command, you should now be able to see the `app.jar` file, a.k.a. "the fat jar". Now copy the file to your VM using rsync (remote sync). The syntax is like this:

```bash
rsync -av app.jar jetty@161.35.193.101:~/deployment/fourthings/
```

That's it! Now the fat jar is copied to the VM. More precisely into the `~jetty/deployment/fourthingsplus` folder.

Check on the VM if it worked.

### 6. Creating a Dockerfile for the Javalin webapp

Step into the fourthingsplus folder and create a `Dockerfile` (use nano):

```bash
cd ~jetty/deployment/fourthingsplus
nano Dockerfile
```

The Dockerfile should look like this:

```Dockerfile
FROM amazoncorretto:17-alpine
COPY ./app.jar /app.jar
EXPOSE 7070
CMD ["java", "-jar", "/app.jar"]
```

See if you can explain what it does.

### 7. Fixing Caddyfile

Navigate back to the `deployment` folder. Open a `Caddyfile` with nano.

```bash
nano Caddyfile
```

It should look like this (change the email to your own):

```plaintext
{
    email jobe@cphbusiness.dk
}

fourthings.showcode.dk {
  reverse_proxy fourthings:7070
}

showcode.dk {
  root * /srv/
  file_server
}
```

You should change the `showcode.dk` to your own domain name. The container name `fourthings` in front of the port 7070 corresponds to the container name where your Javalin webapp is running. That we setup in the `docker-compose.yml` file in a sec. Save and close the Caddyfile.

### 8. Configure the docker-compose.yml

Open the `docker-compose.yml` file in nano. Now we will add your Javalin webapp to the services, and Caddy as well. Since we already have a Postgres service running, we just add to what is already there. The total file should look like this - and remember to change the password placeholder `<dit_sikre_password>` to a real password:

```yml
services:

  db:
    image: postgres:16.2
    container_name: db
    restart: unless-stopped
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: <dit_sikre_password> # Change this password and pick a hard one
    volumes:
    - ./postgres_data:/var/lib/postgresql/data/
    ports:
    - "5432:5432"

  caddy:
    image: caddy:2.7.6
    restart: unless-stopped
    container_name: caddy
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
      - JDBC_PASSWORD=datdat2024!!
      - JDBC_CONNECTION_STRING=jdbc:postgresql://db:5432/%s?currentSchema=public
      - JDBC_DB=fourthingsplus
    ports:
      - "7070:7070"
    restart: unless-stopped

volumes:
  postgres_data:
  caddy_data:
  caddy_config:
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

are injected into the Javalin container. It's of course important to match the credentials and database variables with those expected of the Javalin web app. By the way, these a read from the ConnectionPool class in the webapp.

### 9. Setup a static portfolio page

You can this now - or wait until you feel like it. But it's a good idea to have a static page that can be used as a portfolio page. This is the main page that will be shown when you access your domain name. The static page can link to your Javalin webapps.

The tutorial for [setting up a static page can be found here](./deployment_static_pages.md).

### 10. Setup you DNS

Create a DNS record for `fourthings.yourdomain.dk` to direct to your VM's IP.

### 11. Spin up the docker containers and enjoy the rest

```bash
cd ~jetty/deployment
sudo docker compose up -d
```

### 12. Debugging and error finding

So what if the setup doesn't work?

The first shot is to look at the log files of the various containers.

- `sudo docker ps` to check if the containers are running (including Postgres)
- `sudo docker logs caddy` to check if the reverse proxy or https goes wrong
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
appreciate each step involved. On 3rd semester you will learn more about CI/CD, and how to automate the process.
