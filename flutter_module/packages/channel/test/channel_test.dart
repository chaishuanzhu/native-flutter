import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:channel/channel.dart';

void main() {
  const MethodChannel channel = MethodChannel('channel');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Channel.platformVersion, '42');
  });
}
