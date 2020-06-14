# The Eisenhower matrix

The Eisenhower matrix app for all platforms: android, ios, mac os and web with cloud synchronization! 

Try it right now with the [web version](https://maksimka101.github.io/Eisenhower-matrix/web/app/).

# Screenshots
### IOS
![Matrix ceil screen on iOS](https://2.downloader.disk.yandex.ru/preview/c65bee58d547940b12b5d74e8103f35c3ed31d1d5e11cad3448b182a329f8ef6/inf/NGoGjvpZcMmp_QnCmMJth-VQcv0dOEBFj-ZMLYU_pv3lN11uFEQuRH3IOmKlEohE7NQa-BSu0Yfh6BRLD6v48A%3D%3D?uid=657489280&filename=IMAGE%202020-06-14%2016%3A43%3A47.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=657489280&tknv=v2&size=1920x1006)

### Web
![Matrix main screen on web](https://4.downloader.disk.yandex.ru/preview/5423773f510c24b094456154d18c92f3c5d2c93986f4f5d728d2f9b00f2e8d5f/inf/tVgfyHsZpAY7jP3lj6GlTouJYi3fBBTgta4jxSkGbDtCLloGet-nSHFKefkCc6EKhnnPzzvDneWOTtzFFyq5fw%3D%3D?uid=657489280&filename=%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202020-06-14%20%D0%B2%2016.34.24.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=657489280&tknv=v2&size=1920x1006)

![Matrix ceil screen on web](https://3.downloader.disk.yandex.ru/preview/d307a3038c60b789a7dc1873e943bf7a639ce57a80a8d5fee11e6d989e020637/inf/a1TsQjAzALwS0v3iWXCRXYuJYi3fBBTgta4jxSkGbDsmncZscE6JxV6zvoSYFJ8vKIspnZkXSOGUuK3gaIEmJg%3D%3D?uid=657489280&filename=%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202020-06-14%20%D0%B2%2016.34.37.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=657489280&tknv=v2&size=1920x1006)

![Web mobile version](https://2.downloader.disk.yandex.ru/preview/15da7829f16be5afb76475da5866fdb76576ad99404f3635ec035482811083be/inf/ed2lhpl6jfwOU11yZaHWlYuJYi3fBBTgta4jxSkGbDtDyrvTj4hCirM7AGMxeNddliWwnb0AXyCL_s5n3pfU7w%3D%3D?uid=657489280&filename=%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202020-06-14%20%D0%B2%2016.35.51.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=657489280&tknv=v2&size=1920x1006)


# Installation
You can just install apps from these links: [Android](https://yadi.sk/d/c4RXyhb36WlLzQ), [iOS](ios url).


# How to build
To build app you need to:
 - Install flutter.
 - Create firebase project.
 - Enable Google and Anonymous authentication.
 - Enable firestore and setup rules. For now, I allow read and write to every one.
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
