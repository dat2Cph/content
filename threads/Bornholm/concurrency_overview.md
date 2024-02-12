# Samtidighed, tråde og executors

Når I bruger jeres computer kan man have mere end et program igang på samme tid. Man kan godt skrive en email mens man hører musik. Moderne computere har mere end en "core", din har måske 2,4,6 eller flere. Men på trods af dette faste antal kan du alligevel godt køre mere 2 eller 6 programmer samtidigt.

Dette sker ved at operativ systemet har flere processer. Den kører så hver process en lille smule (5-50 ms), og skifter så til en anden process. Da mennesker er utroligt langsomme i opfattelsen ser det ud som alle programmerne kører samtidigt. Men operativ systemet skifter altså mellem 20 og 200 gange i sekundet.

Java tillader os at skrive programmer der benytter sig af mere end en process. I Java kaldes processer for **Threads - på dansk tråde**. Programmering med mere end en tråd kaldes **concurrent**, **tråd** eller **parallel** programmering. Der er nogle der mener der er forskel på de forskellige betegnelser - I praksis mener alle cirka det samme, og ingen har kunne definere et standard ordbrug alle er blevet enige om.

Vi skal i denne uge arbejde med **concurrency**. Vi begynder med at anvende den helt primitive Java tråd (Thread), men hurtigt går vi over til at bruge et bibliotek, der tilbyder noget der kaldes **Executors**, som gør det nemmere at programmere de opgaver man typisk har brug for at løse vha. tråde.

<figure>
  <img src="../img/threads.webp" alt="Alt text for the image">
  <figcaption>This image represents Java threads as skilled weavers working together on a large, intricate tapestry. Each weaver (thread) contributes to the overall design, symbolizing the collaborative and interconnected nature of Java threads in executing (DALL-E) </figcaption>
</figure>

## Den røde tråd for ugen

Vi begynder rejsen med at indentificere hvornår det kan være nyttigt at anvende tråde. Derefter tager vi fat på en række øvelser, hvor vi skal køre flere samtidige tråde i Java. Hurtigt løber vi ind i en række problemer. En del af dem er ret oplagte og andre af mere akademisk interesse. Vi vil koncentrere os om de mest oplagte. Nemlig hvordan vi undgår at tråde konkurrerer om adgangen til de samme ressourcer (**race condition**), og hvordan vi undgår at data kommer ude af synk (**visibility problem**). Dvs,
