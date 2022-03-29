import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_authentication_event.dart';
part 'user_authentication_state.dart';

class UserAuthenticationBloc extends Bloc<UserAuthenticationEvent, UserAuthenticationState> {
  UserAuthenticationBloc() : super(UserAuthenticationInitial()) {
    on<UserAuthenticationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
