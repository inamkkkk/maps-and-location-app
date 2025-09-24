# Maps and Location App

A simple Flutter app using the `google_maps_flutter` package to display the user's current location and a marker on the map.

## Features

*   Displays a map with the user's current location.
*   Adds a marker to the map.

## Dependencies

*   google_maps_flutter: ^2.5.0
*   geolocator: ^10.1.2
*   provider: ^6.1.1

## Getting Started

1.  Clone the repository.
2.  Run `flutter pub get` to install dependencies.
3.  Obtain a Google Maps API key and add it to your `AndroidManifest.xml` (for Android) and `AppDelegate.swift` (for iOS).
4.  Run the app on a device or emulator.

## API Key Setup:

### Android

1.  Open `android/app/src/main/AndroidManifest.xml`.
2.  Add the following meta-data tag inside the `<application>` tag:


<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_API_KEY"/>


### iOS

1.  Open `ios/Runner/AppDelegate.swift`.
2.  Add the following code inside the `application` method:


import GoogleMaps

GMSServices.provideAPIKey("YOUR_API_KEY")


Replace `YOUR_API_KEY` with your actual Google Maps API key.