import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/authentication_status.dart';
import '../entities/user_creds_entity.dart';
import '../repositories/user_repository.dart';

class AuthenticateUser
    implements UseCase<AuthenticationStatus, UserCredsEntity> {
  final UserRepository repository;
  AuthenticateUser({
    required this.repository,
  });

  @override
  Future<Either<Failure, AuthenticationStatus>> call(
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
