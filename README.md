# Getting started with flutter development

This is a step by step guid to get started with application development with Flutter.


## Install Flutter on Windows

- Download the [Flutter SDK](https://flutter-ko.dev/get-started/install/windows "Flutter SDK") as zip file
- Extract to a specific folder `C:\Flutter_SDK`
- Update Path in Environment variables `C:\Flutter_SDK\flutter\bin`
- Run `flutter doctor` in a command prompt


## Install Visual Studio Code

- Download and install [Visual Studio Code](https://code.visualstudio.com/download "Visual Studio Code")
- Install `Flutter` extension on Visual Studio Code


## Run flutter application

- Clone this repository
- Open cloned folder in Visual Studio Code
- Open `lib\main.dart`
- Find the debug icon on top right corner and select the target platform you need to run the applicaton

## WeatherApi as backend service

Weather forecast in the application uses the services from [WeatherAPI.com](https://www.weatherapi.com).

To get your free / trail license (api-key) to use the services
- Singnup yourself at [Weather Api - Sign up](https://www.weatherapi.com/signup.aspx "Weather Api - Sign up")
- Verify your email by following the link sent to your registed email address
- Login to your account [Weather Api - Login](https://www.weatherapi.com/login.aspx "Weather Api - Login")
- Find your Api-Key in dashboard
- Try out thier apis in [Weather Api - Swagger](https://app.swaggerhub.com/apis-docs/WeatherAPI.com/WeatherAPI/1.0.2 "Weather Api - Swagger")

Using api-key in our application
- Navigate to `lib\weather_app\services\weather_services.dart`
- Assign your api-key to the field `_apiKey` at line number 8