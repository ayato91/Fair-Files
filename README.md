# Fair Files
A FIS (File Integrity Surveillance) App for checking the Integrity of a file and make sure if the file content has been modified or not. 
BLAKE-2b Algorithm is used for checking the Integrity of files.

## Screenshots

|           Initial Look            |
|:---------------------------------:|
|  ![App Body](assets/image.png)    |
|             Features              |
|  ![App Body](assets/image2.png)   |
|      Integrity Check Issues       |
|  ![App Body](assets/image3.png)   |

## Features

- **Easy to Use**: Upload a file to get a *unique ID*. Use that ID and File to *check its integrity*.

- **History Feature**: File Name and its associated ID can be shown in *History* tab. 

- **User Friendly UI**: Clean and intuitive User Interface(UI), different status releted messages for better user experience.

## API Resources

Used [GO-FIS-API](https://github.com/justsaumit/go-fis-api) for backend services. 

## Getting Started

To test this FIS (File Integrity Surveillance) App, follow these steps:

1. **Clone the Repository**: Clone this repository to your local machine using Git.
```
    $ git clone https://github.com/ayato91/Fair-Files.git
```

2. **Set Up Your Flutter Environment**: Ensure you have Flutter and Dart installed on your development machine. Follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install) for detailed instructions.

3. **Install Dependencies**: Navigate to the project directory and run the following command to install the app's dependencies:
```
    $ flutter pub get 
```

4. **Run the App**: Launch the app on an emulator or physical device by running the following command:
```
    $ flutter run
```

5. **Start Exploring**: Select files, generate IDs and check their integrity.


## Dependencies

The app relies on several Flutter packages and libraries, including:

- [flutter_bloc](https://pub.dev/packages/flutter_bloc) for state management of the app.
- [file_picker](https://pub.dev/packages/file_picker) for select and pick the file.
- [http](https://pub.dev/packages/http) for fetch and post data to the backend server.


For adding any package:
```
    $ flutter pub add package_name
```

You can find the complete list of dependencies in the `pubspec.yaml` file. Follow the [pub.dev](https://pub.dev) for more dependencies.


Thank You!
