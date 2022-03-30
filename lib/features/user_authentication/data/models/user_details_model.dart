import '../../domain/entities/user_details_entity.dart';

class UserDetailsModel extends UserDetailsEntity {
  const UserDetailsModel({
    required String userID,
    required String name,
    required String email,
  }) : super(userID: userID, name: name, email: email);

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    return UserDetailsModel(
      userID: (json['user_id'] as num).toInt().toString(),
      name: json['user_name'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userID,
      'user_name': name,
      'email': email,
    };
  }
}
