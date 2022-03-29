part of 'user_authentication_bloc.dart';

abstract class UserAuthenticationState extends Equatable {
  const UserAuthenticationState();

  @override
  List<Object> get props => [];
}

class UserNotAvailable extends UserAuthenticationState {}

class UserDetailsLoading extends UserAuthenticationState {}

class UserDetailsLoaded extends UserAuthenticationState {}

class UserDetailsFailure extends UserAuthenticationState {
  final String message;
  const UserDetailsFailure(this.message);
}
