# cemege-playground

This repository serves as a playground for experimenting with various Swift concepts and implementations.

## Overview

`cemege-playground` is a project created to test and showcase different Swift features, patterns, and architectures. It includes implementations for networking, services, and UI components.

## Getting Started

### Prerequisites

- Xcode 16.0 or later
- Swift 6.0 or later

### Installation

Clone the repository to your local machine:

```bash
git clone https://github.com/cemege/playground.git
cd playground
```

Open the project in Xcode:

```bash
open Playground.xcodeproj
```

### Usage

This project includes various Swift packages and implementations:

- **Networking**: Demonstrates network client and error handling.
- **Services**: Includes dummy services for testing purposes.
- **UI Components**: Contains SwiftUI views and components for navigation and testing.
- **Cross Package Routing**: Features a modular routing system that enables navigation between different Swift packages without creating direct dependencies.

### Network Features

The Network Swift package provides a robust, protocol-oriented networking layer for handling API communications:

- **Protocol-Oriented Design**: Built around `ClientProtocol` and `EndpointProtocol` for flexible implementation and testability.
- **Type-Safe API Requests**: Strongly-typed request and response models ensure compile-time safety.
- **Comprehensive Error Handling**: Built-in `NetworkError` system with detailed error types and descriptive messages.
- **SwiftUI Integration**: Environment values for dependency injection of the network client across your application.
- **URL Component Building**: Intelligent URL construction with support for complex query parameters and path components.

Example usage:

```swift
// Create a request
struct ProductsRequest: Request {
    var endpoint: EndpointProtocol {
        ProductsEndpoint()
    }
}

// Use the client to fetch data
@Environment(\.client) var client

func fetchProducts() async {
    let result = await client.fetch(request: ProductsRequest(), ProductsResponse.self)
    switch result {
    case .success(let response):
        // Handle successful response
    case .failure(let error):
        // Handle error
    }
}
```

### Cross Package Routing Features

The recently added cross package navigation system provides:

- **Type-Safe Navigation**: Type-safe navigation within and between Swift packages.
- **Route Registry**: Central registry for routes that can be accessed by string identifiers.
- **RouteProtocol**: Common protocol for all navigation destinations across packages.
- **Decoupled Architecture**: Prevents dependency cycles between feature packages.

Example usage:

```swift
// Register routes during app initialization
await RouteRegistry.shared.register(id: "profile.settings") { _ in ProfileUIRoutes.settings }

// Navigate to a route in another package
if let destination = RouteRegistry.shared.route(forId: "profile.settings", param: "") {
    router.move(to: .profile, destination: destination)
}
```

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes.

1. Fork the repository
2. Create a new branch: `git checkout -b my-feature-branch`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin my-feature-branch`
5. Create a pull request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.