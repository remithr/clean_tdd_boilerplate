import 'package:equatable/equatable.dart';

class UserIDParams extends Equatable {
  final String userID;
  const UserIDParams({
    required this.userID,
  });

  @override
  List<Object?> get props => [userID];
}
