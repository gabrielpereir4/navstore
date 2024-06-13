import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'NAVSTORE',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF240379)),
            ),
            SizedBox(height: 11),
            Text(
              'CADASTRO',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF240379)),
            ),
            SizedBox(height: 22),
            Text(
              'Por favor, digite as informações solicitadas:',
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
                  decoration: InputDecoration(
                    border: InputBorder.none, // Remover a borda padrão
                    contentPadding:
                        EdgeInsets.zero, // Remover o preenchimento interno
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
                  decoration: InputDecoration(
                    border: InputBorder.none, // Remover a borda padrão
                    contentPadding:
                        EdgeInsets.zero, // Remover o preenchimento interno
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
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
                  decoration: InputDecoration(
                    border: InputBorder.none, // Remover a borda padrão
                    contentPadding:
                        EdgeInsets.zero, // Remover o preenchimento interno
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
                  decoration: InputDecoration(
                    border: InputBorder.none, // Remover a borda padrão
                    contentPadding:
                        EdgeInsets.zero, // Remover o preenchimento interno
                  ),
                ),
              ),
            ),
            SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                // Adicione a lógica para registrar
              },
              child: Text('CADASTRAR',
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
    );
  }
}
