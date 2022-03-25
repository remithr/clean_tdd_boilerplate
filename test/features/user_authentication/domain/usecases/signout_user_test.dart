import 'package:clear_architecture/features/user_authentication/domain/entities/authentication_status.dart';
import 'package:clear_architecture/features/user_authentication/domain/entities/user_creds_entity.dart';
import 'package:clear_architecture/features/user_authentication/domain/entities/user_details_entity.dart';
import 'package:clear_architecture/features/user_authentication/domain/repositories/user_repository.dart';
import 'package:clear_architecture/features/user_authentication/domain/usecases/authenticate_user.dart';
import 'package:clear_architecture/features/user_authentication/domain/usecases/signout_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_user_test.mocks.dart';
// import 'package:mocktail/mocktail.dart';

// class MockAuthenticateUserRepository extends Mock implements UserRepository {}

@GenerateMocks([UserRepository])
void main() {
  late SignOutUser usecase;
  late MockUserRepository mockUserAuthenticationRepository;
  setUp(() {
    mockUserAuthenticationRepository = MockUserRepository();
    usecase = SignOutUser(repository: mockUserAuthenticationRepository);
  });

  const tuserAuthentication = AuthenticationStatus(
    isAuthenticated: false,
  );
  //****** */ MOCKITO implementation
  test('should clear user session and return true', () async {
    // arrange
    when(mockUserAuthenticationRepository.logoutUser()).thenAnswer(
      (_) async => const Right(
        tuserAuthentication,
      ),
    );
    // act
    final result = await usecase(NoParams());
    // assert
    expect(result, const Right(tuserAuthentication));
    verify(mockUserAuthenticationRepository.logoutUser());
    verifyNoMoreInteractions(mockUserAuthenticationRepository);
  });

  //*********/ MOCKTAIL IMPLEMENTATION START
  // group('get user details', () {
  //   test('should be an instance of userdetails repository', () async {
  //     expect(tUserDetailsRepository, isA<UserDetailsEntity>());
  //   });
  //   test('email and password should be string', () {
  //     expect(temail, isA<String>());
  //     expect(tpassword, isA<String>());
  //   });
  //   test('login gets user details on call', () async {
  //     // arrange
  //     when(() => mockUserAuthenticationRepository.loginUser(temail, tpassword))
  //         .thenAnswer((_) async => const Right(tUserDetailsRepository));
  //     // act
  //     final result = await usecase.call(email: temail, password: tpassword);
  //     // assert
  //     expect(result, const Right(tUserDetailsRepository));
  //     verify(() =>
  //             mockUserAuthenticationRepository.loginUser(temail, tpassword))
  //         .called(1);
  //     verifyNoMoreInteractions(mockUserAuthenticationRepository);
  //   });
  // });
  //*********/ MOCKTAIL IMPLEMENTATION END
}
