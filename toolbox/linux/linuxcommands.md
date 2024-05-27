---
title: Linux Commands
description: Short cuts to Linux commands
layout: default
nav_order: 1
parent: Linux
grand_parent: Toolbox
permalink: /toolbox/linux/commands/
---

# Useful Linux commands

|command | comment|
|---|---|
|`adduser <username>` | add a new user and provide password when prompted twice|
|`sudo su` | Be root|
|`su <username>` | Change user|
|`group <username>` | Check users group memberships|
|`cd <folder path>` | change directory|
|`cd ..`| Go up one directory|
|`ls` | List content of current directory|
|`ls -al` | List all files and folders|
|`mkdir` | Create new directory|
|`rm <filename>` | Delete file|
|`rm -r <foldername>` | Delete directory and all its content|
|`rm -rf <foldername>` | Force remove (supress warnings)|
|`cp <file1> <file2>` | Copy a file1 into file2|
|`cp -r <folder1> <folder2>` | Copy a folder to another|
|`mv <file1> <file2>` | Rename file|
|`mv <file1> <folder1>` | Moves file to folder|
|`touch <file>` | Creates a new file in the current directory|
|`cat <file>` | read content of file|
|`cat > <file>` | copy standard input (keyboard) into file|
|`chmod`| changes permissions on files and folders [Click](http://www.computerhope.com/unix/uchmod.htm)|
|`man <command>` | See the documentation e.g man cat|
|`locate <file>` | Search for a file|
|`scp <filename>  <user>@yourIP:/home/<user>/<some folder>/<some subfolder>`| Upload file to server|
|`scp <user>@yourIP:/home/<user>/<some folder>/somefile.txt ~/downloads/temp/`| Download file from server |
|`wget <http url>` | Download a file from internet to current location|
|`history` | Show recently used commands |
|`groups <username>` | Find the memberships for the user |
