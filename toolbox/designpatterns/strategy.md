---
title: Strategy
layout: default
parent: Design patterns
nav_order: 15
---

# Strategy Design Pattern

The Strategy Pattern is a behavioral design pattern that allows algorithms to be defined independently of the clients that use them. It encapsulates a family of algorithms into separate classes and makes them interchangeable. This pattern is useful in situations where a client has multiple algorithms that could be used interchangeably, depending on the context. By using the Strategy Pattern, changing algorithms becomes as easy as changing an object.

### Structure of the Strategy Pattern

1. **Strategy Interface**: This defines a common interface for all supported algorithms. This is typically an abstract class or an interface with a method that all concrete strategies will implement.

2. **Concrete Strategies**: These are classes that implement the Strategy interface. Each concrete strategy contains the implementation of a specific algorithm.

3. **Context**: This is the main class that maintains a reference to a Strategy object. It will use the strategy to execute a specific algorithm. The context is not aware of the concrete implementation of the strategy, so it remains independent of the specific algorithms.

### Advantages

- **Flexibility**: New algorithms can be introduced without modifying existing code.
- **Decoupling**: Clients are decoupled from the algorithms, reducing dependencies.
- **Maintainability**: Algorithms are encapsulated within individual classes, making them easier to maintain and test.

### Example Structure in UML

```
+---------------------+           +------------------+
|      Context        |           |   <<interface>>  |
|---------------------|           |     Strategy     |
| - strategy: Strategy|           |------------------|
|---------------------|           | + execute(): void|
| + setStrategy(Strategy)         +------------------+
| + performTask()                 /        ^
+---------------------+          /         |
                                /          |
                    +------------------+  +------------------+
                    |ConcreteStrategyA|  |ConcreteStrategyB|
                    +------------------+  +------------------+
                    | + execute(): void|  | + execute(): void|
                    +------------------+  +------------------+
```

### Explanation of UML Diagram

- **Context**: Contains a reference to a Strategy object that will execute a specific algorithm.
- **Strategy**: An interface that defines a contract for all strategies.
- **ConcreteStrategyA** and **ConcreteStrategyB**: Specific implementations of the Strategy interface.

### Applying the Strategy Pattern

**1. Define the Strategy Interface**: Start by creating an interface or abstract class that declares a method representing the algorithm.

**2. Implement Concrete Strategies**: Implement this interface or abstract class with different algorithmic logic in each concrete strategy.

**3. Create a Context Class**: The context class will hold a reference to the strategy object and delegate the work to the currently selected strategy.

**4. Assign Strategy Dynamically**: In the client code, dynamically assign a particular strategy to the context based on the specific requirements.

### Example Usage

In a payment processing application, different payment methods like credit card, PayPal, and bank transfer can be used interchangeably. The payment system can switch between these methods by using the Strategy Pattern.

### Summary

The Strategy Pattern provides a way to separate the logic of different algorithms from the client code that uses them. It makes adding new algorithms easy and keeps the code flexible and maintainable by adhering to the Open-Closed Principle.

[Back to Design Pattern overview](./README.md)
