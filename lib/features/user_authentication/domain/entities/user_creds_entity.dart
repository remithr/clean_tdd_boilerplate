import 'package:equatable/equatable.dart';

class UserCredsEntity extends Equatable {
  final String email;
  final String password;
  const UserCredsEntity({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
