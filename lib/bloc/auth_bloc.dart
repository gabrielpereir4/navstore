import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navstore/model/user.dart';
import 'package:navstore/provider/auth_provider.dart';

// Eventos

abstract class AuthEvent {}

class RegisterEvent extends AuthEvent {
  User user;

  RegisterEvent({required this.user});
}

class LoginEvent extends AuthEvent {
  String username;
  String password;

  LoginEvent({required this.username, required this.password});
}

class LogoutEvent extends AuthEvent {}

class AuthServerEvent extends AuthEvent {}

// Estados

abstract class AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  User user;

  Authenticated({required this.user});
}

class AuthError extends AuthState {
  String errormessage;

  AuthError({required this.errormessage});
}

// Bloc

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Unauthenticated()) {
    on<RegisterEvent>((event, emit) async {
      print("REGISTRANDO!");
      try {
        User newuser = await AuthProvider.helper.registerUser(event.user);
        emit(Authenticated(user: newuser));
      } catch (e) {
        emit(AuthError(errormessage: e.toString()));
      }
    });

    on<LoginEvent>((event, emit) async {
      try {
        User? newuser =
            await AuthProvider.helper.loginUser(event.username, event.password);
        print('logado');
        emit(Authenticated(user: newuser!));
        print("emitido");
      } catch (e) {
        emit(AuthError(errormessage: e.toString()));
      }
    });

    on<LogoutEvent>((event, emit) {
      emit(Unauthenticated());
    });
  }
}
