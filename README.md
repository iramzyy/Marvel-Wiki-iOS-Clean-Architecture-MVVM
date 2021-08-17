#  Marvel-Wiki-iOS-Clean-Architecture-MVVM

iOS Project implemented with Clean Layered Architecture and MVVM.

**You can find more information here:**
 - <a href="https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html3">Clean Architecture</a> 
 - <a href="https://tech.olx.com/clean-architecture-and-mvvm-on-ios-c9d167d9f5b3">Clean Architecture + MVVM</a> 

## Layers
* **Domain Layer** = Entities + Use Cases + Repositories Interfaces
* **Data Repositories Layer** = Repositories Implementations + API (Network) + Persistence DB
* **Presentation Layer (MVVM)** = ViewModels + Views

### Dependency Direction
<img src="/assets/CleanArchitectureDependencies.png" width="800" height="200">


**Note:** **Domain Layer** should not include anything from other layers(e.g Presentation — UIKit or SwiftUI or Data Layer — Mapping Codable)

## Concepts used here
- Clean Architecture
- MVVM
- Data Binding using [Observable] without 3rd party libraries 
- Dependency Injection
- Flow Coordinator
- Data Transfer Object (DTO)


## To do
- [ ] Support Dark Mode
- [ ] Add Details Screen
- [ ] Add Unit tests
- [ ] Add UI tests

