import 'package:clear_architecture/core/platform/network_info.dart';
import 'package:clear_architecture/features/user_authentication/data/datasources/user_local_datasource.dart';
import 'package:clear_architecture/features/user_authentication/data/datasources/user_remote_datasource.dart';
import 'package:clear_architecture/features/user_authentication/data/repositories/user_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import '../../domain/usecases/login_user_test.mocks.dart';
import 'user_repository_impl_test.mocks.dart';

@GenerateMocks([UserRemoteDataSource, UserLocalDataSource, NetworkInfo])
void main() {
  UserRepositoryImpl repository;
  MockNetworkInfo mockNetwokInfo;
  MockUserRemoteDataSource mockUserRemoteDataSource;
  MockUserLocalDataSource mockUserLocalDataSource;
  setUp(() {
    mockUserRemoteDataSource = MockUserRemoteDataSource();
    mockUserLocalDataSource = MockUserLocalDataSource();
    mockNetwokInfo = MockNetworkInfo();
    repository = UserRepositoryImpl(
      remoteDataSource: mockUserRemoteDataSource,
      localDataSource: mockUserLocalDataSource,
      networkInfo: mockNetwokInfo,
    );
  });
}
