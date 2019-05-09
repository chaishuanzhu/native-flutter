import 'dart:async';

import 'package:flutter/services.dart';

class Channel {
  static const MethodChannel _channel =
      const MethodChannel('channel');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get userID async {
    final String userID = await _channel.invokeMethod("getUserID");
    return userID;
  }

  static Future<Map> sendData(String val1, String val2) async {
    final Map result = await _channel.invokeMethod("sendData", {"key1":val1, "key2":val2});
    return result;
  }

  static Future<Map> showDialog(String val1, String val2) async {
    final Map result = await _channel.invokeMethod("showDialog", {"key1":val1, "key2":val2});
    return result;
  }
}
