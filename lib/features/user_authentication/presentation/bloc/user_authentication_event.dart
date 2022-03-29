part of 'user_authentication_bloc.dart';

abstract class UserAuthenticationEvent extends Equatable {
  const UserAuthenticationEvent();

  @override
  List<Object> get props => [];
}

class UserLogIn extends UserAuthenticationEvent {
  final String email;
  final String password;

  const UserLogIn({
    required this.email,
    required this.password,
  });
}

class UserLogOut extends UserAuthenticationEvent {}

class FetchUserDetails extends UserAuthenticationEvent {
  final String userID;
  const FetchUserDetails({
    required this.userID,
  });
}
