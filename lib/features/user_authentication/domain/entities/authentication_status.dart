import 'package:equatable/equatable.dart';

class AuthenticationStatus extends Equatable {
  final bool isAuthenticated;
  final String? userID;
  const AuthenticationStatus({
    required this.isAuthenticated,
    this.userID,
  });
  @override
  List<Object?> get props => [isAuthenticated, userID];
}
