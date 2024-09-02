---
title: Øvelser
description: Øvelser om tråde
layout: default
nav_order: 2
parent: Trådprogrammering
has_children: true
permalink: /theads/exercises/
---

# Øvelser i trådprogrammering - intro

Når I bruger jeres computer kan man have mere end et program igang på samme tid. Man kan godt skrive en email mens man hører musik. Moderne computere har mere end en “core”, din har måske 2,4,6 eller flere. Men på trods af dette faste antal kan du alligevel godt køre mere 2 eller 6 programmer samtidigt.

Dette sker ved at operativ systemet har flere processer. Den kører så hver process en lille smule (5-50 ms), og skifter så til en anden process. Da mennesker er utroligt langsomme i opfattelsen ser det ud som alle programmerne kører samtidigt. Men operativ systemet skifter altså mellem 20 og 200 gange i sekundet.

Java tillader os at skrive programmer der benytter sig af mere end en process. I Java kaldes processer for **Threads** - på dansk **tråde**. Programmering med mere end en tråd kaldes **concurrent**, tråd eller **parallel programmering**. Der er nogle der mener der er forskel på de forskellige betegnelser - I praksis mener alle cirka det samme, og ingen har kunne definere et standard ordbrug alle er blevet enige om.

Vi skal i denne uge arbejde med **concurrency**, men ikke kun med den primitive Java tråd, men med et bibliotek der tilbyder noget der kaldes Executors som gør det nemmere at programmere de opgaver man typisk har brug for at løse vha. tråde.

Men til en start skal vi prøve at anvende Javas mest simple udgave af tråde.
