import 'dart:convert';

import 'package:clear_architecture/features/user_authentication/data/models/user_details_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import '../../../../fixtures/fixture_reader.dart';

@GenerateMocks([UserDetailsModel])
void main() {
  const umodel = UserDetailsModel(
    userID: '123',
    name: 'Remith',
    email: 'remithr@yopmail.com',
  );
  // test('should be an instance of user details model', () {
  //   expect(umodel, isA<UserDetailsModel>());
  // });

  group('Parsing of JSON to dart', () {
    test('parsing from json to dart object when ID is integer', () {
      // arrange
      final Map<String, dynamic> jsonMap = jsonDecode(fixture('user.json'));
      // act
      final result = UserDetailsModel.fromJson(jsonMap);
      // assert
      expect(result, umodel);
    });

    test('parsing from json to dart object when ID is double', () {
      // arrange
      final Map<String, dynamic> jsonMap =
          jsonDecode(fixture('user_string.json'));
      // act
      final result = UserDetailsModel.fromJson(jsonMap);
      // assert
      expect(result, umodel);
    });
  });
}
