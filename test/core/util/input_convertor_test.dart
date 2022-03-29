import 'package:clear_architecture/core/util/input_convertor.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late InputConvertor inpConvertor;
  setUp(() {
    inpConvertor = InputConvertor();
  });
  group('string to unsigned int', () {
    test('Should return integrated when string is passed from text form field',
        () async {
      // arrange
      const input = '123';
      final result = inpConvertor.stringtoUnsignedInteger(input);
      expect(result, const Right(123));
    });

    test('Should return failure on invalid input type', () async {
      // arrange
      const input = 'abc';
      final result = inpConvertor.stringtoUnsignedInteger(input);
      expect(result, Left(InvalidInputFailure()));
    });
  });
}
