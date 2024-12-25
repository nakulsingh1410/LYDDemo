# DemoApp
The Product List Demo is a SwiftUI-based application designed to fetch and display a list of products. The application follows clean architecture principles and incorporates testing to ensure reliability. This document provides an in-depth explanation of the components, architecture, and usage.

# Key Features

Fetches product data from a remote or mock data source.

Displays a loading indicator during data fetching.

Handles errors gracefully with user-friendly messages.

Uses SwiftUI for a declarative and accessible user interface.

Implements unit testing for critical components.

# Architecture

The demo employs MVVM (Model-View-ViewModel) architecture with dependency injection. Key components include:

1. View

SwiftUI views for rendering the user interface.

Views are reactive to changes in the ViewModel state.

2. ViewModel

Handles business logic and transforms data for the view.

Manages states like loading, error messages, and product lists.

3. Use Case

Encapsulates application-specific business rules.

Fetches data using the repository and provides it to the ViewModel.

4. Repository

Interfaces with the data layer (e.g., network service or local data).

Abstracts data fetching mechanisms from higher layers.

5. Network Service

Handles network requests and decodes JSON responses.

# Accessibility

The app includes accessibility features for better usability:

Labels and Values: Added for all elements.

Combined Accessibility Elements: Used in list rows for easier navigation.


# How to run the app
This app is developed in Xcode Version 16.2, so please use the atleast xcode 16.2 to run this demo without error
