import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SavedScreen extends StatelessWidget {
  final List<Map<String, dynamic>> savedImcs;

  SavedScreen({required this.savedImcs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IMCs Guardados"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.login), // Icono de "login" a la derecha
            onPressed: () {
              // Acción al presionar el icono de "login"
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: savedImcs.length,
          itemBuilder: (context, index) {
            final imc = savedImcs[index]['imc'];
            final date = savedImcs[index]['date'];
            final formattedDate = DateFormat('yyyy-MM-dd').format(date);

            return ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("IMC: ${imc.toStringAsFixed(1)}"),
                  Text("Fecha: $formattedDate"),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
