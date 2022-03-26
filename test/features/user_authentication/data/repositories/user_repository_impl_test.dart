import 'package:clear_architecture/core/platform/network_info.dart';
import 'package:clear_architecture/features/user_authentication/data/datasources/user_local_datasource.dart';
import 'package:clear_architecture/features/user_authentication/data/datasources/user_remote_datasource.dart';
import 'package:clear_architecture/features/user_authentication/data/models/user_details_model.dart';
import 'package:clear_architecture/features/user_authentication/data/repositories/user_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../domain/usecases/login_user_test.mocks.dart';
import 'user_repository_impl_test.mocks.dart';

@GenerateMocks([UserRemoteDataSource, UserLocalDataSource, NetworkInfo])
void main() {
  late UserRepositoryImpl repository;
  late MockNetworkInfo mockNetwokInfo;
  late MockUserRemoteDataSource mockUserRemoteDataSource;
  late MockUserLocalDataSource mockUserLocalDataSource;
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
  group('get user details', () {
    const UserDetailsModel umodel = UserDetailsModel(
      userID: '1',
      name: 'Remith',
      email: 'remithr@yopmail.com',
    );
    test(
        'should check for network connectivity and fetch details from remote API',
        () async {
      // arrange
      when(mockNetwokInfo.isConnected).thenAnswer((_) async => true);
      // assert
      repository.fetchUserDetails(umodel.userID);
      // act
      verify(mockNetwokInfo.isConnected);
    });
  });

  group('device is online', () {
    const UserDetailsModel umodel = UserDetailsModel(
      userID: '1',
      name: 'Remith',
      email: 'remithr@yopmail.com',
    );

    setUp(() {
      when(mockNetwokInfo.isConnected).thenAnswer((_) async => true);
    });
    test('should return data from remote api device is connected to network',
        () async {
      // arrange
      when(mockUserRemoteDataSource.fetchUserDetails(umodel.userID))
          .thenAnswer((_) async => umodel);
      // assert
      final result = await repository.fetchUserDetails(umodel.userID);
      // act
      verify(mockUserRemoteDataSource.fetchUserDetails(umodel.userID));
      expect(result, const Right(umodel));
    });
  });

  group('device is offline', () {
    const UserDetailsModel umodel = UserDetailsModel(
      userID: '1',
      name: 'Remith',
      email: 'remithr@yopmail.com',
    );

    setUp(() {
      when(mockNetwokInfo.isConnected).thenAnswer((_) async => false);
    });
    test('should return data from local storage when network not available',
        () async {
      // arrange
      when(mockUserLocalDataSource.getUserDetailsFromCache())
          .thenAnswer((_) async => umodel);
      // assert
      final result = await repository.fetchUserDetails(umodel.userID);
      // act
      verify(mockUserLocalDataSource.getUserDetailsFromCache());
      expect(result, const Right(umodel));
    });
  });
}