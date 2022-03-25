import 'package:clear_architecture/features/user_authentication/domain/entities/authentication_status.dart';

import '../models/user_details_model.dart';

import '../../domain/entities/user_creds_entity.dart';

abstract class UserRemoteDataSource {
  Future<UserDetailsModel> loginUser(UserCredsEntity params);
  Future<UserDetailsModel> fetchUserDetails(String userID);
  Future<AuthenticationStatus> logoutUser();
}
