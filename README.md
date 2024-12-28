# LYDDemo
The Product List Demo is an app built using SwiftUI that shows a list of products. It is developed using simple and organized code practices to make it easy to manage. The app also includes tests to make sure everything works as expected. The app is developed in Xcode 16.2, so please run it in the same or a newer version of Xcode to see the output.

# Key Features

**-** Fetches product data from a remote (https://fakestoreapiserver.reactbd.com/products).

**-** Displays a loading indicator when fetching data.

**-** Handles errors and showing error message.

**-** It uses SwiftUI to create a user interface that is easy to understand.

**-** It includes tests for important parts of the app to make sure they work correctly.

# Architecture

The demo follows clean architecture principles using the MVVM (Model-View-ViewModel) pattern with dependency injection. Key components include:

**1. View**

Uses SwiftUI views to create the app's user interface.

The views automatically update when the ViewModel's data changes.

**2. ViewModel**

It processes the data and prepares it for display in the view.

Manages states like loading, error messages, and product lists.

**3. Use Case**
It contains the specific rules (business rules) and logic that are unique to how the app works.

It gets the data from the repository and passes it to the ViewModel.

**4. Repository**

It interacts with the data layer, like the network service or local data storage.

It hides the details of how data is fetched from the parts of the app that use it.

**5. Network Service**

It manages the process of making network requests and converting the received JSON data into usable objects.

# Accessibility

The app includes accessibility features that make it easier to use for people with disabilities

Labels and values are added to all elements to make them easier to identify and understand.

Combined accessibility elements are used in list rows to make navigation simpler.


# How to run the app
This app is developed in **Xcode 16.2**, so please **use the atleast xcode 16.2** to run this demo without error

**- Project output**


<img width="329" alt="Screenshot 2024-12-25 at 9 34 31 PM" src="https://github.com/user-attachments/assets/de39275d-a390-4785-b0ff-08154f6e5295" />


<img width="322" alt="Screenshot 2024-12-26 at 8 55 17 PM" src="https://github.com/user-attachments/assets/5be6c909-d7a3-4818-9ca1-4b72ad85a69e" />




**- Project Structure**


<img width="216" alt="Screenshot 2024-12-26 at 8 52 54 PM" src="https://github.com/user-attachments/assets/7e5e8825-5e67-4ad1-a7f7-f59c95dee77e" />

