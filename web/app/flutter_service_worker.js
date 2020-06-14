'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "b045290a087b615a40bf7fa070fb4b32",
"/": "b045290a087b615a40bf7fa070fb4b32",
"app/index.html": "b045290a087b615a40bf7fa070fb4b32",
"app/main.dart.js": "8535c76d37a3ea97782872e479b9d1df",
"app/favicon.png": "78c5547d0a43ead659deaf08ee9e5b2a",
"app/icons/Icon.png": "ddb59f3ab8cb39347655b46490184b7f",
"app/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"app/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"app/manifest.json": "54eaf0f3f54e80fbe26fbe502edc51f1",
"app/assets/LICENSE": "c7b899d4c7d4b717ceec7666afe124c6",
"app/assets/AssetManifest.json": "2efbb41d7877d10aac9d091f58ccd7b9",
"app/assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"app/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"app/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"main.dart.js": "8535c76d37a3ea97782872e479b9d1df",
"favicon.png": "78c5547d0a43ead659deaf08ee9e5b2a",
"icons/Icon.png": "ddb59f3ab8cb39347655b46490184b7f",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "54eaf0f3f54e80fbe26fbe502edc51f1",
"assets/LICENSE": "c7b899d4c7d4b717ceec7666afe124c6",
"assets/AssetManifest.json": "2efbb41d7877d10aac9d091f58ccd7b9",
"assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
