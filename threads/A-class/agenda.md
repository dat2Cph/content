# Agenda
## Monday
- Slides 45 min.
- 7 first Java files in the [Demo project](https://github.com/HartmannDemoCode/ThreadsDemo.git) 45 min.
- Exercise:
  1. Create a program that can start 3 threads with reference to a Runnable objects (Tasks). 
  2. Each task should take a reference to a shared object in the constructor. 
    - The shared object has a char value starting with 'A' and a method that can increment a and return the value. 
    - The program should print all the values in the alphabet 3 times pr. line (like this: 'AAA', 'BBB', 'CCC' etc. up to 'ZZZ'). But the threads should run concurrently and use the shared object to get the next character. (The output will not be alphabetical, but that is ok). 45 min.
    - The threads should run concurrently and use the shared object to get the next character. 45 min.
  3. Create another version of the program where you will use Callable and Future to get the result from the threads. 
    - Store the returned value from the threads in a `List<Future<String>` collection. Now you should be able to run 3 threads and get the result in the main thread in the right alphabetical order. 45 min. 
- Demo Executor service.

## Wednesday
- Quiz on threads with 40 min. preparation in groups. 15 min. presentation.
  - What is a thread?
  - What is the difference between a process and a thread?
  - What is the purpose of the start method in a thread?
  - What is the purpose of the run method in a thread?
  - What is the purpose of the sleep method in a thread?
  - What is the purpose of the join method in a thread?
  - What is the purpose of the getName method in a thread?
  - What is a Callable?
  - What is the purpose of the ExecutorService?
  - What is the purpose of the submit method in the ExecutorService?
  - What is returned by the submit method in the ExecutorService?
  - What is a Future?
  - What is the purpose of the get method in the Future?
  - What is the purpose of the isDone method in the Future?
  - What is the purpose of the awaitTermination method in the ExecutorService?
  - What is the purpose of the newFixedThreadPool method in the Executors class?
  - What is the purpose of the newCachedThreadPool method in the Executors class?
  - Why do we need 2 loops to get the result from the executor service?
- Review the assignments from monday.
  - Look at the CharPrinter
- Exercise with ExecutorService:
  - Make a program that can use an ExecutorService with Cached Thread Pool to run a number of tasks. Each task should print a message with the name of the thread that runs the task. 
  - Make each task update a shared AtomicInteger (use AtomicInteger to make it thread safe) and print the value of the AtomicInteger before and after the update.
  - Change the atomic integer to an Account object with a balance (as Double) and a method to update the balance with an amount (remember how we get data into a task? ... through the constructor). 
  - Use Callable and Future to get the value of the account after the update and add the value to a list in the main thread.
 