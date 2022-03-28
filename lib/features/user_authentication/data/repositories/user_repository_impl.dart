import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entities/authentication_status.dart';
import '../../domain/entities/user_creds_entity.dart';
import '../../domain/entities/user_details_entity.dart';
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
  Future<Either<Failure, UserDetailsEntity>> fetchUserDetails(
      String userID) async {
    // throw UnimplementedError();
    networkInfo.isConnected;
    try {
      final udetails = await remoteDataSource.fetchUserDetails(userID);
      localDataSource.saveUserDetailsToCache(udetails);
      return Right(udetails);
    } on ServerException {
      return Left(ServerFailure());
    }
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
