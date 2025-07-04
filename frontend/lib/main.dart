import 'package:flutter/material.dart';
import 'package:frontend/presentation/pages/contatos_page.dart';
import './presentation/pages/login.dart';
import './presentation/pages/cadastro.dart';
import "./presentation/pages/meus_processos.dart";
import 'presentation/pages/todos_processos.dart';
import "./presentation/pages/main_page.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestão GFD',
      theme: ThemeData(
        primaryColor: const Color(0xFF28582E),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF28582E),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          iconTheme: IconThemeData(color: Colors.white),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF28582E),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF28582E), width: 2),
          ),
          labelStyle: const TextStyle(color: Colors.black),
        ),
      ),
      routes: {
        "/": (context) => LoginPage(),
        "/cadastro": (context) => CadastroPage(),
        "/meusProcessos": (context) => MainMenu(),
        "/todosProcessos": (context) => TodosProcessos(),
        "/mainPage": (context) => GraficoProcessosPage(),
        "/contatos":(context)=> Contatos()
      },
    );
  }
}
