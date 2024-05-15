---
title: Kursusindhold 2. semester på Cphbusiness
layout: default
---

<button class="btn js-toggle-dark-mode">Dark color scheme</button>

<script>
const toggleDarkMode = document.querySelector('.js-toggle-dark-mode');

jtd.addEvent(toggleDarkMode, 'click', function(){
  if (jtd.getTheme() === 'dark') {
    jtd.setTheme('light');
    toggleDarkMode.textContent = 'Dark skin';
  } else {
    jtd.setTheme('dark');
    toggleDarkMode.textContent = 'Light skin';
  }
});
</script>

# Velkommen til kursusmaterialer på 2. semester

## Kursusmateriale til semester flows

1. [OOP, GIT og TDD](./oop_git_tdd)
2. [HTTP protokollen og netværk](./http_network)
3. [Tråde og performance](./threads)
4. [Databaser](./databases/)
5. [Frontend](./webstack/frontend)
6. [Backend](./webstack/backend)
7. [Lifehack](./lifehack)
8. [Cupcake](./cupcake)
9. [Linux og deployment](./linux_and_deployment)
10. 3D-print / [SVG tegninger](./svg)
11. [Forretningsforståelse](./business)
12. Semesterprojekt

## Bonus materiale og selvstudier

1. [Integrationtest](carport/integrationtest.md)
2. [SendGrid tutorial](./sendgrid/sendgrid)
3. [Toolbox](toolbox/)
4. [Teamwork og gruppekontrakt](./teamwork/gruppekontrakt.docx)

## Værktøjskasse / Toolbox

Vi har samlet en række nyttige links i en

## Om 2. semester

Selve afviklingen af 2. semester foregår via Moodle. Dvs, at man på Moodle kan se tid/sted for undervisningen og hvad der arbejdes med hvornår. Det meste af indholdet ligger her på GitHub. Det har vi valgt at gøre fordi mange af materialerne indholder kodestumper, som GitHub kan gengive med fremhævning af syntaks og mulighed for at kopiere indholdet. Det sparer os alle for meget tid og besvær.
