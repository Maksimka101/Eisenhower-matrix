# The Eisenhower matrix

The Eisenhower matrix app for all platforms: android, ios, mac os and web with cloud synchronization! 

Try it right now with the [web version](https://maksimka101.github.io/Eisenhower-matrix-web/). 
You need to disable tracking protection to be able to sign in with google. 

# Screenshots
### IOS
![Matrix ceil screen on iOS](https://i.ibb.co/c635dDV/IMAGE-2020-06-14-16-43-47.jpg)

![Matrix screen in dark mode on iOS](https://i.ibb.co/7yPRFrS/IMAGE-2020-06-15-17-28-42.jpg)

### Web
![Matrix main screen on web](https://i.ibb.co/ZB2nV5q/2020-06-14-16-34-24.png)

![Matrix ceil screen on web](https://i.ibb.co/QJTc7XM/2020-06-14-16-34-37.png)

![Web mobile version](https://i.ibb.co/1QTmW8P/2020-06-14-16-35-51.png)


# Installation
You can just install apps from these links: [Android](https://yadi.sk/d/c4RXyhb36WlLzQ).


# How to build
To build app you need to:
 - Install flutter.
 - Create firebase project.
 - Enable Google and Anonymous authentication.
 - Enable firestore and setup rules. For now, I allow read and write to every authorized users.
 - Follow integration guid for [google_sign_in](https://pub.dev/packages/google_sign_in) 
    and [google_sign_in_web](https://pub.dev/packages/google_sign_in_web) plugins
 - For google sign in a web add your host to the OAuth 2.0 web client identifier 
   [here](https://console.cloud.google.com/apis/credentials?).
 - Setup your credentials for authentication by following instructions in lib/main. 
 
 Don't forget to enable flutter desktop support using [this guide](https://flutter.dev/desktop) to be able to build desktop apps.
 
# Road map
- [x] MVP

- Run on:
  - [x] Web
  - [ ] Mac os

- Design
  - [X] UI
  - [X] UX
  - [ ] Animations
  - [X] Dark and light mode
  - [X] Desktop UI

- The alternative backend to launch app on linux and windows
