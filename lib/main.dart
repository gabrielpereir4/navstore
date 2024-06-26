import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navstore/bloc/auth_bloc.dart';
import 'package:navstore/view/wrapper.dart';

void main() async {
  runApp(const MainApp());
  Future<void> loadApp() async {
    WidgetsFlutterBinding
        .ensureInitialized(); // Garante que o Flutter esteja inicializado

    //User user = User(1, 'Gabriel', 'gabrielemail', 'qwerty', 'Add', '12345-000', false);
    //user = await AuthProvider.helper.registerUser(user);
    //User? user2 = await AuthProvider.helper.loginUser('gabrielemail', 'qwerty');

    //UserProvider.helper.update(user2!.id, user);
    //print(user2!.toMap());
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => AuthBloc()),
      ], child: const Wrapper()),
    );
  }
}
