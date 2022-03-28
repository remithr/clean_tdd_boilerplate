import 'dart:convert';

import 'package:clear_architecture/core/error/exceptions.dart';
import 'package:clear_architecture/features/user_authentication/data/datasources/user_local_datasource.dart';
import 'package:clear_architecture/features/user_authentication/data/models/user_details_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'user_local_datasource_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late MockSharedPreferences mockSharedPreferences;
  late UserLocalDataSourceImpl userLocalDataSource;
  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    userLocalDataSource =
        UserLocalDataSourceImpl(sharedPref: mockSharedPreferences);
  });
  group('fetch data from local storage', () {
    final tUserModel =
        UserDetailsModel.fromJson(jsonDecode(fixture('user.json')));
    test('should returns user details from local storage', () async {
      // arrange
      /// eg. when(mockInternetChecker.hasConnection).thenAnswer((_) async => true);
      when(mockSharedPreferences.getString(any))
          .thenReturn(fixture('user.json'));
      // act
      final result = await userLocalDataSource.getUserDetailsFromCache();

      // assert
      verify(mockSharedPreferences.getString(STORAGE_USER_DETAILS));

      expect(result, equals(tUserModel));
    });

    test('should throw a Cache exception if no storage available', () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(null);

      // act
      final result = userLocalDataSource.getUserDetailsFromCache;

      // assert
      ///eg. verify(mockInternetChecker.hasConnection);
      expect(() => result(), throwsA(const TypeMatcher<CacheException>()));
    });
  });
}
