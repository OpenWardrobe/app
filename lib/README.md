![Image](https://github.com/user-attachments/assets/179ecb44-0167-4968-ab54-3198782716d0)

# Clean Architecture in OpenWardrobe

OpenWardrobe follows the principles of Clean Architecture, which emphasizes separation of concerns and independence of frameworks. Here's how the different components fit into this architecture:

## UI Layer
The UI layer is responsible for presenting data to the user and handling user interactions. In OpenWardrobe, this is represented by the various screens (e.g., `HomeScreen`, `WardrobeScreen`, `LookbookScreen`). These screens are built using Flutter widgets and are designed to be reactive, updating the UI based on the state of the application.

## Router Layer
The router layer manages navigation and routing within the application. It defines how users move between different screens and handles deep linking. In OpenWardrobe, the router is implemented using the `go_router` package, which provides a declarative way to manage routes and navigation.

## Repository Layer
The repository layer acts as an intermediary between the data sources (e.g., databases, APIs) and the rest of the application. It abstracts the data access logic and provides a clean API for the UI and business logic layers. In OpenWardrobe, the `AppRepository` is responsible for fetching user profiles and wardrobe items, ensuring that the UI does not need to know about the underlying data sources.

## Dependency Injection (DI) Layer
The DI layer is responsible for managing the dependencies of the application. It allows for easy swapping of implementations and promotes testability. OpenWardrobe uses the `get_it` package for dependency injection, which simplifies the process of providing instances of classes (like repositories and controllers) to the parts of the application that need them.

## Brick Layer
The brick layer contains the data models and business logic. It defines the structure of the data used throughout the application and encapsulates the business rules. In OpenWardrobe, this includes models like `UserProfile` and `WardrobeItem`, which represent the core entities of the application.

By organizing the application into these distinct layers, OpenWardrobe achieves a clean architecture that is maintainable, testable, and scalable. Each layer can evolve independently, and changes in one layer do not directly impact others, adhering to the principles of separation of concerns and dependency inversion.
