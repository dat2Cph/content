---
title: OOP, GIT og TDD
description: Introduction to the semester
layout: default
nav_order: 2
permalink: /oop-git-tdd/
---

# OOP, GIT og TDD

## Læringsmål for OOP, GIT og TDD

- [Læringsmål](./laeringsmaal.md)

## Before the class you should

### Monday: TDD

### Wednesday: GIT

Important: Watch the [3 videos about git](resources.md#videos) before the class.

### A Class Agenda

0. Introduction and Demo of Collaboration with Git
1. Install Git with Git Bash
2. Configure Git and setup token for GitHub
3. Working in pairs:

- Create a new repository on GitHub
- Clone the repository to both computers
- Create a new project in IntelliJ
- Add the project to the repository
- Commit and push your changes to GitHub
- Pull the changes from GitHub to your computer

4. Create a new branch each

- Make changes to the Main class
- Commit and push your new branches to GitHub
- Create a pull request for your own branch and merge it into master
- Solve any merge conflicts that may occur
- Pull the changes from GitHub to your computer

5. Reviewing Commit History

- Show the full commit history with `git log --graph --all --decorate --oneline`
- Identify the commit hashes, authors, and commit messages
- Discuss the purpose of each commit
- Make a few more commits to the repository with some more changes to the Main class (Important: Write a good and telling commit message for each commit)
- Delete the Main class and commit the change
- With the use of git log, find the commit hash has the best version of the Main class
- Create a new branch from this commit called `featureMainClass` and check it out
- Make changes to Main class and commit the changes
- Cherry pick the commit that deleted the Main class and put it on top of the `featureMainClass` branch
- Try `git log --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit` to get a nice overview of the commit history

6. Undoing Changes

- Pull the latest changes from GitHub
- Add a new method to the Main class called `public static void printNumbers(int start, int end)`. The method should print the numbers from start to end.
- Use `git stash` to stash your changes
- Create and checkout a new branch called `featurePrintNumbers` and add the stash to this branch
- Commit the changes to the new branch and merge it into master
- Revert back to previous commit (the one that changed the main method to print BuzzFizz instead of FizzBuzz)
- Make a comment in the code that says: "This is a comment that should be removed before committing". Add the file to the staging area
- Revert the staging area to the previous commit, but keep changes in working tree
