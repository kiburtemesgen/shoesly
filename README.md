# shoesly

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

shoesly is a Flutter application that follows the principles of Clean Architecture, employing BLoC state management, Dartz for functional programming error handling, pagination, and GetIt for dependency injection. It aims to provide a robust and scalable architecture for building maintainable Flutter applications.

## Features

- **Clean Architecture**: The project follows the principles of Clean Architecture to achieve a clear separation of concerns, making the codebase more modular, testable, and maintainable.

- **BLoC State Management**: It utilizes the BLoC (Business Logic Component) pattern for managing the application's state, providing a predictable and reactive approach to UI updates.

- **Dartz for Error Handling**: The project incorporates Dartz, a functional programming library, for effective error handling, including features like `Either` for modeling success and failure scenarios, and `Option` for handling nullable values.

- **Pagination**: The application implements pagination techniques to efficiently load and display large datasets in smaller, manageable chunks, providing a smooth user experience.

- **GetIt Dependency Injection**: GetIt, a simple yet powerful dependency injection library, is employed for managing dependencies and promoting loose coupling between various layers of the application.

## Getting Started

To get started with the project, follow these steps:

1. Clone the repository.
2. Ensure you have Flutter and Dart installed on your machine.
3. Run `flutter pub get` to fetch the project dependencies.
4. Modify the configuration files, such as API keys or database credentials, as required.
5. Build and run the project using your preferred Flutter development environment.

## Folder Structure

The project adheres to a well-organized folder structure that promotes maintainability and scalability. Here's an overview of the main directories:

- **lib**: Contains the main application code.
  - **core**: Contains the core business logic and common utilities.
  - **data**: Handles data-related operations such as API communication, local storage, and repository implementations.
  - **presentation**: Handles the UI layer, including widgets, screens, and BLoCs.
  - **injection**: Manages dependency injection using the GetIt library.

## Contributing

Contributions to the project are welcome! If you encounter any issues or have suggestions for improvements, please submit an issue or pull request. Let's collaborate and make this project even better!

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute the code as per the terms of the license.

## Acknowledgments

We would like to express our gratitude to the open-source community for providing invaluable resources, libraries, and tools that have contributed to the development of this project.

## Contact

For any inquiries or further information, please reach out to kiburezelast@gmail.com
