import 'package:clear_architecture/core/network/api_provider.dart';
import 'package:clear_architecture/features/user_authentication/data/datasources/user_remote_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_remote_datasource_test.mocks.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([ApiProvider])
void main() {
  group('Testing login api implementation', () {
    late MockApiProvider mockAPI;
    late UserRemoteDataSourceImpl userRemoteDataSourceImpl;
    setUp(() {
      mockAPI = MockApiProvider();
      userRemoteDataSourceImpl = UserRemoteDataSourceImpl(apiProvider: mockAPI);
    });
    test('should return user details on invoking', () async {
      // arrange
      when(mockAPI.post()).thenAnswer((_) async => );

      // act
      /// eg. final result = await networkInfoImpl.isConnected;

      // assert
      ///eg. verify(mockInternetChecker.hasConnection);
      ///eg. expect(result, true);
    });
  });
}
