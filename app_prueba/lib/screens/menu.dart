
import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu>{
  @override
  Widget build(BuildContext context) {
    
    return BackdropScaffold(
      backgroundColor: const Color(0xFFEADC4D),
      appBar: BackdropAppBar(
        title: const Text("Menu"),
        backgroundColor: Color(0xFFA9EA4B),
        leading: const BackdropToggleButton(
          icon: 
          AnimatedIcons.home_menu,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Color(0xFF404040),
            ),
            onPressed: () {
              // Acción del icono de notificaciones
              print("Notifications clicked!");
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.person,
              color: Color(0xFF404040),
            ),
            onPressed: () {
              // Acción del icono de notificaciones
              print("Notifications clicked!");
            },
          ),
        ],
      ),
      backLayer: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFA9EA4B), Color(0xFF72C747), Color(0xFFEADC4D), ], // Gradiente de colores
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: const Text(
                'Dieta vegetariana',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF02542D),
                ),
              ),
              
              onTap: () {},
            ),
            
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0), // Padding alrededor del ListTile
              child: ListTile(
                title: const Text(
                'Dieta vegetariana',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF02542D),
                ),
              ),
                onTap: () {},
              ),
            ),

            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0), // Padding alrededor del ListTile
              child: ListTile(
                title: const Text(
                'Dieta keto',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF02542D),
                ),
              ),
                onTap: () {},
              ),
            ),

            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0), // Padding alrededor del ListTile
              child: ListTile(
                title: const Text(
                'Dieta mediterranea',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF02542D),
                ),
              ),
                onTap: () {},
              ),
            ),

          ],
        ),
      ),
      frontLayer: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFEADC4D),// Cambia el color de fondo aquí
        ),
        child: Column(
          
          mainAxisSize: MainAxisSize.max,
          children: [
          SizedBox(
            width: double.infinity,
            height: 300,
            child: CarouselSlider(
              items: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/car1.PNG',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/car3.PNG',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/car6.PNG',
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/car2.PNG',
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/car5.PNG',
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/car7.PNG',
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/car4.PNG',
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/car8.PNG',
                    fit: BoxFit.cover,
                  ),
                ),
              ], 
              options: CarouselOptions(
                height: 220.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                enableInfiniteScroll: true,
                initialPage: 0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
            child: Container(
              width: 480,       // Ancho de contenedor de Dieta
              height: 180,      // Altura de contenedor de Dieta
              decoration: BoxDecoration(
                color: const Color(0xFFF2E990),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, -1),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(20, 25, 20, 0),
                            child: Text(
                              'Dieta',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Inter Tight',
                                fontSize: 27,
                                letterSpacing: 0.9,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 15, 10, 0),
                          child: Text(
                            'Somos lo que comemos. Al elegir nuestros hábitos alimenticios conscientemente, construimos nuestro bienestar.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Noto Sans',
                              color: Color(0xFF040404),
                              fontSize: 17,
                              letterSpacing: 0.3,
                              fontWeight: FontWeight.w500,
                            ),
                          ), 
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Text(
              'Indice de Masa Corporal',
              style: TextStyle(
                fontFamily: 'Noto Sans JP',
                letterSpacing: 0.75,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Align(
                alignment: AlignmentDirectional(-1, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Altura',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 18,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Peso',
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontSize: 18,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(1, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(105, 0, 30, 0),
                          child: SizedBox(
                            width: 250,
                            child: TextField(
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: const TextStyle(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                                hintText: 'Altura',
                                hintStyle: const TextStyle(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                              ),
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(1, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(45, 0, 85, 0),
                          child: SizedBox(
                            width: 230,
                            child: TextField(
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: const TextStyle(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                                hintText: 'Peso',
                                hintStyle: const TextStyle(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                              ),
                              style: TextStyle(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(138, 0, 0, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFA9EA4B),  // Color de fondo
                            minimumSize: Size(95, 40),  // Tamaño mínimo del botón (ancho y alto)
                            padding: EdgeInsets.symmetric(horizontal: 16),  // Padding horizontal
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),  // Bordes redondeados (ajústalo según lo necesites)
                              side: BorderSide(
                                color: Color(0xFF02542D),
                                width: 2,
                              ),
                            ),
                          ),
                          onPressed: (){
                          }, 
                          child: Text(
                            'Calcular',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              color: Color(0xFF02542D),
                              fontSize: 19,
                              letterSpacing: 0.6,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
                      child: IconButton(
                        onPressed: (){
                        }, 
                        icon: Icon(
                          Icons.bookmark_border,
                          color: Color(0xFF02542D),
                          size: 34,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
        ),
           
      ),
    );
  }
}