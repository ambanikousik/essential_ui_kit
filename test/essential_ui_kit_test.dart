import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:essential_ui_kit/essential_ui_kit.dart';

void main() {
  const MethodChannel channel = MethodChannel('essential_ui_kit');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await EssentialUiKit.platformVersion, '42');
  });
}
