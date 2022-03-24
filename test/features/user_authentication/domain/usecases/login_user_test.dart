import 'package:clear_architecture/features/user_authentication/domain/entities/authentication_status.dart';
import 'package:clear_architecture/features/user_authentication/domain/entities/user_creds_entity.dart';
import 'package:clear_architecture/features/user_authentication/domain/entities/user_details_entity.dart';
import 'package:clear_architecture/features/user_authentication/domain/repositories/user_repository.dart';
import 'package:clear_architecture/features/user_authentication/domain/usecases/authenticate_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_user_test.mocks.dart';
// import 'package:mocktail/mocktail.dart';

// class MockAuthenticateUserRepository extends Mock implements UserRepository {}

@GenerateMocks([UserRepository])
void main() {
  late AuthenticateUser usecase;
  late MockUserRepository mockUserAuthenticationRepository;
  setUp(() {
    mockUserAuthenticationRepository = MockUserRepository();
    usecase = AuthenticateUser(repository: mockUserAuthenticationRepository);
  });

  const userCreds =
      UserCredsEntity(email: 'rem@yopmail.com', password: '123456');
  const tuserAuthentication = AuthenticationStatus(
    isAuthenticated: true,
    userID: '1',
  );
  //****** */ MOCKITO implementation
  test('should return authentication status with userID on success', () async {
    // arrange
    when(mockUserAuthenticationRepository.loginUser(userCreds))
        .thenAnswer((_) async => const Right(tuserAuthentication));
    // act
    final result = await usecase(userCreds);
    // assert
    expect(result, const Right(tuserAuthentication));
    verify(mockUserAuthenticationRepository.loginUser(userCreds));
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
