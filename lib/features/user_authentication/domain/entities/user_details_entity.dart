import 'package:equatable/equatable.dart';

class UserDetailsEntity extends Equatable {
  final String userID;
  final String? name;
  final String? email;
  const UserDetailsEntity({
    required this.userID,
    this.name,
    this.email,
  });

  @override
  List<Object?> get props => [userID, name, email];
}
