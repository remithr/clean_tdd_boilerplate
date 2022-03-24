import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_details_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserDetailsEntity>> loginUser(params);
  Future<Either<Failure, UserDetailsEntity>> fetchUserdetails(userID);
  Future<Either<Failure, bool>> logoutUser();
}
