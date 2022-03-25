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

  group('Parsing of JSON to dart object', () {
    test('parsing from json to dart object when ID is integer', () {
      // arrange
      ///fixture usage: load a file for testing
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

  group('toJSON', () {
    test('Should return a Map containing all the required keys', () {
      // act
      final result = umodel.toJson();
      // assert
      final expected = {
        'userID': '123',
        'name': 'Remith',
        'email': 'remithr@yopmail.com'
      };
      expect(result, expected);
    });
  });
}
