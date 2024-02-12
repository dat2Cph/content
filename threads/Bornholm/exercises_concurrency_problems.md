# Øvelser - samtidighedsproblematikker

Det lyder næsten som et socialrealistisk drama fra 70'erne. Men det handler om nogle af de problemer vi kan komme ud for i forbindelse med trådprogrammering. Og der er mange. Vi tager blot de mest oplagte. Vi anvender de engelske termer, da det er lettest at finde hjælp og kodeeksempler på nettet til dem. De tilsvarende dansker termer nævnes, hvor det er relevant.

## 1. Race condition

På godt dansk: **datakapløb**

A race condition occurs in software when two or more threads or processes attempt to change shared data at the same time and the outcome depends on the non-deterministic ordering of their execution (i.e., the "race" between threads). This can lead to unpredictable results and bugs that are difficult to reproduce and fix, especially in concurrent programming environments.

Race conditions often occur in the context of shared resources, where improper synchronization leads to conflicting operations that do not execute in the intended sequence. The typical consequences include corrupted data, deadlocks, and system crashes.

### Example Demonstrating a Race Condition

Let's illustrate a race condition with a simple Java example involving two threads incrementing a shared counter without proper synchronization.

```java
public class RaceConditionExample {
    private static int counter = 0;

    public static void main(String[] args) throws InterruptedException {
        Thread thread1 = new Thread(RaceConditionExample::incrementCounter);
        Thread thread2 = new Thread(RaceConditionExample::incrementCounter);

        thread1.start();
        thread2.start();

        thread1.join();
        thread2.join();

        System.out.println("Expected counter to be 20000, but found " + counter);
    }

    private static void incrementCounter() {
        for (int i = 0; i < 10000; i++) {
            counter++; // This is where the race condition occurs
        }
    }
}
```

In this example, two threads are incrementing the `counter` variable 10,000 times each. Ideally, you would expect the final value of `counter` to be 20,000. However, due to the race condition caused by simultaneous access to the `counter` variable without synchronization, the actual result may vary with each execution. This is because the increment operation (`counter++`) is not atomic; it involves three steps: reading the value, incrementing it, and writing it back. When these steps are interleaved between threads, the write-back by one thread may overwrite the increment made by another, leading to lost updates.

### Solving the Race Condition

A common way to solve this race condition is by using synchronization mechanisms to ensure that only one thread can increment the counter at a time, thus preserving the correctness of the operation. In Java, you can achieve this by using the `synchronized` keyword, atomic variables like `AtomicInteger`, or higher-level concurrency controls from the `java.util.concurrent` package.

Here's a quick fix using `synchronized`:

```java
private static synchronized void incrementCounter() {
    for (int i = 0; i < 10000; i++) {
        counter++; // Now this operation is thread-safe
    }
}
```

By making the `incrementCounter` method `synchronized`, you ensure that only one thread can execute it at a time, which prevents the race condition. However, using `synchronized` in this way can lead to performance bottlenecks, so for simple atomic operations like incrementing a counter, using `AtomicInteger` from `java.util.concurrent.atomic` package is usually a better choice.

## 2. Memory Visibility problem

På dansk: **synlighedsproblem med delt lager**

The memory visibility problem in concurrent programming occurs when changes made to a variable by one thread are not visible to other threads. This problem is a consequence of optimizations made by compilers and hardware, such as caching variables in registers or local caches of CPU cores, which can prevent updates from being immediately written back to main memory. Without proper synchronization, there is no guarantee that a thread reading a variable will see the latest value written by another thread.

### Example Demonstrating the Memory Visibility Problem

Consider a simple Java example where one thread updates a boolean flag, and another thread reads this flag in a loop. Without proper synchronization, the change made by the first thread may not be visible to the second thread.

```java
public class VisibilityProblemExample {
    private static boolean flag = false;

    public static void main(String[] args) throws InterruptedException {
        new Thread(() -> {
            while (!flag) {
                // Thread 1: Waiting for flag to become true
            }
            System.out.println("Flag is true. Exiting...");
        }).start();

        Thread.sleep(1000); // Simulate some processing

        new Thread(() -> {
            flag = true; // Thread 2: Update flag
            System.out.println("Flag set to true.");
        }).start();
    }
}
```

In this example, it's possible that the first thread never exits the loop because the change to `flag` made by the second thread is not visible to it. This behavior can vary between executions and environments, making the problem difficult to diagnose and reproduce.

### Solving the Memory Visibility Problem

The memory visibility problem can be solved by ensuring that updates to variables are made visible to all threads. This can be achieved using various synchronization mechanisms in Java:

1. **Volatile Keyword**: Declaring the `flag` variable as `volatile` guarantees that any read or write to the variable will be done directly to main memory. This ensures that changes made by one thread are visible to all other threads.

```java
private static volatile boolean flag = false;
```

By marking `flag` as `volatile`, we ensure that any thread that reads `flag` sees the most recent modification to it.

