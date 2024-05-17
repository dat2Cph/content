---
title: Samtidighedsproblemer
description: Samtidighed, tråde og executors
layout: default
nav_order: 3
parent: Øvelser
grand_parent: Trådprogrammering
permalink: /threads/exercises/concurrency/
---

# Øvelser - samtidighedsproblematikker

Det lyder næsten som et socialrealistisk drama fra 70'erne. Men det handler om nogle af de problemer vi kan komme ud for i forbindelse med trådprogrammering. Og der er mange. Vi tager blot de mest oplagte. Vi anvender de engelske termer, da det er lettest at finde hjælp og kodeeksempler på nettet til dem. De tilsvarende dansker termer nævnes, hvor det er relevant.

Hvis du har tid og lyst, så læs, forstå og kør eksempler herunder. De er hentet fra ChatGPT og giver et godt samlet overblik.

1. [Race condition](#1-race-condition)
2. [Memory Visibility problem](#2-memory-visibility-problem)
3. [Starvation](#3-starvation)
4. [Deadlocks](#4-deadlocks)
5. [Producer-Consumer problem](#5-producer-consumer-problem)

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

Starvation in concurrent programming occurs when one or more threads are prevented from progressing because other threads are monopolizing resources or locks, often due to priority levels or lock handling strategies. This can lead to situations where certain threads get very little CPU time or are unable to access necessary resources for an extended period, effectively "starving" them of the opportunity to execute.

### Example Demonstrating Starvation

Consider a scenario where multiple threads try to access a shared resource, but due to prioritization, some threads are given preference over others, leading to starvation of the lower priority threads.

```java
public class StarvationExample {
    private static final Object lock = new Object();

    private static class Worker extends Thread {
        private int runCount = 0;

        public Worker(String name) {
            super(name);
        }

        @Override
        public void run() {
            for (int i = 0; i < 10; i++) {
                synchronized (lock) {
                    runCount++;
                    System.out.println(this.getName() + " runCount: " + runCount);
                    // Simulate work
                    try {
                        Thread.sleep(100); // Hold the lock for a bit
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }
    }

    public static void main(String[] args) {
        Thread highPriority = new Worker("High Priority");
        Thread lowPriority = new Worker("Low Priority");

        highPriority.setPriority(Thread.MAX_PRIORITY);
        lowPriority.setPriority(Thread.MIN_PRIORITY);

        // Start threads
        lowPriority.start();
        highPriority.start();
    }
}
```

In this example, two threads (`highPriority` and `lowPriority`) compete for a lock on the same object. Due to the difference in thread priorities, the JVM scheduler may give preferential treatment to the `highPriority` thread, leading to the `lowPriority` thread experiencing starvation, especially in environments where thread scheduling is heavily influenced by thread priority.

### Solving Starvation

To solve or mitigate starvation, we can employ several strategies:

1. **Fair Locks**: Using locks that support fairness policies can help ensure that threads acquire locks in the order they requested them, thus preventing starvation.

```java
import java.util.concurrent.locks.ReentrantLock;

private static final ReentrantLock fairLock = new ReentrantLock(true); // Enable fairness policy

public void accessResource() {
    fairLock.lock();
    try {
        // Access the resource
    } finally {
        fairLock.unlock();
    }
}
```

2. **Semaphore with Fairness Policy**: Similar to fair locks, a semaphore with fairness turned on can ensure that permits are granted in a fair manner, respecting the order of requests.

```java
import java.util.concurrent.Semaphore;

private static final Semaphore fairSemaphore = new Semaphore(1, true); // Single permit, fairness true

public void accessResource() {
    try {
        fairSemaphore.acquire();
        // Access the resource
    } catch (InterruptedException e) {
        Thread.currentThread().interrupt();
    } finally {
        fairSemaphore.release();
    }
}
```

3. **Improving Thread Scheduling**: Adjusting the way threads are scheduled or the logic that leads to lock acquisition can help. For instance, ensuring that work is divided more evenly among threads or that threads do not hold locks for long periods can reduce the risk of starvation.

4. **Using Concurrent Collections**: Employing concurrent data structures that are designed to minimize contention and support scalable concurrency can also help alleviate starvation.

5. **Thread Pool Executors with Queueing Policies**: Using an `ExecutorService` to manage threads can help manage work distribution more evenly. Configuring thread pools with appropriate queueing policies for tasks can ensure that all tasks get executed in a timely manner.

```java
import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;

ExecutorService executor = Executors.newFixedThreadPool(N); // N is the number of threads
```

Solving starvation often involves designing the system in such a way that all threads get fair access to shared resources and ensuring that the system's overall architecture does not inherently favor certain threads over others.

## 4. Deadlocks

På dansk: **baglås**

A deadlock in concurrent programming occurs when two or more threads are waiting on each other to release resources they need, resulting in all of them being stuck indefinitely. This situation is akin to a stand-off where no thread can proceed because each thread holds a lock that the other thread needs to continue its execution. Deadlocks are problematic because they can freeze a program's execution, requiring manual intervention or a system restart to resolve.

### Example Demonstrating Deadlock

Let's consider a simple Java example that provokes a deadlock situation involving two threads and two shared resources.

```java
public class DeadlockExample {
    // Two resources
    private static final Object resource1 = new Object();
    private static final Object resource2 = new Object();

    public static void main(String[] args) {
        // Thread 1 tries to lock resource1 then resource2
        Thread thread1 = new Thread(() -> {
            synchronized (resource1) {
                System.out.println("Thread 1: Locked resource 1");

                try {
                    Thread.sleep(50); // Simulate work
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }

                synchronized (resource2) {
                    System.out.println("Thread 1: Locked resource 2");
                }
            }
        });

        // Thread 2 tries to lock resource2 then resource1
        Thread thread2 = new Thread(() -> {
            synchronized (resource2) {
                System.out.println("Thread 2: Locked resource 2");

                try {
                    Thread.sleep(50); // Simulate work
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }

                synchronized (resource1) {
                    System.out.println("Thread 2: Locked resource 1");
                }
            }
        });

        thread1.start();
        thread2.start();
    }
}
```

In this example, `thread1` locks `resource1` and then tries to lock `resource2`, while `thread2` locks `resource2` and then tries to lock `resource1`. If `thread1` locks `resource1` at the same time `thread2` locks `resource2`, they will each wait for the other to release the lock on the other resource, resulting in a deadlock.

### Solving Deadlocks

To solve or prevent deadlocks, you can use several strategies:

1. **Lock Ordering**: Ensure that all threads acquire locks in a consistent global order. By enforcing an ordering and ensuring that all threads lock resources in this order, you can prevent circular wait conditions.

```java
// Both threads should lock resources in the same order, e.g., resource1 then resource2.
```

2. **Lock Timeout**: Use try-lock mechanisms that allow threads to attempt to acquire a lock but give up if the lock cannot be acquired within a certain time. This can help avoid deadlock by allowing threads to back off, release any locks they hold, and retry.

```java
// Using tryLock with timeout
if (resource1.tryLock(100, TimeUnit.MILLISECONDS)) {
    try {
        if (resource2.tryLock(100, TimeUnit.MILLISECONDS)) {
            try {
                // Access the resources
            } finally {
                resource2.unlock();
            }
        }
    } finally {
        resource1.unlock();
    }
}
```

3. **Deadlock Detection**: Implement algorithms that can detect deadlocks. Once a deadlock is detected, one or more threads can be interrupted or rolled back to release their locks. This approach is more complex and is usually implemented at a system level.

4. **Single Lock**: For some applications, it might be possible to use a single lock to serialize access to all shared resources, thus avoiding deadlocks. However, this can significantly reduce concurrency and might not be feasible for all applications.

5. **Using Concurrent Data Structures**: Prefer using high-level concurrent data structures provided by the Java `java.util.concurrent` package that are designed to minimize locking and deadlock risks.

Deadlock prevention and resolution require careful design and consideration of how threads interact and compete for resources. By applying one or more of these strategies, you can reduce the risk of deadlocks in your applications.

### Deadlock detection

There are several approaches to detect deadlocks in Java, ranging from simple manual methods to more sophisticated programmatic and tool-based solutions. Here are some common ways to detect deadlocks:

### 1. **Using JConsole:**

JConsole is a monitoring tool that comes with the JDK. It can detect deadlocks in a running Java application with a graphical interface.

- Start your Java application.
- Open JConsole and connect to your Java application.
- Navigate to the "Threads" tab.
- Click on the "Detect Deadlock" button. If a deadlock is detected, JConsole will show the threads involved and the locks they are waiting on.

### 2. **Using VisualVM:**

VisualVM is another JDK tool that can be used for monitoring Java applications, including deadlock detection.

- Launch your application.
- Start VisualVM and connect to your application.
- Navigate to the "Threads" tab, where you can see thread dumps.
- Look for threads in the BLOCKED state waiting on each other, which indicates a deadlock.

### 3. **Using Thread Dump:**

You can generate a thread dump and manually inspect it for deadlocks. This can be done by sending a SIGQUIT signal to the JVM on Unix/Linux systems (using `kill -3 <pid>`) or by pressing `Ctrl+Break` on Windows in the console where the Java application is running. The thread dump can also be generated using tools like `jstack`:

```
jstack <pid>
```

The dump contains information about all threads, including their state, stack traces, and the locks they hold or wait on. Deadlocked threads are usually marked, and you can identify the resources they are waiting on.

### 4. **Programmatically Using ThreadMXBean:**

Java provides `ThreadMXBean`, an interface for the management of thread systems, which can be used to detect deadlocks programmatically.

```java
import java.lang.management.ManagementFactory;
import java.lang.management.ThreadMXBean;

public class DeadlockDetector {
    public static void checkForDeadlocks() {
        ThreadMXBean threadMXBean = ManagementFactory.getThreadMXBean();
        long[] deadlockedThreads = threadMXBean.findDeadlockedThreads(); // or findMonitorDeadlockedThreads() for older versions

        if (deadlockedThreads != null) {
            System.out.println("Deadlock detected!");
            // Additional logic can be added here, such as logging thread info or taking corrective actions
        } else {
            System.out.println("No deadlock detected.");
        }
    }

    public static void main(String[] args) {
        // Simulate application logic here
        checkForDeadlocks();
    }
}
```

This method can be particularly useful for implementing custom monitoring or alerting mechanisms within your application to automatically detect and respond to deadlocks.

### Choosing the Right Method

- For development and debugging, tools like JConsole and VisualVM are convenient for quickly checking for deadlocks without modifying the application code.
- In production environments, generating and analyzing thread dumps with `jstack` or similar tools can be a more suitable option since it doesn't require opening GUI tools or directly connecting to the JVM.
- For applications that need built-in deadlock detection and response mechanisms, using the `ThreadMXBean` programmatically can be the best approach.

Detecting deadlocks is an essential part of diagnosing and resolving concurrency issues in Java applications, and Java provides multiple tools and APIs to assist in this task.

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

<hr/>

1. [Øvelser med simple tråde](./exercises_threads.md)
2. [Øvelser med brug af Executor frameworket](./exercises_executor.md)
3. [Øvelser i samtidighedsproblematikker](./exercises_concurrency_problems.md)
4. [Oplæg til større opgave med udvikling af en chat-server](./exercises_chatserver.md)

## Shutting down an executor

In Java, when you're working with executors to manage a pool of threads, you might sometimes need to interrupt ongoing tasks, either to shut down the executor itself or to cancel specific tasks if they're no longer needed or taking too long. Here's how you can interrupt tasks in an executor:

### Shutting Down the Executor

1. **Immediate Shutdown**: Use `shutdownNow()` method of the ExecutorService. This attempts to stop all actively executing tasks, halts the processing of waiting tasks, and returns a list of the tasks that were awaiting execution. This method does not guarantee that actively executing tasks will be terminated immediately but will attempt to stop them by interrupting.

   ```java
   ExecutorService executor = Executors.newFixedThreadPool(10);
   // (submit tasks to executor)
   List<Runnable> notExecutedTasks = executor.shutdownNow();
   ```

2. **Await Termination with Timeout**: After calling `shutdown()` or `shutdownNow()`, you can use `awaitTermination(long timeout, TimeUnit unit)` to block until all tasks have completed execution after a shutdown request, or the timeout occurs, or the current thread is interrupted, whichever happens first.

   ```java
   executor.shutdown(); // Disable new tasks from being submitted
   try {
       if (!executor.awaitTermination(60, TimeUnit.SECONDS)) {
           executor.shutdownNow(); // Cancel currently executing tasks
           // Wait a bit more for tasks to respond to being cancelled
           if (!executor.awaitTermination(60, TimeUnit.SECONDS))
               System.err.println("Executor did not terminate");
       }
   } catch (InterruptedException ie) {
       // (Re-)Cancel if current thread also interrupted
       executor.shutdownNow();
       // Preserve interrupt status
       Thread.currentThread().interrupt();
   }
   ```

### Cancelling Specific Future Tasks

If you've submitted a callable or runnable task to an executor and have received a `Future<?>` in return, you can cancel the specific task using the `cancel(boolean mayInterruptIfRunning)` method on the `Future<?>` object. The argument determines whether the thread executing this task should be interrupted in an attempt to stop the task.

- **`true`**: If the task is running, it will attempt to interrupt the task.
- **`false`**: If the task is running, it will not attempt to interrupt the task.

```java
Future<?> future = executor.submit(() -> {
    // task details
});

// Attempt to cancel the task
boolean wasCancelled = future.cancel(true);
```

Using `cancel(true)` sends an interrupt to the task's thread, which can be handled in the task's logic (for example, by checking the thread's interrupted status with `Thread.interrupted()` or handling `InterruptedException`).

Remember, for the interruption to work effectively, the tasks running inside the executor need to properly handle interrupts. This often involves periodically checking the thread's interrupted status or handling `InterruptedException`, especially in tasks that perform blocking operations.
