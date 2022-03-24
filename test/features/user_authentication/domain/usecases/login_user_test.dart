import 'package:clear_architecture/features/user_authentication/domain/entities/user_details_entity.dart';
import 'package:clear_architecture/features/user_authentication/domain/repositories/user_repository.dart';
import 'package:clear_architecture/features/user_authentication/domain/usecases/authenticate_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
// import 'package:mockito/annotations.dart';

class MockAuthenticateUserRepository extends Mock implements UserRepository {}

// @GenerateMocks([MockAuthenticateUserRepository])
void main() {
  late AuthenticateUser usecase;
  late MockAuthenticateUserRepository mockUserAuthenticationRepository;
  setUp(() {
    mockUserAuthenticationRepository = MockAuthenticateUserRepository();
    usecase = AuthenticateUser(repository: mockUserAuthenticationRepository);
  });

  const temail = 'rem@yopmail.com';
  const tpassword = '123456';
  const tUserDetailsRepository = UserDetailsEntity(
    email: 'remithr@yopmail.com',
    name: 'Remith ',
    userID: '1',
  );

  // test('should get user details on login success', () async {
  //   // arrange
  //   // when(mockUserAuthenticationRepository.loginUser(temail, tpassword))
  //   //     .thenAnswer((_) async => const Right(tUserDetailsRepository));
  //   // // act
  //   // final result = await usecase(email: temail, password: tpassword);
  //   // // print(result);
  //   // // assert
  //   // expect(result, const Right(tUserDetailsRepository));
  //   // verify(mockUserAuthenticationRepository.loginUser(temail, tpassword));
  //   // verifyNoMoreInteractions(mockUserAuthenticationRepository);

  //   // when(() => mockUserAuthenticationRepository.loginUser(temail, tpassword))
  //   //     .thenAnswer((_) async {
  //   //   await Future.delayed(const Duration(seconds: 5));
  //   //   return const Right(tUserDetailsRepository);
  //   // });
  //   // // final result = await usecase(email: temail, password: tpassword);
  //   // expect(mockUserAuthenticationRepository.loginUser(temail, tpassword),
  //   //     const Right(tUserDetailsRepository));
  //   // verify(() => mockUserAuthenticationRepository.loginUser(temail, tpassword))
  //   //     .called(1);
  //   // verifyNoMoreInteractions(mockUserAuthenticationRepository);
  // });

  group('get user details', () {
    test('should be an instance of userdetails repository', () async {
      expect(tUserDetailsRepository, isA<UserDetailsEntity>());
    });
    test('email and password should be string', () {
      expect(temail, isA<String>());
      expect(tpassword, isA<String>());
    });
    test('login gets user details on call', () async {
      // arrange
      when(() => mockUserAuthenticationRepository.loginUser(temail, tpassword))
          .thenAnswer((_) async => const Right(tUserDetailsRepository));
      // act
      final result = await usecase.call(email: temail, password: tpassword);
      // assert
      expect(result, const Right(tUserDetailsRepository));
      verify(() =>
              mockUserAuthenticationRepository.loginUser(temail, tpassword))
          .called(1);
      verifyNoMoreInteractions(mockUserAuthenticationRepository);
    });
  });
}
