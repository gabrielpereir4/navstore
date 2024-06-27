import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navstore/bloc/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'NAVSTORE',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF240379)),
            ),
            SizedBox(height: 80),
            Text(
              'LOGIN',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF240379)),
            ),
            SizedBox(height: 21),
            Text(
              'Por favor, digite email e senha',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF6B6B6B)),
            ),
            SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.only(right: 244),
              child: Text(
                'EMAIL',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF212121)),
              ),
            ),
            SizedBox(height: 7),
            Container(
              width: 296, // Largura do campo de texto
              height: 67, // Altura do campo de texto
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF240379), // Cor das bordas
                  width: 3, // Grossura das bordas
                ),
                borderRadius: BorderRadius.circular(12), // Arredondar as bordas
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none, // Remover a borda padrão
                    contentPadding:
                        EdgeInsets.zero, // Remover o preenchimento interno
                  ),
                ),
              ),
            ),
            SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.only(right: 244),
              child: Text(
                'SENHA',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF212121)),
              ),
            ),
            SizedBox(height: 7),
            Container(
              width: 296, // Largura do campo de texto
              height: 67, // Altura do campo de texto
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF240379), // Cor das bordas
                  width: 3, // Grossura das bordas
                ),
                borderRadius: BorderRadius.circular(12), // Arredondar as bordas
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: InputBorder.none, // Remover a borda padrão
                    contentPadding:
                        EdgeInsets.zero, // Remover o preenchimento interno
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(height: 45),
            ElevatedButton(
              onPressed: () {
                print('LOGIN');
                String email = emailController.text;
                String password = passwordController.text;

                print('Email: $email');
                print('Password: $password');

                if (email.isEmpty || password.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Erro'),
                        content: Text('Todos os campos devem ser preenchidos.'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                  return;
                }

                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Erro'),
                        content: Text('Por favor, digite um email válido.'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                  return;
                }
                //!Adicionar o Event certo
                context.read<AuthBloc>().add(LoginEvent(
                      username: email,
                      password: password,
                    ));
                Navigator.of(context).pop();
              },
              child: Text('LOGIN',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF))),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(296, 67),
                backgroundColor: Color(0xFF240379),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
