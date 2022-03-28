import 'package:clear_architecture/core/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';
import 'network_info_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker])
void main() {
  late MockInternetConnectionChecker mockInternetChecker;
  late NetworkInfoImpl networkInfoImpl;

  setUp(() {
    mockInternetChecker = MockInternetConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(mockInternetChecker);
  });

  group('is connected', () {
    test('should call the plugin for connectivity method', () async {
      // arrange
      when(mockInternetChecker.hasConnection).thenAnswer((_) async => true);
      // act
      final result = await networkInfoImpl.isConnected;
      // assert
      verify(mockInternetChecker.hasConnection);
      expect(result, true);
    });
  });
}
