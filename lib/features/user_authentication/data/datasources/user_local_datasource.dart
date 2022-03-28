import '../../domain/entities/user_details_entity.dart';
import '../models/user_details_model.dart';

abstract class UserLocalDataSource {
  Future<UserDetailsEntity> getUserDetailsFromCache();
  Future<UserDetailsEntity> saveUserDetailsToCache(UserDetailsModel umodel);
}
