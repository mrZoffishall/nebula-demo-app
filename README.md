# Nebula

  

Find your dream job. Using GitHub Jobs open API and proudly crafted with Flutter.

  
## Description
This is the demo application for Nebula, a Flutter boilerplate using Provider.
The project structure is :

    lib/
        core/
        models/
        providers/
        screens/
        services/
        utils
        widgets/
        main.dart

### Core
Contains the code for 
- your app declaration(for example, for an app named Vanilla would have a file **vanilla.dart** here that will contain the declaration of the MaterialApp/CurpertinoApp/WidgetsApp
- the **routes.dart** where you declare all the application routes
- **networker.dart** where the network service is instantiated

### Models
Contains the dart classes for the json responses of your API

### Providers
Contains a **base_provider.dart** extended by the other app providers. This class is abstract, thus should never be instantiated.
Your app providers will be stored in this folder.

### Screens
All the screens for your app.

### Services
The classes responsible of the API calls or direct interaction with the data sources

### Utils
Where you store your helper classes and functions

### Widgets
Where you store the custom widgets you'll create

## Getting Started

- Clone this repository
- run `flutter packages get` from the command line inside the project folder to install packages
- Run the app from your preferred IDE

  

## Resources

### Packages

- [Provider](https://pub.dev/packages/flutter_vector_icons)
-  [Dartz](https://pub.dev/packages/dartz)
-  [GoogleFonts](https://pub.dev/packages/google_fonts)
-  [Flutter Vector icons](https://pub.dev/packages/flutter_vector_icons)
- [Flutter HTML](https://pub.dev/packages/flutter_html)
- [UrlLauncher](https://pub.dev/packages/url_launcher)
- [Shared Preferences](https://pub.dev/packages/shared_preferences)

### Assets
- Google Seach
- [Manypixels](https://manypixels.co)

### App Screenshots

![Screenshot 2](https://i.postimg.cc/p9ktKHK1/screen2.jpg)  ![Screenshot 1](https://i.postimg.cc/hzjRr5r4/screen1.jpg)
