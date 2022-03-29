part of 'user_authentication_bloc.dart';

abstract class UserAuthenticationState extends Equatable {
  const UserAuthenticationState();

  @override
  List<Object> get props => [];
}

class UserAuthenticationInitial extends UserAuthenticationState {}

class UserAuthenticated extends UserAuthenticationState {}

class UserUnauthenticated extends UserAuthenticationState {}
