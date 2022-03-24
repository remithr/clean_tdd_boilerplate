import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_details_entity.dart';
import '../repositories/user_repository.dart';

class AuthenticateUser {
  final UserRepository repository;
  AuthenticateUser({
    required this.repository,
  });

  Future<Either<Failure, UserDetailsEntity>> call({
    required String email,
    required String password,
  }) async {
    // try {
    return await repository.loginUser(email, password);
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
