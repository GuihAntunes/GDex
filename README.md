# GDex
# Requirements
- Xcode 12
- Swift 5
- Cocoapods
- iOS 12.0+

# Before running the project
Before running the project, please run 'pod install' inside the folder where Podfile is located via the terminal and open the .xcworkspace file after installing the dependencies.

# Application's Patterns
- **Model:** Represents the data that fills the application
- **View:** UI layer
- **ViewModel:** Presentation rules and views data provider
- **Service:** Layer that gets data from API
- **Repository:** Layer that decides where to get the data (Locally or from API, if needed)
- **Coordinator:** Layer the holds presentation streams
- **Injector:** Layer that injects the dependencies of each controller / view model

# Layers Scheme (How layers communicate)

AppDelegate -> Coordinator (Injector) <-> ViewModel (Repository/Service) <-> View

# Dependencies
- **MapleBacon:** Swift library for downloading images and image request thread handling
