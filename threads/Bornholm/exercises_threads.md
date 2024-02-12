# Øvelser - Tråde - Threads

## Øvelse 1

Denne øvelse handler om grundliggende anvendelse af tråde i Java.

- start
- stop
- Threads
- Runnable
- sleep

Skriv et program, der starter tre forskellige tråde:

- Task-1 : Beregner og udskriver summen af alle tal fra 1 til en milliard.
- Task-2 : Udskriver tallene fra 1 til 5. Holder 2 sekunders pause mellem hvert tal.
- Task-3 : Udskriver alle tal fra 10 og opefter. Holder pause i 3 sekunder mellem hvert tal.

Programmet skal stoppe Task-3 efter 10 sekunder.

- Hint-0: Lav tre klasser som implementerer Runnable interfacet.
- Hint-1: Brug en long til at beregne summen i Task-1.
- Hint-2: Lad main-tråden "sove" i 10 sekunder efter Task-3 er startet.
- Hint-3: Du kan stoppe Task-3 ved at indsætte en boolean variabel i løkken i run-metoden, som kan ændres fra main-tråden.

Øvelse 2: Start/stop/afbryd en tråd

```java
class WorkerCancelable implements Runnable{
    boolean keepRunning = true;
    Thread thread;
    public void run() {
        thread = Thread.currentThread();
        while(keepRunning){
            System.out.println("Hello");
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
              e.printStackTrace();
            }
        }
    }
    public void cancel() {
        keepRunning = false;
    }
}
```

```java
public class ThreadExercise3 {

    public static void main(String[] args) throws InterruptedException {
        WorkerCancelable worker = new WorkerCancelable();
        Thread t = new Thread(worker);
        t.start();
        System.out.println("DONE");
    }
}
```

a) Take a look at the code above, and see whether you anticipate what it does (prints) WITHOUT actually executing the code
Hint: If you did run the code, you will probably have to go to the Run menu to stop the program ;-)

b) Come up with the necessary changes (WITHOUT running the code)  required for the code to print this, when executed:

Hello (wait a second)
Hello (wait a second)
Hello (wait a second)
DONE

c)  If not already done, copy the code into a project in your IDE, and verify your predictions above

d) Interrupting a Thread

In your run method, change the sleep time from 1 second to 60 seconds
Add the necessary changes to print out a single “Hello” followed by a “Done” after 4 seconds.

Hint: Interrupting the thread will unblock it, figure out where to do that.
