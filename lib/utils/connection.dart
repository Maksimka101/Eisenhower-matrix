import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:eisenhower_matrix/utils/io_platform_adapter.dart';
import 'package:flutter/cupertino.dart';

abstract class Connection {
  Stream<bool> get connectionChanges;

  Future<bool> get connectedToTheInternet;
}

class ConnectivityConnection extends Connection {
  final _connectivity = Connectivity();
  static final _instance = ConnectivityConnection._();

  factory ConnectivityConnection() {
    return _instance;
  }

  ConnectivityConnection._();

  @override
  Future<bool> get connectedToTheInternet async {
    // todo
    // [Connectivity] doesn't work in web...
    if (isWeb) {
      return true;
    }

    return await _connectivity.checkConnectivity() != ConnectivityResult.none;
  }

  @override
  Stream<bool> get connectionChanges =>
      _connectivity.onConnectivityChanged.map((event) => event != ConnectivityResult.none);
}

class MockConnectivityConnection extends Connection {
  bool connected;
  final StreamController<bool> connectionStream;

  MockConnectivityConnection({@required this.connected, @required this.connectionStream});

  @override
  Future<bool> get connectedToTheInternet async => connected;

  @override
  Stream<bool> get connectionChanges => connectionStream.stream.map((event) => connected = event);
}
