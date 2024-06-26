import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navstore/model/user.dart';
import 'package:navstore/provider/user_provider.dart';

// Eventos

abstract class UserEvent {}

class UserInsert extends UserEvent {
  final User newUser;

  UserInsert(this.newUser);
}

class UserLoad extends UserEvent {
  final int id;

  UserLoad(this.id);
}

class UserUpdate extends UserEvent {
  final User user;
  final int id;

  UserUpdate(this.id, this.user);
}

class UserDelete extends UserEvent {
  final int userid;

  UserDelete(this.userid);
}

class UserLoadList extends UserEvent {}

// Estados

abstract class UserState {}

class UserLoaded extends UserState {
  final User user;

  UserLoaded(this.user);
}

class UserLoading extends UserState {}

class UserLoadError extends UserState {
  final String error;

  UserLoadError(this.error);
}

class UserListLoading extends UserState {}

class UserListLoaded extends UserState {
  final List<User> users;

  UserListLoaded(this.users);
}

class UserInserted extends UserState {
  final User user;

  UserInserted(this.user);
}

class UserInsertError extends UserState {
  final String error;

  UserInsertError(this.error);
}

// Bloc

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserLoading()) {
    UserProvider.helper.stream.listen((data) {
      print("Stream received USER data");
      add(UserLoadList());
    });

    on<UserInsert>((event, emit) async {
      try {
        await UserProvider.helper.insert(event.newUser);
        emit(UserInserted(event.newUser));
      } catch (e) {
        emit(UserInsertError(e.toString()));
      }
    });
    on<UserLoad>((event, emit) async {
      try {
        User user = await UserProvider.helper.get(event.id) as User;
        emit(UserLoaded(user));
      } catch (e) {
        emit(UserLoadError(e.toString()));
      }
    });
    on<UserLoadList>((event, emit) async {
      try {
        List<User> list = await UserProvider.helper.getList() as List<User>;
        emit(UserListLoaded(list));
      } catch (e) {
        emit(UserLoadError(e.toString()));
      }
    });
    on<UserUpdate>((event, emit) async {
      await UserProvider.helper.update(event.id, event.user);
    });
    on<UserDelete>((event, emit) async {
      await UserProvider.helper.delete(event.userid);
    });
  }
}
