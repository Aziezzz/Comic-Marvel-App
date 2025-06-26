import 'package:flutter/material.dart';
import 'pages/login_pages.dart'; 
import 'pages/register_pages.dart'; 


void main() async {
  // ...existing code...
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel Comics App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      routes: {
        '/register': (context) => const RegisterPage(),
      } // Ubah ini ke LoginPage
    );
  }
}

class AppTheme {
  // ignore: prefer_typing_uninitialized_variables
  static var lightTheme;
  
  // ignore: prefer_typing_uninitialized_variables
  static var darkTheme;
}

// ...existing code...