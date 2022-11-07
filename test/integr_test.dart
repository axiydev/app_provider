import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_test/flutter_test.dart' hide find;

void main() {
  group('group', () {
    FlutterDriver? driver;
    final SerializableFinder button = find.byValueKey('increment');
    final SerializableFinder text = find.byValueKey('data');
    setUp(() async {
      driver = await FlutterDriver.connect();
    });

    tearDown(() async {
      driver!.close();
    });

    test('incr', () async {
      await driver!.tap(button);
      var readText = await driver!.getText(text);
      expect(readText, "1");
    });
  });
}
