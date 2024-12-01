import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_services.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usuario = TextEditingController();
  final TextEditingController password = TextEditingController();

  // Función para iniciar sesión
/*   Future<void> _login(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: usuario.text, password: password.text);

      // Si el login es exitoso, navega al menú
      Navigator.pushReplacementNamed(context, 'Menu');
    } catch (e) {
      // Manejo de errores
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEADC4D),
      body: SafeArea(
        child: SingleChildScrollView(
          // Solución para evitar el desbordamiento
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 45, 0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      'assets/Logo.png',
                      width: 220,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                  child: Container(
                    width: 280,
                    height: 400,
                    decoration: BoxDecoration(
                      color: const Color(0xFFA9EA4B),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2.0),
                    ),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          // Campo de usuario
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                30, 30, 30, 10),
                            child: TextFormField(
                              controller: usuario,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Usuario',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          // Campo de contraseña
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                30, 10, 30, 10),
                            child: TextFormField(
                              controller: password,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Contraseña',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          // Botón de iniciar sesión
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 30, 0, 0),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              color: Colors.black,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  25, 15, 25, 15),
                              child: const Text(
                                'Iniciar sesión',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                // Validación previa
                                if (usuario.text.isEmpty ||
                                    password.text.isEmpty) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Campos vacíos'),
                                      content: const Text(
                                          'Por favor, complete los campos de usuario y contraseña.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                  return;
                                }

                                // Intento de inicio de sesión
                                try {
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                    email: usuario.text,
                                    password: password.text,
                                  );

                                  // Redirige al menú si el inicio de sesión es exitoso
                                  Navigator.pushReplacementNamed(
                                      context, 'Menu');
                                } catch (e) {
                                  // Mensaje de error amigable
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title:
                                          const Text('Error al iniciar sesión'),
                                      content: const Text(
                                          'Usuario o contraseña incorrectos.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                          ),

                          // Botón de iniciar sesión con Google
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                25, 15, 25, 15),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.zero,
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                              ),
                              onPressed: () async {
                                try {
                                  await AuthService().sigInWithGoogle();

                                  // Redirige al menú si el inicio de sesión es exitoso
                                  Navigator.pushReplacementNamed(
                                      context, 'Menu');
                                } catch (e) {
                                  // Manejo de errores con mensaje amigable
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text(
                                          'Error al iniciar sesión con Google'),
                                      content: const Text(
                                        'Hubo un problema al iniciar sesión. Por favor, inténtelo de nuevo más tarde.',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/google.jpg',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
