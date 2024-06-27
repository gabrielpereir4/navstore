import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navstore/bloc/user_bloc.dart';
import 'package:navstore/bloc/auth_bloc.dart';
import 'package:navstore/view/nav_alteraccount.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is UserLoaded) {
          return MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Informações do Usuário',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF240379),
                        ),
                      ),
                      SizedBox(height: 22),
                      InfoTile(title: 'Nome Completo', value: state.user.name),
                      InfoTile(title: 'Email', value: state.user.email),
                      InfoTile(title: 'Endereço', value: state.user.address),
                      InfoTile(title: 'CEP', value: state.user.postalcode),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Lógica para alterar informações do usuário
                              print('Alterar');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BlocProvider(
                                          create: (context) =>
                                              UserBloc(), // Exemplo de criação do UserBloc
                                          child: AlterAccountScreen())));
                            },
                            child: Text('Alterar'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () {
                              // Lógica para apagar conta
                              print('Apagar Conta');
                              context
                                  .read<UserBloc>()
                                  .add(UserDelete(state.user.id!));
                              context.read<AuthBloc>().add(LogoutEvent());
                            },
                            child: Text('Apagar Conta'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (state is UserLoadError) {
          return Center(
              child: Text('Erro ao carregar usuário: ${state.error}'));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class InfoTile extends StatelessWidget {
  final String title;
  final String value;

  InfoTile({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF212121),
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(1),
            child: Text(
              value,
              style: TextStyle(fontSize: 16, color: Color(0xFF212121)),
            ),
          ),
        ],
      ),
    );
  }
}
