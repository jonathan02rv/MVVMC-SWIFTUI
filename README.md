# MVVMC-SWIFTUI

This project showed 3 modules: UI, Domain, and Data layer for decoupling the code from the user interface, business logic, and the network or local data source.

UI Layer (iOS project):
-----------------------
In this example, I implemented MVVM-C design pattern with SwiftUI for UI Layer. But we can use VIPER, MVP, MVC and so on.
Our Views have a ViewModel for fill it and Cordinator for navigation views
Our ViewModels have a dependency of Use Case Class
We must have only the use case methods that each view will use.

Domain Layer (Framework project):
------------------------------------
There are the business logic and repository protocol will be implemented in Data Layer
We have any methods approach to a specific use cases group.

Data Layer (Framework proyect):
----------------------------------
There is the implementation of Data Source and we can choose where from we want to get our data (web API, local Data, ... )
Web API: We can implement URLSESSION, Alamofire, and so on. (In this example I implemented URLSESSION)
Local Data: We can implement userDefaults, local files, CoreData, Keychain, and so on. (In this example I implemented local file)


This is the Architecture's diagram:

![CleanArchitecture](https://user-images.githubusercontent.com/29233230/132109538-8bea727c-137f-4f23-a2a2-ac9b2af5b094.jpeg)
