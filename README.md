# MVVMC-SWIFTUI

This project showed 3 modules: UI, Domain, and Data layer for decoupling the code from the user interface, business logic, and the network or local data source.

UI Layer (iOS project):
-----------------------
In this example, I implemented MVVM-C design pattern with SwiftUI for UI Layer. But we can use VIPER, MVP, MVC ...

Domain Layer (Framework project):
------------------------------------
There are the business logic and repository protocol will be implemented in Data Layer

Data Layer (Framework proyect):
----------------------------------
There is the implementation of Data Source and we can choose where from we want to get our data (Remote API, local Data, ... )


This is the Architecture's diagram:

![CleanArchitecture](https://user-images.githubusercontent.com/29233230/132109538-8bea727c-137f-4f23-a2a2-ac9b2af5b094.jpeg)
