import 'package:flutter_test/flutter_test.dart';

void main() {
  group('widgets', () {
    test('test', () {
      final str = Stream.fromIterable(['23', '5', 'salom', 'hello']);

      expect(
          str,
          emitsInOrder([
            '23',
            '5',
            emitsAnyOf(['salom', 'hello']),
            // emitsDone
          ]));
    });
  });
}
