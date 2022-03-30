// Mocks generated by Mockito 5.1.0 from annotations
// in clear_architecture/test/features/user_authentication/data/datasources/user_remote_datasource_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:clear_architecture/core/network/api_provider.dart' as _i2;
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

/// A class which mocks [ApiProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiProvider extends _i1.Mock implements _i2.ApiProvider {
  MockApiProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<dynamic> get({String? endPoint}) =>
      (super.noSuchMethod(Invocation.method(#get, [], {#endPoint: endPoint}),
          returnValue: Future<dynamic>.value()) as _i3.Future<dynamic>);
  @override
  _i3.Future<dynamic> post({String? endPoint, Map<String, dynamic>? params}) =>
      (super.noSuchMethod(
          Invocation.method(#post, [], {#endPoint: endPoint, #params: params}),
          returnValue: Future<dynamic>.value()) as _i3.Future<dynamic>);
}