---
title: Command
layout: default
parent: Design patterns
nav_order: 1
---

# Command Pattern

The Command pattern is a behavioral design pattern that turns a request into a stand-alone object that contains all the information about the request. This transformation allows you to parameterize methods with different requests, delay or queue a request's execution, and support undoable operations. Essentially, the Command pattern encapsulates a request as an object, thereby allowing developers to treat method calls as objects, manipulate and extend them like any other object, and simplify complex command structures such as transactions and queues.

## Core Components

The Command pattern typically involves the following key components:

1. **Command Interface**: This defines a standard interface for executing operations. It usually has a single execution method, such as `execute()`, that encapsulates the action and its parameters.

2. **Concrete Command**: Implements the Command interface and defines the binding between a Receiver object and an action. It implements the `execute()` method by invoking the corresponding operation(s) on the Receiver.

3. **Receiver**: The object that performs the actual work when the command's `execute()` method is called. It has the knowledge of how to perform the operations.

4. **Invoker**: Asks the command to carry out the request. The Invoker holds a command and can call the command's `execute()` method to perform the action. The Invoker might also be responsible for queueing commands, scheduling their execution, or storing a history of commands for undo purposes.

5. **Client**: Creates a ConcreteCommand object and sets its receiver.

## Implementation Steps

1. **Define the Command Interface**: This interface should have an `execute()` method that encapsulates the action and its parameters.

2. **Create Concrete Commands**: Implement the Command interface for each specific action you want to perform. These commands will include a reference to a receiver object and invoke a method of the receiver in their `execute()` method.

3. **Identify the Receiver**: Determine which class will act as the receiver for the command actions. This class should have the specific methods that will be called by the ConcreteCommand objects.

4. **Create the Invoker**: Implement an invoker class that will receive and execute commands. The invoker decides when to execute the command.

5. **The Client Creates Commands**: The client creates instances of ConcreteCommands and sets their receivers. The client then passes these commands to the invoker to be executed.

## Example Scenario

Imagine a scenario in a GUI application where you have buttons for different actions like Copy, Paste, and Undo. Each button's action can be encapsulated as a command object.

- **CopyCommand**, **PasteCommand**, and **UndoCommand** are ConcreteCommands that implement the Command interface.

- The **TextEditor** class acts as the Receiver, with methods to copy(), paste(), and undo() text.

- A **Button** class serves as the Invoker, with each button configured to trigger a specific Command.

- The **Application** setup (the Client) creates the ConcreteCommands, linking them with their respective Receiver (TextEditor) and assigning them to the Buttons.

This setup allows the application to add new commands easily without changing the existing classes, supporting flexible and extensible command execution mechanisms.

## Benefits

- **Separation of Concerns**: Decouples the classes that invoke the operation from the object that knows how to perform the operation.
- **Extensibility**: New commands can be added without changing existing code, following the Open/Closed Principle.
- **Composite Commands**: Supports the composition of commands, allowing macro commands that consist of several smaller commands.
- **Undo Operations**: By maintaining a history of executed commands, the pattern can support undo mechanisms.

The Command pattern is particularly useful in scenarios requiring complex command structures, transactional behavior, or undo functionality, providing a flexible and extensible framework for operation execution.

[Back to Design Pattern overview](./README.md)
