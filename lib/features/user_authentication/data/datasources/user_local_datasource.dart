import 'dart:convert';

import 'package:clear_architecture/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_details_model.dart';

abstract class UserLocalDataSource {
  Future<UserDetailsModel> getUserDetailsFromCache();
  Future<void> saveUserDetailsToCache(UserDetailsModel umodel);
}

const STORAGE_USER_DETAILS = 'STORAGE_USER_DETAILS';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPref;

  UserLocalDataSourceImpl({
    required this.sharedPref,
  });

  @override
  Future<UserDetailsModel> getUserDetailsFromCache() {
    // TODO: implement getUserDetailsFromCache
    // throw UnimplementedError();
    final jsonString = sharedPref.getString(STORAGE_USER_DETAILS);
    if (jsonString != null) {
      return Future.value(UserDetailsModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> saveUserDetailsToCache(UserDetailsModel umodel) {
    return sharedPref.setString(
      STORAGE_USER_DETAILS,
      jsonEncode(umodel.toJson()),
    );
  }
}
