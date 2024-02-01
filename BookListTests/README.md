# BookList App

## Tech Stack

- **Swift**: The programming language used for iOS app development.
- **SwiftUI**: The UI framework used for building the user interface.


## Project Structure

The project follows a standard iOS app structure:

- **Models**: Contains the `Book` struct, defining the data model for books.
- **Views**: Contains the `ContentView` SwiftUI view, responsible for displaying the list of books.
- **ViewModels**: Contains the `BooksViewModel` class, which manages the data and logic for the list of books following the MVVM (Model-View-ViewModel) architecture.
- **Services**: Contains the `NetworkingService` class and `NetworkingServiceProtocol` protocol, responsible for fetching books from an external API.
- **Tests**: Contains unit tests for the `BooksViewModel` class.


## High-Level Architecture Design

The app follows a Clean Architecture design pattern with MVVM:

- **Entities**: Represented by the `Book` struct, defining core business objects.
- **Use Cases (Interactors)**: The `BooksViewModel` acts as a use case or interactor, handling business logic related to fetching and managing books.
- **Interfaces (Protocols)**: The `NetworkingServiceProtocol` defines the boundary for networking services.
- **Data Layer**: The `NetworkingService` class implements concrete data access using URLSession.
- **Presentation Layer (MVVM)**: SwiftUI views (e.g., `ContentView`) represent the presentation layer, and the `BooksViewModel` acts as the ViewModel, managing the presentation logic.
- **Dependency Injection**: Dependencies (e.g., networking service) are injected into the `BooksViewModel`, promoting flexibility and testability.

## Test Coverage

The project includes unit tests for critical components:

- **BookListTests**: Tests the `BooksViewModel` class using a mock networking service.
- **MockNetworkingService**: Mock implementation of `NetworkingServiceProtocol` for testing purposes.

