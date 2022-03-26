// Mocks generated by Mockito 5.1.0 from annotations
// in clear_architecture/test/features/user_authentication/data/repositories/user_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:clear_architecture/core/platform/network_info.dart' as _i9;
import 'package:clear_architecture/features/user_authentication/data/datasources/user_local_datasource.dart'
    as _i8;
import 'package:clear_architecture/features/user_authentication/data/datasources/user_remote_datasource.dart'
    as _i5;
import 'package:clear_architecture/features/user_authentication/data/models/user_details_model.dart'
    as _i2;
import 'package:clear_architecture/features/user_authentication/domain/entities/authentication_status.dart'
    as _i3;
import 'package:clear_architecture/features/user_authentication/domain/entities/user_creds_entity.dart'
    as _i7;
import 'package:clear_architecture/features/user_authentication/domain/entities/user_details_entity.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeUserDetailsModel_0 extends _i1.Fake implements _i2.UserDetailsModel {
}

class _FakeAuthenticationStatus_1 extends _i1.Fake
    implements _i3.AuthenticationStatus {}

class _FakeUserDetailsEntity_2 extends _i1.Fake
    implements _i4.UserDetailsEntity {}

/// A class which mocks [UserRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRemoteDataSource extends _i1.Mock
    implements _i5.UserRemoteDataSource {
  MockUserRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.UserDetailsModel> loginUser(_i7.UserCredsEntity? params) =>
      (super.noSuchMethod(Invocation.method(#loginUser, [params]),
              returnValue:
                  Future<_i2.UserDetailsModel>.value(_FakeUserDetailsModel_0()))
          as _i6.Future<_i2.UserDetailsModel>);
  @override
  _i6.Future<_i2.UserDetailsModel> fetchUserDetails(String? userID) =>
      (super.noSuchMethod(Invocation.method(#fetchUserDetails, [userID]),
              returnValue:
                  Future<_i2.UserDetailsModel>.value(_FakeUserDetailsModel_0()))
          as _i6.Future<_i2.UserDetailsModel>);
  @override
  _i6.Future<_i3.AuthenticationStatus> logoutUser() =>
      (super.noSuchMethod(Invocation.method(#logoutUser, []),
              returnValue: Future<_i3.AuthenticationStatus>.value(
                  _FakeAuthenticationStatus_1()))
          as _i6.Future<_i3.AuthenticationStatus>);
}

/// A class which mocks [UserLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserLocalDataSource extends _i1.Mock
    implements _i8.UserLocalDataSource {
  MockUserLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.UserDetailsEntity> getUserDetailsFromCache() =>
      (super.noSuchMethod(Invocation.method(#getUserDetailsFromCache, []),
              returnValue: Future<_i4.UserDetailsEntity>.value(
                  _FakeUserDetailsEntity_2()))
          as _i6.Future<_i4.UserDetailsEntity>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i9.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<bool> get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
}