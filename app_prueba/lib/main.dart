import 'dart:convert';
import 'package:flutter/material.dart';
import 'screens/menu.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:http/http.dart' as http;

void main() {
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
      home: const MyHomePage(),
      routes: {
        'Menu': (_) => const Menu(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  
  TextEditingController usuario = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> insertar() async{
    if(usuario.text != "" || password.text != ""){
      try{
        String uri = "http://localhost/proyectoMoviles/conex.php";
        var res = await http.post(Uri.parse(uri), body: {
          "usuario":usuario.text,
          "password":password.text,
        });

        var response = jsonDecode(res.body);
        if(response["success"]=="true"){
          print("Se hizo la insersion");
        }else{
          print("Dedicate a otra cosa");
        }


      }catch(e){
        print(e);
      }
    }else{
      print("Llena todos los campos bb");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEADC4D),
      body: SafeArea(
        top: true,
        child: Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 135, 0, 0), //  Padding top de imagen 
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0), // Cambia el valor para ajustar el redondeo
                  child: Image.asset(
                    'assets/Logo.png',
                    width: 220,
                    height: 110,
                    fit: BoxFit.cover, // Opcional: ajusta cómo se adapta la imagen
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0), //  Padding top del contenedor verde 
                  child: Container(
                    width: 280,
                    height: 420,
                    decoration: BoxDecoration(
                      color: const Color(0xFFA9EA4B),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    alignment: const AlignmentDirectional(0, 0),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 10),
                            child: Text(
                              'Usuario',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: TextFormField(
                            controller: usuario,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value){
                              String pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regExp = new RegExp(pattern);
                              return regExp.hasMatch(value ?? '')
                              ? null
                              : 'Ingrese un correo valido';
                            },
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: const TextStyle(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                              hintText: 'Usuario',
                              hintStyle: const TextStyle(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(0, 10, 224, 10),
                                    width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(0, 212, 32, 32),
                                    width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(0, 229, 212, 212),
                                    width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,                              
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(30, 35, 30, 10),  //  Padding de contraseña
                            child: Text(
                              'Contraseña',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 200,
                          child: TextFormField(
                            controller: password,
                            obscureText: true,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: TextStyle(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                              hintText: 'Contraseña',
                              hintStyle: TextStyle(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(0, 10, 224, 10),
                                    width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(0, 212, 32, 32),
                                    width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(0, 229, 212, 212),
                                    width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,                              
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0), // Padding del boton de iniciar sesion
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  disabledColor: Color.fromARGB(255, 0, 0, 0),
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  padding: EdgeInsetsDirectional.fromSTEB(25, 15, 25, 15),
                                  child: Text(
                                    'Iniciar sesión', 
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                    ),
                                  ),
                                  onPressed: (){
                                    Navigator.pushReplacementNamed(context, 'Menu');
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                child: Text(
                                  '¿No tienes cuenta?    ',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  disabledColor: Color.fromARGB(255, 0, 0, 0),
                                  color: Color(0xFFEE8B60),
                                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 5),
                                  child: Text(
                                    'Resgistrarse', 
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                    ),
                                  ),
                                  onPressed: (){
                                    insertar();
                                  },
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                    ),
                  ),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



