import 'package:clear_architecture/core/usecases/usecases.dart';
import 'package:clear_architecture/features/user_authentication/domain/entities/user_creds_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_details_entity.dart';
import '../repositories/user_repository.dart';

class AuthenticateUser implements UseCase<UserDetailsEntity, UserCredsEntity> {
  final UserRepository repository;
  AuthenticateUser({
    required this.repository,
  });

  @override
  Future<Either<Failure, UserDetailsEntity>> call(
    UserCredsEntity params,
  ) async {
    // try {
    return await repository.loginUser(params);
    // Future.delayed(const Duration(seconds: 5));
    // return const Right(UserDetailsEntity(
    //   email: 'remithr@yopmail.com',
    //   name: 'Remith ',
    //   userID: '1',
    // ));
    // });

    // });
    // } on SocketException {
    //   return const Left(SocketException(exception: 'No Internet Connection'));
    // } on HttpException {
    //   return const Left(HttpException(exception: '404 Not Found'));
    // } on FormatException {
    //   return const Left(FormatException(exception: 'Invalid Response Format'));
    // }
    // return const Left(HttpException(exception: '404 Not Found'));
  }
}
