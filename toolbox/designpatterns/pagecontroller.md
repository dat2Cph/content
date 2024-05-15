---
title: Page Controller
layout: default
parent: Design patterns
nav_order: 12
---

# Page Controller Design Pattern

The Page Controller design pattern is a web development architectural pattern that assigns the responsibility for managing the actions and responses of a single page or request to a single controller class. This pattern is commonly used in web applications to simplify design and promote reusability of code. The essence of the Page Controller pattern is to have a separate controller for each page or request, where each controller handles all the actions associated with that page.

### Core Components

The Page Controller pattern primarily involves the following components:

1. **Controller**: In the context of this pattern, a controller is a class or object that encapsulates all the logic required to respond to a single page request. It processes input, handles user actions, invokes models for data, and determines the appropriate view to render as a response.

2. **Model**: Represents the domain-specific data and business logic of the application. The Page Controller interacts with the model to retrieve or update data in response to user actions.

3. **View**: The presentation layer that displays the user interface. In the Page Controller pattern, the controller selects and populates the view based on the model data and the outcome of the user's request.

### Implementation Steps

1. **Define Controllers**: For each page or significant request in the application, define a controller. Each controller is responsible for handling all requests to its assigned page.

2. **Implement Action Handling**: Within each controller, implement the logic required to handle actions for that page. This could include reading query parameters, processing form submissions, invoking models to access data, and applying any necessary business logic.

3. **Select View**: Based on the actions performed and the data obtained from the model, the controller selects an appropriate view to render the response. The controller populates the view with data from the model.

4. **Render Response**: The selected view is rendered as the response to the user's request, displaying the required information or user interface.

### Example Scenario

Consider a web application with multiple pages: a homepage, a product listing, and a product details page. Using the Page Controller pattern, you would create three controllers:

- **HomeController**: Handles requests to the homepage, perhaps displaying some general information and featured products.
- **ProductListController**: Manages requests to the product listing page, involving retrieving a list of products from the model and sending this list to the view for rendering.
- **ProductDetailsController**: Responds to requests for a specific product's details. It fetches the product's data from the model and populates a view to display these details.

### Benefits

- **Simplicity**: Each page's logic is encapsulated in its controller, making the application's structure easier to understand.
- **Separation of Concerns**: Separates the logic for handling requests, processing data, and rendering views, which enhances maintainability and scalability.
- **Reusability**: Common functionalities, such as authentication and error handling, can be abstracted into base controllers or services, promoting code reusability.

### Considerations

While the Page Controller pattern offers clear organization and separation of concerns, it can lead to duplication of effort for actions shared across multiple pages. Additionally, as applications grow, managing a large number of controllers can become challenging. It's important to balance the use of Page Controllers with other patterns and techniques, such as Front Controller and Command patterns, to address these challenges effectively.

[Back to Design Pattern overview](./README.md)
