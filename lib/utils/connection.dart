import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';

abstract class Connection {
  Stream<bool> get connectionChanges;

  Future<bool> get connectedToTheInternet;
}


class ConnectivityConnection extends Connection {
  final _connectivity = Connectivity();
  static final _instance = ConnectivityConnection._();
  final _connectionStream = StreamController<bool>.broadcast();

  factory ConnectivityConnection() {
    return _instance;
  }

  ConnectivityConnection._() {
    _connectivity.onConnectivityChanged.listen((event) {
      _connectionStream.sink.add(event != ConnectivityResult.none);
    }).onError((err) {
      debugPrint('Error in ConnectivityConnection._ Error: $err');
    });
  }

  @override
  Future<bool> get connectedToTheInternet async {
    return await _connectivity.checkConnectivity() != ConnectivityResult.none;
  }

  @override
  Stream<bool> get connectionChanges => _connectionStream.stream;
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
