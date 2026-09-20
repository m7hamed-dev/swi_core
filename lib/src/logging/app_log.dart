import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

/// Structured logging that goes quiet in a release build.
///
/// Both apps used to log through their own extension, and neither checked the
/// build mode — one of them printed every response body, and the request
/// interceptor printed the bearer token on every call. Everything here is
/// wrapped in [kDebugMode], so a release build carries no logging at all.
class AppLog {
  const AppLog._();

  static const _appName = 'swi';
  static const _networkName = 'swi.network';
  static const _errorName = 'swi.error';

  static void info(String message, {String? name}) {
    if (!kDebugMode) return;
    developer.log(message, name: name ?? _appName, level: 700);
  }

  static void network(String message) {
    if (!kDebugMode) return;
    developer.log(message, name: _networkName, level: 700);
  }

  static void warn(String message, {Object? error}) {
    if (!kDebugMode) return;
    developer.log(message, name: _appName, level: 900, error: error);
  }

  static void error(String message, {Object? error, StackTrace? stackTrace}) {
    if (!kDebugMode) return;
    developer.log(message, name: _errorName, level: 1000, error: error, stackTrace: stackTrace);
  }
}

/// `'something'.printStmt()` — kept because both apps are littered with it.
extension PrintStmt on Object? {
  void printStmt() => AppLog.info('$this');
}
