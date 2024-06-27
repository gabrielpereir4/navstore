import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navstore/bloc/auth_bloc.dart';
import 'package:navstore/view/drawer_layout.dart';
import 'package:navstore/view/nav_initial.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WrapperState();
  }
}

class WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Erro de Autenticação"),
                content: Text(state.errormessage),
              );
            },
          );
        }
      },
      builder: (context, state) {
        if (state is Authenticated) {
          return DrawerLayout(); // Tela autenticada
        } else {
          return UnauthenticatedScreen(); // Tela não autenticada
        }
      },
    );
  }
}
