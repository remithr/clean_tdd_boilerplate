import 'package:clear_architecture/features/user_authentication/domain/entities/user_details_entity.dart';

abstract class UserLocalDataSource {
  Future<UserDetailsEntity> getUserDetailsFromCache();
}
