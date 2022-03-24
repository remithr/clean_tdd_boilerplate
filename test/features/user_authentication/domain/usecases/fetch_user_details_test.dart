import 'package:clear_architecture/features/user_authentication/domain/entities/user_details_entity.dart';
import 'package:clear_architecture/features/user_authentication/domain/entities/user_id_param.dart';
import 'package:clear_architecture/features/user_authentication/domain/repositories/user_repository.dart';
import 'package:clear_architecture/features/user_authentication/domain/usecases/fetch_user_details.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_user_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  late FetchUserDetails usecase;
  late MockUserRepository mockFetchDetails;

  setUp(() {
    mockFetchDetails = MockUserRepository();
    usecase = FetchUserDetails(repository: mockFetchDetails);
  });
  const tuserID = UserIDParams(userID: '1');
  const tUserDetailsRepository = UserDetailsEntity(
    email: 'remithr@yopmail.com',
    name: 'Remith ',
    userID: '1',
  );

  test('should get user details on passing ID', () async {
    // arrange
    when(mockFetchDetails.fetchUserDetails(tuserID.userID))
        .thenAnswer((_) async => const Right(tUserDetailsRepository));
    // act
    final result = await usecase(tuserID);
    // assert
    expect(result, const Right(tUserDetailsRepository));
    verify(mockFetchDetails.fetchUserDetails(tuserID.userID));
    verifyNoMoreInteractions(mockFetchDetails);
  });
}
