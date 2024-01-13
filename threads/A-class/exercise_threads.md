# Threads exercises

## exercises for monday/tuesday

All exercises should use Executors and not code with threads directly.

## Exercise 1.

- Write a proram where the main thread creates a number of tasks for an ExecutorService. The first task should print `AAA`, the next `BBB`,`CCC` etc. up to `ZZZ` (there are 25 characters in total). There should be 4 worker threads in the executor service.

## Exercise 2.

- Read up on the concept of 'synchronized' (for example this page "<http://tutorials.jenkov.com/java-concurrency/synchronized.html>").  
- Fix the below code so that the Counter class´s increment method is thread safe:
```java
private static class Counter {
        private int count = 0;

        // Method to increment the count, synchronized to ensure thread safety
        public synchronized void increment() {
            count++;
        }

        // Method to retrieve the current count value
        public int getCount() {
            return count;
        }
    }
```

At the review we will ask questions about your solution.

## Exercise 3.
- Look at the code in this class: https://github.com/HartmannDemoCode/ThreadsDemo/blob/main/src/main/java/dk/cphbusiness/exercises/AddingNumbers.java. It inserts a number into an ArrayList and prints out the size of the list. The list does not always contain a thousand numbers. Why is that? Propose a solution. 
- See if you can come up with a solution that does not use synchronized.

## Exercise 4.
Most operating systems have a program that shows the performance of the system (windows: taskmanager, mac: activity monitor, linux: System Monitor).
Create a variation of one of the Executor programs that puts all your cores to work and show us the result at the review.

## Opgave 6. (ekstra)

- Look at this [list](http://www.javainterview.in/p/java-synchronization-interview-questions.html) of questions for general knowledge about threads. There are new areas here that you can explore on your own if you have time and energy :-)

## Exercises wednesday/thursday

Exercises for thursday is to reprogram our web server from last week so that it becomes more responsive (becomes faster ready for next request).

## Exercise 1.

Based on picoServer05 we make small changes to run each server response in a new thread. You need an ExecutorService that you insert just before the while loop (the one I call `workingJack` in the examples). After the while loop comes `Socket socket = server.accept();` which is a blocking call that waits for a new request from a client/browser.

Then we take all the code from the try-catch block and move it into a separate method (HINT: Refactor -> Extract -> Method: Give the method a name. Below we have called it `MakeResponse`). Now we only have a single method call under the line that creates a socket. This line can now be inserted into a run method inside an anonymous implementation of the interface: Runnable like this:

```java
...
Socket socket = server.accept();
workingJack.submit(new Runnable() {
                @Override
                public void run() {
                    try {
                        MakeResponse(socket, root);
                    } catch (IOException ex) {
                        System.out.println(ex.getMessage());
                    }
                }
            });
```

In this way all responses that the server needs to make will be put out in another thread, so that the main thread will be ready to wait for a new request from a browser as soon as possible.


## Exercise 2.
In the first exercise we started with `picoServer05` which only sends files back. In `picoServer06` we handle both files and `addournumbers`.
- There must be a task and executor that returns files - a bit like the first exercise.
- There must be a task that handles `addournumbers` (handle the entire else part - including the switch.).
- Note: You will have to move the closing of sockets into the two tasks, as they are the ones who know when they have responded to the request.

## Exercise 3.
- When you are done with exercise 2, the main thread will still have the task of creating an HttpRequest object. Repeat the process of creating methods and tasks so that even creating the HTTPRequest is done in a separate task. If you follow the process of creating new methods and tasks, this new task will create new tasks itself.

## Exercise 4.
- In the code from last week there is a class called `ClientMain`. It can be used to call a web server.
- Set it up so that on one computer you run a web server (e.g. a `picoserver06` from last week).
- Get `ClientMain` to call this server.
- Make the `ClientMain` program so that it uses executors to send many requests simultaneously to the server.
