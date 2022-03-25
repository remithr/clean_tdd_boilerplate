import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/authentication_status.dart';
import '../repositories/user_repository.dart';

class SignOutUser implements UseCase<AuthenticationStatus, NoParams> {
  final UserRepository repository;
  SignOutUser({
    required this.repository,
  });
  @override
  Future<Either<Failure, AuthenticationStatus>> call(NoParams params) async {
    return await repository.logoutUser();
  }
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
