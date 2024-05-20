---
title: Git installation
description: Installationsguide til Git
layout: default
grand_parent: Toolbox
parent: Git
nav_order: 1
permalink: /toolbox/git/installation
---

# Install and configure git

- [Install git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [Configure git](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)
- [Git cheat sheet](https://education.github.com/git-cheat-sheet-education.pdf)

## Github authentication

- **Creating a personal access token**: From your GitHub account, go to Settings → Developer Settings → Personal Access Token → Tokens (classic) → Generate New Token (Give your password) → Fillup the form → click Generate token → Copy the generated Token
- **Windows OS**: [Follow this guide](https://stackoverflow.com/questions/68775869/message-support-for-password-authentication-was-removed)
- **Mac OS**: [Follow this guide](https://gist.github.com/jonjack/bf295d4170edeb00e96fb158f9b1ba3c)
- **Linux OS**: Open ~/.gitconfig → Add the following lines to the file:

```text
[credential]
    helper = store
```

- **Test**: Open Git Bash → Change directory `cd` to a any git repo → Run the following command: `$ git ls-remote`
