---
title: Data Mapper
layout: default
parent: Design patterns
nav_order: 3
---

# Data Mapper Design Pattern

The Data Mapper design pattern is an architectural pattern used to manage data persistence and transfer between objects in your application and a relational database, while keeping them independent of each other and the mapper itself. The key idea is to have a layer of mappers that moves data between objects and a database while keeping them separate. This means the objects and the database do not need to know about each other, or how they are stored or retrieved, allowing for more flexible code that's easier to maintain.

In this pattern, the **Data Mapper** itself is responsible for reading data from the database and converting it into objects for the business logic to use, as well as taking the objects and translating them back into database rows. This separation of concerns allows developers to change the database schema or the object model without affecting the other part. For example, you could switch from using a SQL database to a NoSQL database with minimal changes to your application code, provided the data mapper is updated accordingly.

The components involved in the Data Mapper pattern are:

- **Domain Model**: This consists of the business logic and data structures relevant to the application. Objects in the domain model focus on representing concepts of the business, its rules, and logic but are unaware of the underlying database.

- **Data Source Layer**: This is where the database resides. It's the layer that the application interacts with to perform CRUD operations (Create, Read, Update, Delete) but is designed to be independent of the business logic layer.

- **Data Mapper**: The mapper sits between the Domain Model and the Data Source Layer. It's responsible for transferring data between these two layers. When information is retrieved from the database, the data mapper constructs domain objects using this data. Conversely, it translates domain objects back into database rows when data needs to be persisted.

The main benefits of the Data Mapper pattern include:

- **Decoupling**: The business logic is decoupled from the database. Changes in the database schema do not affect the domain model and vice versa.

- **Flexibility**: It's easier to switch between different types of databases or change the domain model as the application evolves.

- **Maintainability**: By separating concerns, the application becomes more maintainable and understandable.

The Data Mapper pattern is particularly useful in applications with complex business logic or where the database schema and the domain model do not match up closely. It requires more initial setup than simpler Active Record ORM implementations, but its flexibility and separation of concerns can lead to cleaner, more modular code in larger applications.

[Back to Design Pattern overview](./README.md)
