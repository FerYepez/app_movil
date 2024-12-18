import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'imc_model.dart';

class SavedScreen extends StatelessWidget {
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
        child: Consumer<IMCModel>(
          builder: (context, imcModel, child) {
            return ListView.builder(
              itemCount: imcModel.savedImcs.length,
              itemBuilder: (context, index) {
                final imc = imcModel.savedImcs[index]['imc'];
                final date = imcModel.savedImcs[index]['date'];
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
            );
          },
        ),
      ),
    );
  }
}
