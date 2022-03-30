import 'dart:convert';

import 'package:clear_architecture/core/network/api_provider.dart';
import 'package:clear_architecture/features/user_authentication/domain/entities/authentication_status.dart';

import '../../domain/entities/user_creds_entity.dart';
import '../models/user_details_model.dart';

abstract class UserRemoteDataSource {
  Future<UserDetailsModel> loginUser(UserCredsEntity params);
  Future<UserDetailsModel> fetchUserDetails(String userID);
  Future<AuthenticationStatus> logoutUser();
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  ApiProvider apiProvider;
  UserRemoteDataSourceImpl({
    required this.apiProvider,
  });

  @override
  Future<UserDetailsModel> fetchUserDetails(String userID) {
    // TODO: implement fetchUserDetails
    throw UnimplementedError();
  }

  @override
  Future<UserDetailsModel> loginUser(UserCredsEntity params) async {
    print(params.email);
    print(params.password);
    try {
      var resp = await apiProvider.post(endPoint: 'user/login', params: {
        'user_email': params.email,
        'user_password': params.password,
      });
      print('RESPONSE ====> ${resp.body}');
      print(jsonDecode(resp.body)['data']);
      return UserDetailsModel.fromJson(jsonDecode(resp.body)['data']);
    } on FormatException catch (e) {
      throw FormatException('Invalid format $e');
    }

    // return resp;
    // resp.fold((error) {
    //   print(error);
    // }, (success) {
    //   print(success);
    // });
    // if(response.)
  }

  @override
  Future<AuthenticationStatus> logoutUser() {
    // TODO: implement logoutUser
    throw UnimplementedError();
  }
}
