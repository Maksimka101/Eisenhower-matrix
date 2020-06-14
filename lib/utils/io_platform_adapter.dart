import 'dart:io';

import 'package:flutter/foundation.dart';

bool _isWeb;

bool get isWeb => _isWeb ??= kIsWeb;

bool _isAndroid;

bool get isAndroid => _isAndroid ??= !isWeb && Platform.isAndroid;

bool _isIOS;

bool get isIOS => _isIOS ??= !isWeb && Platform.isIOS;

bool _isMacOS;

bool get isMacOS => _isMacOS ??= !isWeb && Platform.isMacOS;

bool _isWindows;

bool get isWindows => _isWindows ??= !isWeb && Platform.isWindows;

bool _isLinux;

bool get isLinux => _isLinux ??= !isWeb && Platform.isLinux;
