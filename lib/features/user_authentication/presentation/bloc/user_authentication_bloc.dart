import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecases/authenticate_user.dart';
import '../../domain/usecases/signout_user.dart';

part 'user_authentication_event.dart';
part 'user_authentication_state.dart';

class UserAuthenticationBloc
    extends Bloc<UserAuthenticationEvent, UserAuthenticationState> {
  final AuthenticateUser authenticateUser;
  final SignOutUser signoutUser;
  final FetchUserDetails fetchUser;

  UserAuthenticationBloc({
    required this.authenticateUser,
    required this.signoutUser,
    required this.fetchUser,
  }) : super(UserNotAvailable()) {
    on<UserLogIn>(_loginUser);
    on<UserLogOut>(_logoutUser);
    on<FetchUserDetails>(_fetchUserDetails);
  }

  FutureOr<void> _loginUser(
      UserLogIn event, Emitter<UserAuthenticationState> emit) {
    // print(event.email);
    // print(event.password);
    // 1. VALIDATE THE INPUTS
    // 2. CALL THE LOGIN API
    // 3. IF SUCCESS, THEN SAVE THE USER DETAILS IN THE LOCAL STORAGE, and emit the state
    // emit UserAuthenticationState
    // emit(UserDetailsLoading());
  }

  FutureOr<void> _logoutUser(
      UserLogOut event, Emitter<UserAuthenticationState> emit) {
    // LOGOUT AND CLEAR SESSION
    // emit(UserNotAvailable());
  }

  FutureOr<void> _fetchUserDetails(
      FetchUserDetails event, Emitter<UserAuthenticationState> emit) {
    // print(event.userID);
    // FETCH USERDETAILS USING USER ID
    // emit(UserDetailsLoaded());
  }
}
