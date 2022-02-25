import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:examen/api/catalogo_api.dart';
import 'package:examen/models/modelo_model.dart';
import 'package:examen/services/notifications_service.dart';

class ModeloProvider extends ChangeNotifier {
  List<Modelo> onDisplayModelo = [];
  String? mySelection;
  cotizar(String filtro, int idAplication, String nombreCatalogo) {
    final data = {
      'Filtro': filtro,
      'IdAplication': idAplication,
      'NombreCatalogo': nombreCatalogo
    };

    CatalogoApi.post('/catalogos', data).then((data) {
      print(data);
      final decodedData = json.decode(data);
      final modelos = Modelos.fromJsonList(decodedData);
      for (var item in modelos.items) {
        onDisplayModelo.add(item);
      }
      notifyListeners();
    }).catchError((e) {
      print('error en: $e');
      NotificationsService.showSnackbarError('Datos no válidos');
    });
  }
}
