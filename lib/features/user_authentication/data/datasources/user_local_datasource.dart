import '../../domain/entities/user_details_entity.dart';
import '../models/user_details_model.dart';

abstract class UserLocalDataSource {
  Future<UserDetailsModel> getUserDetailsFromCache();
  Future<UserDetailsModel> saveUserDetailsToCache(UserDetailsModel umodel);
}
