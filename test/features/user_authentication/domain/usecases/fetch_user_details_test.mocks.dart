// Mocks generated by Mockito 5.1.0 from annotations
// in clear_architecture/test/features/user_authentication/domain/usecases/fetch_user_details_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:clear_architecture/core/error/failures.dart' as _i5;
import 'package:clear_architecture/features/user_authentication/data/models/user_details_model.dart'
    as _i9;
import 'package:clear_architecture/features/user_authentication/domain/entities/authentication_status.dart'
    as _i6;
import 'package:clear_architecture/features/user_authentication/domain/entities/user_creds_entity.dart'
    as _i7;
import 'package:clear_architecture/features/user_authentication/domain/entities/user_details_entity.dart'
    as _i8;
import 'package:clear_architecture/features/user_authentication/domain/repositories/user_repository.dart'
    as _i3;
import 'package:dartz/dartz.dart' as _i2;
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

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [UserRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRepository extends _i1.Mock implements _i3.UserRepository {
  MockUserRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.AuthenticationStatus>> loginUser(
          _i7.UserCredsEntity? params) =>
      (super.noSuchMethod(Invocation.method(#loginUser, [params]),
              returnValue: Future<
                      _i2.Either<_i5.Failure, _i6.AuthenticationStatus>>.value(
                  _FakeEither_0<_i5.Failure, _i6.AuthenticationStatus>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.AuthenticationStatus>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i8.UserDetailsEntity>> fetchUserDetails(
          String? userID) =>
      (super.noSuchMethod(Invocation.method(#fetchUserDetails, [userID]),
              returnValue:
                  Future<_i2.Either<_i5.Failure, _i8.UserDetailsEntity>>.value(
                      _FakeEither_0<_i5.Failure, _i8.UserDetailsEntity>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i8.UserDetailsEntity>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.AuthenticationStatus>> logoutUser() =>
      (super.noSuchMethod(Invocation.method(#logoutUser, []),
              returnValue: Future<
                      _i2.Either<_i5.Failure, _i6.AuthenticationStatus>>.value(
                  _FakeEither_0<_i5.Failure, _i6.AuthenticationStatus>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.AuthenticationStatus>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i9.UserDetailsModel>>
      getUserDetailsFromCache() => (super.noSuchMethod(
              Invocation.method(#getUserDetailsFromCache, []),
              returnValue:
                  Future<_i2.Either<_i5.Failure, _i9.UserDetailsModel>>.value(
                      _FakeEither_0<_i5.Failure, _i9.UserDetailsModel>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i9.UserDetailsModel>>);
  @override
  _i4.Future<
      _i2.Either<_i5.Failure, _i9.UserDetailsModel>> saveUserDetailsToCache(
          _i9.UserDetailsModel? umodel) =>
      (super.noSuchMethod(Invocation.method(#saveUserDetailsToCache, [umodel]),
              returnValue:
                  Future<_i2.Either<_i5.Failure, _i9.UserDetailsModel>>.value(
                      _FakeEither_0<_i5.Failure, _i9.UserDetailsModel>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i9.UserDetailsModel>>);
}
