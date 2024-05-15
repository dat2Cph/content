---
title: High Cohesion
layout: default
parent: Design patterns
nav_order: 7
---

# The High Cohesion Principle

High Cohesion is a fundamental principle in software design and architecture, emphasizing the importance of keeping objects, modules, or components focused on a single responsibility or closely related functionalities. It is one of the GRASP (General Responsibility Assignment Software Patterns) principles, which provide guidelines for assigning responsibilities in object-oriented design.

## Understanding High Cohesion

Cohesion refers to how closely related and focused the responsibilities of a single module or class are. High cohesion means that the elements within a module or class are strongly related to each other and perform a specific set of closely related functions. A highly cohesive module/class has several benefits:

- **Ease of Maintenance**: Since the module is focused on a single responsibility, it is generally easier to understand, maintain, and modify.

- **Reusability**: High cohesion often results in more reusable modules. When a module is designed to perform a specific set of tasks well, it can be more easily reused in different parts of the application or even in different projects.

- **Increased Reliability**: With responsibilities clearly defined and encapsulated within highly cohesive modules, there's a lower chance of unintended interactions with other parts of the program, leading to fewer bugs.

- **Simplified Testing**: Testing a highly cohesive module is easier because it has a well-defined purpose and fewer dependencies on other parts of the system.

## Achieving High Cohesion

To achieve high cohesion, designers and developers should strive to:

1. **Focus on Single Responsibility**: Ensure each module or class is charged with a single responsibility or closely related set of tasks. This aligns with the Single Responsibility Principle (SRP), one of the SOLID principles of object-oriented design.

2. **Minimize External Dependencies**: Reduce the module's reliance on external modules or classes. While some interaction is necessary, a highly cohesive module should minimize external dependencies to maintain its focus.

3. **Group Related Functions**: Functions or methods that operate on the same data or are part of the same process should be grouped within the same module or class.

4. **Refactor as Needed**: As an application evolves, its modules and classes may need to be refactored to maintain high cohesion. This might involve splitting large modules into smaller, more focused ones or consolidating related functionalities scattered across multiple modules.

## Example

Consider an application with a module responsible for handling user data. A highly cohesive version of this module would include functionalities such as creating a new user, updating user information, and deleting a user. These functionalities are closely related as they all manage user data. If the module also includes methods for sending emails to users, it may be less cohesive, as email sending could be considered a separate responsibility better handled by a dedicated module.

## Conclusion

High cohesion is a key design principle that promotes the creation of modules and classes with a focused set of responsibilities. By striving for high cohesion, developers can create more understandable, maintainable, and reliable software systems.

[Back to Design Pattern overview](./README.md)
