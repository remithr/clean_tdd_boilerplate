import 'package:clear_architecture/core/platform/network_info.dart';
import 'package:dartz/dartz.dart';

import 'package:clear_architecture/features/user_authentication/domain/entities/user_details_entity.dart';

import 'package:clear_architecture/features/user_authentication/domain/entities/user_creds_entity.dart';

import 'package:clear_architecture/features/user_authentication/domain/entities/authentication_status.dart';

import 'package:clear_architecture/core/error/failures.dart';

import '../../domain/repositories/user_repository.dart';
import '../datasources/user_local_datasource.dart';
import '../datasources/user_remote_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, UserDetailsEntity>> fetchUserDetails(String userID) {
    // TODO: implement fetchUserDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AuthenticationStatus>> loginUser(
      UserCredsEntity params) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AuthenticationStatus>> logoutUser() {
    // TODO: implement logoutUser
    throw UnimplementedError();
  }
}
