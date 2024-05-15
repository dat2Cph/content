---
title: SOLID
layout: default
parent: Design patterns
nav_order: 14
---

# The SOLID Design Principles

The SOLID design principles are a set of guidelines for object-oriented software design intended to make software systems more understandable, flexible, and maintainable. Coined by Robert C. Martin (also known as Uncle Bob) and popularized in the early 2000s, SOLID stands for:

1. **S - Single Responsibility Principle (SRP)**: A class should have only one reason to change, meaning it should have only one job or responsibility. This principle aims to reduce complexity by ensuring that a class is focused on a single aspect of the system. When a class is charged with multiple responsibilities, changes in one part of its functionality may affect other unrelated aspects, leading to a system that is harder to understand and maintain.

2. **O - Open/Closed Principle (OCP)**: Software entities (classes, modules, functions, etc.) should be open for extension but closed for modification. This means that the behavior of a module can be extended without modifying its source code. Achieving this typically involves interfaces or abstract classes, allowing new functionalities to be added with minimal changes to the existing code. This principle encourages the use of a stable base that can grow and change with the needs of the system.

3. **L - Liskov Substitution Principle (LSP)**: Objects of a superclass should be replaceable with objects of a subclass without affecting the correctness of the program. In other words, subclasses should extend the behavior of their superclass without changing its original functionality. This principle emphasizes the need for consistency in design, ensuring that derived classes only augment and do not alter the behavior or expectations of their base classes.

4. **I - Interface Segregation Principle (ISP)**: Clients should not be forced to depend upon interfaces they do not use. This principle suggests that it's better to have many specific interfaces rather than a single, general-purpose interface. By keeping interfaces small and focused, we can ensure that implementing classes don't need to depend on methods they do not use, which leads to a cleaner, more modular design.

5. **D - Dependency Inversion Principle (DIP)**: High-level modules should not depend on low-level modules. Both should depend on abstractions. Furthermore, abstractions should not depend upon details; details should depend upon abstractions. This principle aims to reduce the coupling between different parts of a system, making it more resilient to change. By depending on abstractions rather than concrete classes, software components become more decoupled and easier to modify or replace.

Together, the SOLID principles guide developers in creating systems that are easier to maintain, scale, and understand by promoting a design that is modular, flexible, and cohesive. Following these principles helps in avoiding code smells, refactoring code, and developing software that is more robust and adaptable to change.

[Back to Design Pattern overview](./README.md)
