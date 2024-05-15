---
title: Factory
layout: default
parent: Design patterns
nav_order: 6
---

# Factory Design Pattern

The Factory pattern is a creational design pattern that provides an interface for creating objects in a superclass but allows subclasses to alter the type of objects that will be created. The pattern is used to encapsulate the creation process of a product, meaning the actual instantiation of a class is separated from the client that needs the object. By doing so, the system becomes more flexible and scalable, as the client doesn't need to know the specific class to instantiate.

There are two main variations of the Factory pattern: the Factory Method and the Abstract Factory.

## Factory Method

The Factory Method pattern defines an interface for creating an object but lets subclasses decide which class to instantiate. Factory Methods let a class defer instantiation to subclasses. This pattern is particularly useful when there is a class hierarchy, and each subclass can decide how to create the appropriate objects.

**Implementation Steps:**

1. **Product Interface**: Defines the interface of objects the factory method creates.

2. **Concrete Products**: Implement the product interface in various ways.

3. **Creator Class**: Declares the factory method, which returns an object of the product interface. The creator may also provide a default implementation of the factory method.

4. **Concrete Creators**: Override the factory method to return an instance of a specific concrete product.

## Abstract Factory

The Abstract Factory pattern provides an interface for creating families of related or dependent objects without specifying their concrete classes. This pattern is useful when the system needs to be independent of how its products are created, composed, and represented.

**Implementation Steps:**

1. **Abstract Factory Interface**: Declares a set of methods for creating each of the abstract products.

2. **Concrete Factories**: Implement the abstract factory interface's methods to create concrete products.

3. **Abstract Product Interfaces**: Declare interfaces for a set of related products.

4. **Concrete Products**: Implement these interfaces to define products to be created by the corresponding concrete factory.

5. **Client Code**: Uses only interfaces declared by the Abstract Factory and Abstract Product classes. It can work with any concrete factory/product variant, as long as it communicates with their objects via abstract interfaces.

## Example Scenario: Pizza Store

Imagine you are designing a pizza store application where pizzas can be of different types and require different ingredients.

- **Factory Method**: You could have a `PizzaStore` class with a `createPizza` method (factory method). Subclasses like `NYStylePizzaStore` and `ChicagoStylePizzaStore` would override this method to create region-specific pizzas, like `NYStyleCheesePizza` and `ChicagoStyleCheesePizza`.

- **Abstract Factory**: You could define an `IngredientFactory` interface with methods like `createDough`, `createSauce`, etc. Concrete factories like `NYPizzaIngredientFactory` and `ChicagoPizzaIngredientFactory` would implement these methods to produce region-specific ingredients. The `Pizza` class would use an `IngredientFactory` to obtain its ingredients, allowing for different types of pizzas to be composed of different ingredients.

## Benefits

- **Flexibility and Scalability**: Clients are decoupled from the specific classes they need to instantiate.

- **Single Responsibility Principle**: The product creation code can be isolated in one part of the program, making the system easier to maintain and extend.

- **Open/Closed Principle**: It’s possible to introduce new types of products without breaking existing client code.

The choice between Factory Method and Abstract Factory often depends on the complexity of your creations and whether you are dealing with a single product or families of products.

[Back to Design Pattern overview](./README.md)
