import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navstore/view/nav_account.dart';
import 'package:navstore/bloc/user_bloc.dart';
import 'package:navstore/bloc/auth_bloc.dart';
import 'package:navstore/view/nav_products.dart';
import 'package:navstore/bloc/product_bloc.dart';

class DrawerLayout extends StatefulWidget {
  const DrawerLayout({super.key});

  @override
  State<DrawerLayout> createState() => _DrawerLayoutState();
}

class _DrawerLayoutState extends State<DrawerLayout> {
  int _currentScreen = 0;

  changeScreen(int value) {
    setState(() {
      _currentScreen = value;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: Color(0xFF240379)),
                  child: Text(
                    "Menu",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                ListTile(
                  title: Text("Produtos"),
                  tileColor: Colors.white,
                  onTap: () {
                    changeScreen(0);
                  },
                ),
                ListTile(
                  title: Text("Minha Conta"),
                  tileColor: Colors.white,
                  onTap: () {
                    changeScreen(1);
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Color(0xFF240379),
            title: const Text(
              "NavStore",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          body: IndexedStack(
            index: _currentScreen,
            children: [
              BlocProvider<ProductBloc>(
                create: (context) {
                  if (authState is Authenticated) {
                    print("Drawer products");
                    return ProductBloc()..add(ProductListLoad());
                  } else {
                    throw Exception('User is not authenticated');
                  }
                },
                child: ListProduct(),
              ), // Exemplo de tela de produtos
              BlocProvider<UserBloc>(
                create: (context) {
                  if (authState is Authenticated) {
                    print("Passando drawer");
                    return UserBloc()..add(UserLoad(authState.user.id!));
                  } else {
                    throw Exception('User is not authenticated');
                  }
                },
                child: AccountScreen(),
              ),
            ],
          ),
        );
      },
    );
  }
}
