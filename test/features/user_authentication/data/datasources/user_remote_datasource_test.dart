import 'package:clear_architecture/core/network/api_provider.dart';
import 'package:clear_architecture/features/user_authentication/data/datasources/user_remote_datasource.dart';
import 'package:clear_architecture/features/user_authentication/data/models/user_details_model.dart';

import 'package:clear_architecture/features/user_authentication/domain/entities/user_creds_entity.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_remote_datasource_test.mocks.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([ApiProvider, http.Client])
void main() {
  group('Testing login api implementation', () {
    late MockApiProvider mockAPI;
    late UserRemoteDataSourceImpl userRemoteDataSourceImpl;
    setUp(() {
      mockAPI = MockApiProvider();
      userRemoteDataSourceImpl = UserRemoteDataSourceImpl(apiProvider: mockAPI);
    });
    final jsonResponse = {
      "code": 1,
      "message": "You have logged in successfully!",
      "data": {
        "user_id": 118,
        "user_name": "atrain",
        "email": "atrain@yopmail.com",
        "first_name": "A",
        "last_name": "Train",
        "role": ["business"],
        "business_type": "business"
      }
    };
    // TODO NOT WORKING
    // test('should return user details on invoking', () async {
    //   // arrange
    //   const UserCredsEntity userCreds =
    //       UserCredsEntity(email: 'alexp@yopmail.com', password: 'Qwerty@123');
    //   when(mockAPI.post(endPoint: 'user/login', params: {
    //     'user_email': userCreds.email,
    //     'user_password': userCreds.password,
    //   })).thenAnswer(
    //     (_) async => http.Response('$jsonResponse', 200),
    //   );

    //   // act
    //   final result = await userRemoteDataSourceImpl.loginUser(userCreds);

    //   // assert
    //   verify(userRemoteDataSourceImpl.loginUser(userCreds));
    //   expect(result, jsonResponse);
    // });
    // TODO NOT WORKING
    // test('should return api response for POST calls', () async {
    //   // arrange
    //   final jsonResponse = {
    //     "code": 1,
    //     "message": "You have logged in successfully!",
    //     "data": {
    //       "user_id": 118,
    //       "user_name": "atrain",
    //       "email": "atrain@yopmail.com",
    //       "first_name": "A",
    //       "last_name": "Train",
    //       "role": ["business"],
    //       "business_type": "business"
    //     }
    //   };
    //   when(mockAPI.post(endPoint: 'user/login', params: {
    //     'user_email': 'atrain@yopmail.com',
    //     'user_password': 'Qwerty@123',
    //   })).thenAnswer(
    //     (_) async => http.Response('$jsonResponse', 200),
    //   );

    //   // act
    //   final result = await mockAPI.post(endPoint: 'user/login', params: {
    //     'user_email': 'atrain@yopmail.com',
    //     'user_password': 'Qwerty@123',
    //   });

    //   // assert
    //   verify(
    //     mockAPI.post(endPoint: 'user/login', params: {
    //       'user_email': 'atrain@yopmail.com',
    //       'user_password': 'Qwerty@123',
    //     }),
    //   );

    //   expect(result, http.Response('$jsonResponse', 200));
    // });
    test('should call api and return success', () async {
      // arrange
      const tumodel = UserDetailsModel(
          userID: '118', name: 'atrain', email: 'atrain@yopmail.com');
      when(await mockAPI.post(endPoint: 'user/login', params: {
        "user_email": 'alexp@yopmail.com',
        'user_password': 'Qwerty@123'
      }))
          .thenAnswer(
        (_) async => http.Response('$jsonResponse', 200),
      );

      final result = await userRemoteDataSourceImpl.loginUser(
        const UserCredsEntity(
            email: 'alexp@yopmail.com', password: 'Qwerty@123'),
      );

      // act
      /// eg. final result = await networkInfoImpl.isConnected;

      // assert
      // verify();
      expect(result, tumodel);
    });
  });
}
