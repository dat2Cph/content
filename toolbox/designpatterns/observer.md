---
title: Observer
layout: default
parent: Design patterns
nav_order: 11
---

# Observer Design Pattern

The Observer pattern is a behavioral design pattern that defines a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically. This pattern is essential for implementing distributed event handling systems, in scenarios where an object should notify multiple other objects about its changes. The Observer pattern promotes loose coupling between the subject (the object that notifies others) and the observers (the objects that are notified) because the subject doesn't need to know much about the observers, just that they implement a certain interface.

## Core Components

The Observer pattern involves two main types of participants:

1. **Subject (Observable)**: The entity that holds the state and when a change occurs, notifies the attached observers of the change. It maintains a list of observers and provides methods to add or remove observers.

2. **Observer**: An interface or abstract class defining the update method that will be called when the subject's state changes. Concrete observers implement this interface and register with a subject to receive updates.

### Implementation Steps

1. **Define the Observer Interface**: This interface should include a method (`update`) that will be called when the subject's state changes.

2. **Create Concrete Observers**: Implement the observer interface in concrete classes that should receive updates from the subject. These implementations should specify what actions to take when the subject's state changes.

3. **Define the Subject Interface**: This interface defines methods for attaching and detaching observers to the subject. It also includes a method to notify all observers of state changes.

4. **Implement the Subject**: Create a concrete subject class that implements the subject interface. It should maintain a list of observers and implement methods to add, remove, and notify observers.

### Example Scenario

Consider a weather monitoring application where a WeatherStation (subject) gathers weather data and needs to update multiple displays (observers), such as a current conditions display, a statistics display, and a forecast display, whenever the weather data changes.

- **WeatherSubject**: An interface defining methods for attaching, detaching, and notifying observers.

- **WeatherStation**: A concrete subject that implements WeatherSubject. It tracks the current weather conditions and notifies registered displays when the data changes.

- **Observer**: An interface with an `update` method that observers must implement.

- **CurrentConditionsDisplay**, **StatisticsDisplay**, **ForecastDisplay**: Concrete observers that implement the Observer interface and update themselves based on the latest data from WeatherStation.

Whenever WeatherStation updates its measurements, it calls `notifyObservers()`, which, in turn, calls the `update()` method on each registered display, allowing them to react to the new data.

## Benefits

- **Loose Coupling**: The subject doesn't need to know anything about the observers beyond that they implement the Observer interface. This makes the system more modular and easier to extend.

- **Dynamic Relationships**: Observers can be added or removed at runtime without affecting the subject or other observers.

- **Support for Broadcast Communication**: The Observer pattern supports an efficient broadcast communication, where the subject sends notifications to multiple observers in a single operation.

The Observer pattern is widely used in graphical user interface (GUI) components, event management systems, and data monitoring applications, offering a flexible mechanism for communication between objects.

[Back to Design Pattern overview](./README.md)
