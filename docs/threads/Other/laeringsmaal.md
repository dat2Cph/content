# Tråde

## Læringsmål

### Hold A: Efter denne uge er det målet at du

1. Kan starte, stoppe, pause og afbryde tråde i Java ved hjælp.

2. Kan give konkrete eksempler i Java på problemer der kan opstå når der er flere samtidige tråde.

3. Kan dele en opgave op i mindre dele som kan håndteres af "worker threads".

4. Kan bruge en worker thread til at håndtere http forespørgsler.

### Hold B og Bornholm

1. Kan forklare generelt hvad tråde er og hvad formålet er med dem?
   - Hvorfor vi har brug for dem?
   - Hvordan kan man se hvilke tråde der kører på din computer?
   - Hvad forskellen er på tråde og processer
   - Hvad er forskellen på brug af tråde med Threads og ExecutorService? Fordele og ulemper?
  
2. Kan anvende simple trådemekanismer i Java med Threads (ikke Executor)
   - Vis et par eksempler på hvor du starter to tråde op
   - Vis hvordan man pauser en tråd
   - Vis hvordan man afbryder en tråd (interrupt)

3. Kan anvende simple trådemekanismer i Java med Executors
    - Hvad er en Executor og hvordan instantierer man dem?
    - Vis et par eksempler på hvor du starter to tasks op
    - Vis hvordan man pauser en tråd
    - Vis hvordan man lukker en executor ned
    - Forklar lidt om hvilke typer Executors der findes (fixed, cached etc)

4. Kan demonstrere brugen af vores hjemmelavede chatserver
   - Forklar den overordnede konstruktion (tegning)
   - Hvorfor og hvordan bruger vi tråde?
   - Udvælg lidt af koden og forklar hvordan det virker
