---
title: Composition over inheritance
layout: default
parent: Design patterns
nav_order: 2
---


# Composition over inheritance

The principle of composition over inheritance is a fundamental design guideline in object-oriented programming that recommends using composition to achieve code reuse over the traditional inheritance hierarchy. This principle is often encapsulated by the phrase "favor composition over inheritance."

## Inheritance

Inheritance is a mechanism whereby a new class (child or subclass) is created from an existing class (parent or superclass). The subclass inherits attributes and behavior (methods) from the superclass, and it can also add new attributes and behaviors or modify the inherited ones. While inheritance can be useful for creating hierarchical classifications and reusing code, it can also lead to problems:

- **Tight Coupling**: Subclasses are tightly coupled to their parent classes, meaning a change in the parent class can ripple down and affect all subclasses. This makes the system more fragile and less modular.

- **Inflexibility**: Inheritance hierarchies can become complex and rigid, making it difficult to refactor or extend the system. As more classes are added to the hierarchy, the harder it becomes to understand and maintain it.

- **Overuse of inheritance can lead to inappropriate relationships**, where subclasses inherit behavior they don't need, violating the principle of least knowledge.

## Composition

Composition, on the other hand, involves building classes by combining and delegating responsibilities to other classes. Instead of saying "class A is a type of class B," composition allows you to say "class A uses class B." This means that an object of one class contains references to objects of other classes as a way to reuse functionality and behavior.

## Advantages of Composition

- **Flexibility**: Composition allows for more flexible design structures. Since objects are connected through well-defined interfaces, you can easily swap out components without affecting the rest of the system. This makes it easier to change behavior at runtime or to introduce new features.

- **Modularity**: Systems designed with composition are more modular. Each component can be developed, tested, and maintained independently. This enhances the system's understandability and maintainability.

- **Reuse**: Composition enables reuse of functionality by assembling existing components in various combinations to create new behavior.

## Best Practices

- Use inheritance when there is a natural hierarchical relationship between classes, and you are confident that the relationship will not need frequent changes.

- Favor composition to achieve code reuse and when you need to change the components' behavior dynamically.

- Define class relationships based on what they do (their behaviors and capabilities) rather than what they are (their place in a hierarchy).

In summary, while inheritance can be useful in certain situations, the principle of composition over inheritance encourages developers to achieve object reuse and design flexibility through composition, leading to more maintainable and adaptable codebases.

[Back to Design Pattern overview](./README.md)
