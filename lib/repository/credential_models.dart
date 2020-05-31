import 'package:flutter/cupertino.dart';

class GitHubCredentials {
  final String clientId;
  final String clientSecret;
  final String redirectUrl;

  const GitHubCredentials({
    @required this.clientId,
    @required this.clientSecret,
    @required this.redirectUrl,
  }) : assert(clientId != null && clientSecret != null && redirectUrl != null);
}

class TwitterCredentials {}

class AppleCredentials {}
