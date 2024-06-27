import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navstore/bloc/auth_bloc.dart';
import 'package:navstore/view/wrapper.dart';
import 'package:navstore/view/nav_login.dart';
import 'package:navstore/view/nav_register.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
        title: 'NavStore',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/', // Define a rota inicial
        routes: {
          '/': (context) => const Wrapper(), // Wrapper como a tela inicial
        },
      ),
    );
  }
}
