---
title: Git exercise
description: Git øvelse
layout: default
nav_order: 5
parent: OOP, GIT og TDD
permalink: /oop-git-tdd/git/exercise
---

# Git exercises

## Preparation

- This is a group exercise. In your group, create a new repository on GitHub. Call it `git-exercises`.
- Invite all group members as collaborators.
- Create a new project in IntelliJ. Call it `git-exercises` and add a README.md file.
- Add the project to your new repository on GitHub.
- Commit and push your changes to GitHub.
- Clone the repository to each group members computers.
- **Remember the git guidelines:**
  1. `git pull` before you start working on each new task (always git pull from the shared repository before making changes to the code)
  2. Commit often (when breaking the code down to small steps, you should commit after each step and push to GitHub to minimize the risk of merge conflicts)
  3. `git status` to check the status of your repository before adding and committing changes (This is a good habit to get into make commits as small as possible and precise as possible - If your commit message does not cover what has been changed in the code, you should consider rewriting the commit message or removing some files from the staging area before commiting).

## Exercise 1 Merge conflicts

- Each group member creates a new branch called `feature<Your Name>`.
- Make a commit in the new branch with a class: main/java/Main.java containing code that solves the following problem:
  - Write a program that prints the numbers from 1 to 100. But for multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”. For numbers which are multiples of both three and five print “FizzBuzz”.
- Push the branch to GitHub.
- When all group members have pushed their branch to GitHub, each group member create a pull request for their own branch and merge it into master.
- Solve any merge conflicts that may occur.

## Exercise 2 Reviewing Commit History

- Use git log to explore the commit history. Identify the commit hashes, authors, and commit messages. Discuss the purpose of each commit.
- Make a few more commits to the repository. Commit 1: Change the main method to print the numbers from 1 to 200. Commit 2: Change the main method to print BuzzFizz instead of FizzBuzz (remember to commit often and push to GitHub after each commit) and solve any merge conflicts that may occur.
- Use git log again to find the commit hash that changed the main method to count to 200.
- Create a new branch from this commit called `featureCount200`, and check it out.
- Cherry pick the commit that changed the main method to print BuzzFizz instead of FizzBuzz and put it on top of the `featureCount200` branch.
- Try `git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit` to get a nice overview of the commit history.

## Exercise 3: Undoing Changes

- Pull the latest changes from GitHub.
- Add a new method to the Main class called `public static void printNumbers(int start, int end)`. The method should print the numbers from start to end.
- Use `git stash` to stash your changes.
- Create and checkout a new branch called `featurePrintNumbers` and add the stash to this branch.
- Commit the changes to the new branch and merge it into master.
- Revert back to previous commit (the one that changed the main method to print BuzzFizz instead of FizzBuzz).
- Make a comment in the code that says: "This is a comment that should be removed before committing". Add the file to the staging area.
- Revert the staging area to the previous commit, but keep changes in working tree.
