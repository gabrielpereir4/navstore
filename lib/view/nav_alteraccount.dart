import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:navstore/bloc/user_bloc.dart';

import 'package:navstore/model/user.dart';

class AlterAccountScreen extends StatefulWidget {
  AlterAccountScreen({Key? key}) : super(key: key);

  @override
  _AlterAccountScreenState createState() => _AlterAccountScreenState();
}

class _AlterAccountScreenState extends State<AlterAccountScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserLoaded) {
        nameController.text = state.user.name;
        emailController.text = state.user.email;
        addressController.text = state.user.address;
        postalCodeController.text = state.user.postalcode;

        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: SingleChildScrollView(
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
                      SizedBox(height: 11),
                      Text(
                        'ALTERAR CADASTRO',
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF240379)),
                      ),
                      SizedBox(height: 22),
                      Text(
                        'Altere os dados desejados:',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF6B6B6B)),
                      ),
                      SizedBox(height: 35),
                      Padding(
                        padding: const EdgeInsets.only(right: 164),
                        child: Text(
                          'NOME COMPLETO',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF212121)),
                        ),
                      ),
                      SizedBox(height: 7),
                      Container(
                        width: 296,
                        height: 67,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF240379),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
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
                        width: 296,
                        height: 67,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF240379),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(right: 214),
                        child: Text(
                          'ENDEREÇO',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF212121)),
                        ),
                      ),
                      SizedBox(height: 7),
                      Container(
                        width: 296,
                        height: 67,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF240379),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: TextField(
                            controller: addressController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(right: 264),
                        child: Text(
                          'CEP',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF212121)),
                        ),
                      ),
                      SizedBox(height: 7),
                      Container(
                        width: 296,
                        height: 67,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF240379),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: TextField(
                            controller: postalCodeController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(right: 244),
                        child: Text(
                          'NOVA SENHA',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF212121)),
                        ),
                      ),
                      SizedBox(height: 7),
                      Container(
                        width: 296,
                        height: 67,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF240379),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(right: 148),
                        child: Text(
                          'CONFIRME A SENHA',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF212121)),
                        ),
                      ),
                      SizedBox(height: 7),
                      Container(
                        width: 296,
                        height: 67,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF240379),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: TextField(
                            controller: confirmPasswordController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          print('ALTERAR');
                          String name = nameController.text;
                          String email = emailController.text;
                          String address = addressController.text;
                          String postalCode = postalCodeController.text;
                          String password = passwordController.text;
                          String confirmPassword =
                              confirmPasswordController.text;

                          if (name.isEmpty ||
                              password.isEmpty ||
                              email.isEmpty ||
                              confirmPassword.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Erro'),
                                  content: Text(
                                      'Todos os campos devem ser preenchidos.'),
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
                                  content: Text(
                                      'Por favor, digite um email válido.'),
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

                          if (password != confirmPassword) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Erro'),
                                  content: Text(
                                      'As senhas não coincidem. Confirme a senha digitando exatamente a mesma nos dois campos.'),
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

                          print('Nome: $name');
                          print('Email: $email');
                          print('End: $address');
                          print('cep: $postalCode');
                          print('Senha: $password');
                          print('Confirme a Senha: $confirmPassword');

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Sucesso'),
                                content: Text('Cadastro alterado!'),
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
                          User newuser = User(state.user.id, name, email,
                              address, postalCode, password, false);
                          context
                              .read<UserBloc>()
                              .add(UserUpdate(state.user.id!, newuser));

                          //Vai para tela de produtos;
                        },
                        child: Text('ALTERAR',
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
                    ]),
              ),
            ),
          ),
        );
      } else if (state is UserLoadError) {
        return Center(child: Text('Erro ao carregar usuário: ${state.error}'));
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }
}
