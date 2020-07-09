import 'dart:async';

import 'package:eisenhower_matrix/models/settings.dart';
import 'package:eisenhower_matrix/repository/abstract/settings_local_repository.dart';
import 'package:eisenhower_matrix/repository/abstract/settings_web_repository.dart';
import 'package:eisenhower_matrix/utils/connection.dart';
import 'package:flutter/cupertino.dart';

class SettingsRepository {
  final SettingsLocalRepository settingsLocalRepository;
  final SettingsWebRepository settingsWebRepository;
  final Connection connection;
  final _settingsStream = StreamController<Settings>.broadcast();
  var _connected = false;

  SettingsRepository({
    @required this.settingsLocalRepository,
    @required this.settingsWebRepository,
    @required this.connection,
  }) : assert(settingsLocalRepository != null &&
            settingsWebRepository != null &&
            connection != null) {
    connection.connectedToTheInternet.then((value) => _connected = value);
    connection.connectionChanges.listen(_onConnectionChanges);
  }

  void _onConnectionChanges(bool connected) {
    if (!_connected && connected) {
      fetchSettings();
    }
    _connected = connected;
  }

  Stream<Settings> get settingsStream => _settingsStream.stream;

  Future<void> fetchSettings() async {
    var localSettings = await settingsLocalRepository.fetchSettings();
    _settingsStream.sink.add(localSettings);
    if (_connected) {
      try {
        var webSettings = await settingsWebRepository.fetchSettings();
        await _sync(localSettings: localSettings, webSettings: webSettings);
      } catch (e) {
        debugPrint("Can't load web settings. Exception: $e");
      }
    }
  }

  Future<void> saveSettings(Settings settings) async {
    settings = settings.copyWith.call(lastChangeDate: DateTime.now().toUtc());
    await settingsLocalRepository.saveSettings(settings);
    if (_connected) {
      try {
        await settingsWebRepository.saveSettings(settings);
      } catch (e) {
        debugPrint("Can't save settings to web. Exception: $e");
      }
    }
    await settingsLocalRepository.saveSettings(settings);
  }

  Future<void> _sync({@required Settings localSettings, @required Settings webSettings}) async {
    localSettings ??= await settingsLocalRepository.fetchSettings();
    webSettings ??= await settingsWebRepository.fetchSettings();

    if (localSettings.lastChangeDate.isAfter(webSettings.lastChangeDate)) {
      await settingsWebRepository.saveSettings(localSettings);
    } else if (localSettings.lastChangeDate.isBefore(webSettings.lastChangeDate)) {
      await settingsLocalRepository.saveSettings(webSettings);
    }
  }

  Future<void> dispose() async {
    await settingsLocalRepository.dispose();
    await settingsWebRepository.dispose();
  }
}
