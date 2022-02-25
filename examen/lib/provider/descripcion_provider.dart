import 'dart:convert';

import 'package:examen/models/descripcion_model.dart';
import 'package:flutter/material.dart';
import 'package:examen/api/catalogo_api.dart';
import 'package:examen/services/notifications_service.dart';

class DescripcionProvider extends ChangeNotifier {
  List<Descripcion> onDisplayDescripcion = [];
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
      final descripcion = Descripciones.fromJsonList(decodedData);
      for (var item in descripcion.items) {
        onDisplayDescripcion.add(item);
      }
      notifyListeners();
    }).catchError((e) {
      print('error en: $e');
      NotificationsService.showSnackbarError('Datos no válidos');
    });
  }
}
