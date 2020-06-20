import 'package:connectivity/connectivity.dart';

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
  Future<bool> get connectedToTheInternet async =>
      await _connectivity.checkConnectivity() != ConnectivityResult.none;

  @override
  Stream<bool> get connectionChanges =>
      _connectivity.onConnectivityChanged.map((event) => event != ConnectivityResult.none);
}
