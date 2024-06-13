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
              // Espaçamento entre o título e a imagem
              SizedBox(height: 55),
              Image(
                image: AssetImage('lib/assets/logo1.png'),
                width: 200,
                height: 200,
              ),
              SizedBox(height: 88),
              ElevatedButton(
                onPressed: () {
                  // Adicione a lógica para registrar
                },
                child: Text('REGISTRAR',
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
              SizedBox(height: 35),
              ElevatedButton(
                onPressed: () {
                  // Adicione a lógica para registrar
                },
                child: Text('Já faz parte disso? Fazer Login',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
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
      ),
    );
  }
}
