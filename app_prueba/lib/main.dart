//import 'firebase_options.dart'; // Paquetes que se usan para
import 'package:app_prueba/firebase_options.dart';
import 'package:flutter/material.dart'; // Usar firebase
import 'package:firebase_core/firebase_core.dart';

import 'screens/menu.dart';
import 'screens/login.dart'; // Importar el archivo login.dart

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ayuda a identificar errores.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Miapp());
}

class Miapp extends StatelessWidget {
  const Miapp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pantalla de ingreso',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false, // Oculta el banner de "DEBUG"
      initialRoute: 'login',
      //home: const MyHomePage(),
      routes: {
        'login': (context) => LoginScreen(),
        'Menu': (_) => Menu(),
      },
    );
  }
}
