import 'package:clear_architecture/features/user_authentication/domain/entities/user_creds_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_details_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserDetailsEntity>> loginUser(UserCredsEntity params);
  Future<Either<Failure, UserDetailsEntity>> fetchUserDetails(String userID);
  Future<Either<Failure, bool>> logoutUser();
}
