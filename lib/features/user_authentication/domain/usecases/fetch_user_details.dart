import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/user_details_entity.dart';
import '../entities/user_id_param.dart';
import '../repositories/user_repository.dart';

class FetchUserDetails implements UseCase<UserDetailsEntity, UserIDParams> {
  final UserRepository repository;
  FetchUserDetails({
    required this.repository,
  });
  @override
  Future<Either<Failure, UserDetailsEntity>> call(UserIDParams params) async {
    return await repository.fetchUserDetails(params.userID);
  }
}
