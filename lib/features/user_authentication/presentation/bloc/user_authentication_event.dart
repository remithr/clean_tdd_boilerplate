part of 'user_authentication_bloc.dart';

abstract class UserAuthenticationEvent extends Equatable {
  const UserAuthenticationEvent();

  @override
  List<Object> get props => [];
}

class UserLoggedIn extends UserAuthenticationEvent {
  final String email;
  final String password;

  const UserLoggedIn({
    required this.email,
    required this.password,
  });
}

class UserLoggedOut extends UserAuthenticationEvent {}

class FetchUserDetails extends UserAuthenticationEvent {
  final String userID;
  const FetchUserDetails({
    required this.userID,
  });
}