2. **Synchronization Mechanisms**: Using `synchronized` blocks or methods to control access to the variable also ensures visibility, as entering and exiting a synchronized block establishes a happens-before relationship that guarantees memory visibility.

```java
private static boolean flag = false;
private static final Object lock = new Object();

// In Thread 1 (reader)
synchronized(lock) {
    while (!flag) {
        // Wait for flag to become true
    }
}

// In Thread 2 (writer)
synchronized(lock) {
    flag = true;
}
```

3. **Locks from `java.util.concurrent.locks`**: Using explicit locks can also ensure visibility. When a lock is released by one thread, any changes made before the release are visible to any thread that acquires the lock afterward.

```java
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

private static boolean flag = false;
private static final Lock lock = new ReentrantLock();

// In Thread 1 (reader)
lock.lock();
try {
    while (!flag) {
        // Wait for flag to become true
    }
} finally {
    lock.unlock();
}

// In Thread 2 (writer)
lock.lock();
try {
    flag = true;
} finally {
    lock.unlock();
}
```

Each of these solutions addresses the memory visibility problem by ensuring that updates to shared variables are properly published across threads, thus avoiding stale or inconsistent views of data. The choice of mechanism depends on the specific requirements and context of your concurrent application.

## 3. Starvation

På dansk: **udsultning**

## 4. Deadlocks

På dansk: **baglås**

## 5. Producer-Consumer problem

På dansk: **producent-konsument problem**

The Producer-Consumer problem is a classic example of a multi-process synchronization problem. The problem describes two types of processes, producers and consumers, who share a common, fixed-size buffer used as a queue. The producer’s job is to generate data, put it into the buffer, and start again. At the same time, the consumer is consuming the data (i.e., removing it from the buffer), one piece at a time.

Here is a simple explanation of the problem:

- **Producer**: Produces data and puts it into the buffer. If the buffer is full, it needs to wait for the consumer to consume at least one item before it can put more data into the buffer.
- **Consumer**: Consumes data from the buffer. If the buffer is empty, it needs to wait for the producer to produce at least one item.
- **Buffer**: A finite-sized storage that producers write to and consumers read from. Typically, this is implemented as a queue.

The main challenges in the Producer-Consumer problem are ensuring that the producer doesn’t try to add data into the buffer if it’s full and ensuring the consumer doesn’t try to remove data from the buffer if it’s empty.

In modern Java, the Producer-Consumer problem is often solved using higher-level concurrency utilities provided by the `java.util.concurrent` package, which simplifies the handling of synchronization, communication between threads, and other concurrency issues. One of the most common approaches is to use the `BlockingQueue` interface, which represents a thread-safe queue that automatically handles waiting for the queue to become non-empty when retrieving an element and waiting for space to become available in the queue when storing an element.

Here's how you could implement the Producer-Consumer problem using a `BlockingQueue` in Java:

```java
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

public class ProducerConsumerExample {
    public static void main(String[] args) {
        BlockingQueue<Integer> queue = new LinkedBlockingQueue<>(10); // Buffer with capacity of 10

        // Create and start producer and consumer threads
        Thread producerThread = new Thread(new Producer(queue));
        Thread consumerThread = new Thread(new Consumer(queue));

        producerThread.start();
        consumerThread.start();
    }
}

class Producer implements Runnable {
    private BlockingQueue<Integer> queue;

    public Producer(BlockingQueue<Integer> queue) {
        this.queue = queue;
    }

    @Override
    public void run() {
        try {
            for (int i = 0; i < 50; i++) {
                System.out.println("Produced: " + i);
                queue.put(i); // Automatically waits if the queue is full
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }
}

class Consumer implements Runnable {
    private BlockingQueue<Integer> queue;

    public Consumer(BlockingQueue<Integer> queue) {
        this.queue = queue;
    }

    @Override
    public void run() {
        try {
            while (true) {
                Integer value = queue.take(); // Automatically waits if the queue is empty
                System.out.println("Consumed: " + value);
                // In a real application, you might want to have a condition to break out of the loop
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }
}
```

In this example, `LinkedBlockingQueue` is used as the implementation of `BlockingQueue`. It's a thread-safe queue based on linked nodes and was designed to handle high concurrency. The `put()` method is used by the producer to add elements to the queue and will block if the queue is full until space becomes available. Conversely, the `take()` method is used by the consumer to retrieve elements from the queue and will block if the queue is empty until an element becomes available.

This approach has several advantages over using low-level synchronization methods like `wait()` and `notify()`:

1. **Simplicity**: The `BlockingQueue` abstracts away the details of locking and condition checking, making the code easier to understand and maintain.
2. **Safety**: It reduces the risk of common concurrency pitfalls, such as missed signals or deadlocks.
3. **Versatility**: The Java Concurrency API provides several `BlockingQueue` implementations to choose from, each optimized for different scenarios.

Using high-level concurrency utilities like `BlockingQueue` allows developers to focus more on business logic rather than the intricacies of thread synchronization, making concurrent programming in Java more accessible and reliable.
