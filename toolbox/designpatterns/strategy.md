# Strategy Design Pattern

The Strategy pattern is a behavioral design pattern that enables an algorithm's behavior to be selected at runtime. The main idea behind the Strategy pattern is to define a family of algorithms, encapsulate each one of them into a separate class, and make them interchangeable. This pattern lets the algorithm vary independently from the clients that use it, meaning you can change the algorithm being used without modifying the clients or when new algorithms are needed.

## Core Components

The Strategy pattern involves three key roles:

1. **Context**: The context class contains a reference to one of the strategy objects. The context is responsible for maintaining a reference to one of the concrete strategies and communicating with this strategy. The context may define an interface that lets the strategy access its data.

2. **Strategy Interface**: This interface declares operations common to all supported versions of some algorithm. The context uses this interface to call the algorithm defined by the concrete strategies.

3. **Concrete Strategies**: These classes implement different variations of an algorithm the interface defines. Each class encapsulates a specific algorithm or behavior and can be chosen and utilized interchangeably by the context object.

### Implementation Steps

1. **Define the Strategy Interface**: This interface should declare methods common to all supported algorithms.

2. **Implement Concrete Strategies**: Create classes that implement the strategy interface, each offering a different implementation of the algorithm or behavior.

3. **Configure the Context Class**: The context class should have a method for setting the strategy and a method to execute the strategy. It delegates work to the strategy object instead of implementing multiple versions of the algorithm on its own.

## Example Scenario

Consider a payment processing system where you can choose different payment methods (e.g., PayPal, credit card, or Bitcoin). Each payment method can be implemented as a concrete strategy:

- **PaymentStrategy**: An interface with a method `pay(amount)`.
- **PayPalPayment**, **CreditCardPayment**, **BitcoinPayment**: Concrete strategies that implement `PaymentStrategy`, each providing a different way to pay.

- **PaymentContext**: Contains a reference to a `PaymentStrategy` and a method to process payments. It might also include data specific to the payment processing, like amount and order details.

The client decides which payment strategy to use and sets it on the PaymentContext at runtime. The PaymentContext then uses the selected strategy to process the payment without knowing the details of the payment method.

## Benefits

- **Flexibility**: The Strategy pattern allows for easy swapping of algorithms or behaviors in and out as needed without affecting the clients.

- **Decoupling**: It decouples the implementation details of an algorithm from the code that uses it.

- **Scalability**: New strategies can be added without changing the context or other strategies, adhering to the Open/Closed Principle.

- **Choice of Algorithms**: Clients can choose the most appropriate algorithm for their needs at runtime.

The Strategy pattern is particularly useful when you have multiple algorithms for a specific task and want to decide the best one to use at runtime. It provides a structure that facilitates the growth and interchangeability of algorithms without requiring changes to the client code.

[Back to Design Pattern overview](./README.md)
