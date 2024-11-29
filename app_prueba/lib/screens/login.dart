import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usuario = TextEditingController();
  final TextEditingController password = TextEditingController();

  // Función para iniciar sesión
  Future<void> _login(BuildContext context) async {
    try {
      // ignore: unused_local_variable
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEADC4D),
      body: SafeArea(
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 45, 0, 0),
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                child: Container(
                  width: 280,
                  height: 350,
                  decoration: BoxDecoration(
                    color: Color(0xFFA9EA4B),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 2.0),
                  ),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        // Campo de usuario
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(30, 30, 30, 10),
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
                          padding:
                              EdgeInsetsDirectional.fromSTEB(30, 10, 30, 10),
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: Colors.black,
                            padding:
                                EdgeInsetsDirectional.fromSTEB(25, 15, 25, 15),
                            child: Text(
                              'Iniciar sesión',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () => _login(context),
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
    );
  }
}
