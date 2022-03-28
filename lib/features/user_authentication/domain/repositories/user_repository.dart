import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/user_details_model.dart';
import '../entities/authentication_status.dart';
import '../entities/user_creds_entity.dart';
import '../entities/user_details_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, AuthenticationStatus>> loginUser(
      UserCredsEntity params);
  Future<Either<Failure, UserDetailsEntity>> fetchUserDetails(String userID);
  Future<Either<Failure, AuthenticationStatus>> logoutUser();
  Future<Either<Failure, UserDetailsModel>> getUserDetailsFromCache();
  Future<Either<Failure, UserDetailsModel>> saveUserDetailsToCache(
      UserDetailsModel umodel);
}
