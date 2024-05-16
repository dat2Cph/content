---
title: Singleton
layout: default
parent: Design patterns
grand_parent: Toolbox
nav_order: 13
---

# Singleton Design Pattern

The Singleton design pattern is a software design pattern that ensures a class has only one instance and provides a global point of access to that instance. It's commonly used when exactly one object is needed to coordinate actions across the system, such as in the case of a database connection pool or a configuration manager. The Singleton pattern is part of the creational pattern category, which deals with object creation mechanisms, aiming to create objects in a manner suitable to the situation.

The core components of the Singleton pattern are:

1. **Single Instance**: The class is designed in such a way that only one instance of the class can ever exist. This is usually achieved by making the class constructor private, to prevent outside classes from creating new instances.

2. **Global Access Point**: The Singleton class provides a way to access its single instance globally. This is typically implemented by creating a static method (often named something like `getInstance()`) that acts as a constructor. If the class has not been instantiated, this method will create the instance and return it. If the instance already exists, it will return the existing instance.

The implementation of a Singleton pattern involves several key steps:

- **Private Constructor**: To prevent any other class from instantiating a new object directly with the `new` keyword.
- **Private Static Variable**: This variable holds the single instance of the class. It's private to prevent external access and static so it's shared among all instances of the class.
- **Public Static Method**: This method provides the global point of access to the instance. It checks if an instance already exists; if not, it creates one and stores it in the static variable. It then returns the instance.

Here's a simplified example of how the Singleton pattern might be implemented in Java:

```java
public class Singleton {
    // Private static variable of the same class that is the only instance of the class.
    private static Singleton instance;

    // Private constructor to prevent instantiation from other classes.
    private Singleton() {}

    // Public static method that returns the instance of the class.
    public static Singleton getInstance() {
        if (instance == null) { // If the instance hasn't been created yet.
            instance = new Singleton(); // Create a new instance.
        }
        return instance; // Return the existing or new instance.
    }
}
```

Benefits of the Singleton pattern include:

- **Controlled Access**: It provides controlled access to the sole instance, which can be important if the object is accessing shared resources or performing a critical function that needs central management.
- **Lazily Loaded**: The Singleton instance is not created until it's needed, which can contribute to a more efficient use of resources and a faster startup time for the application.
- **Global State**: It offers a way to store and access a global state.

However, it's important to use the Singleton pattern judiciously. Overuse can lead to issues such as making your code more difficult to test, leading to hidden dependencies between classes, and making it harder to manage the application's state.

[Back to Design Pattern overview](./README.md)
