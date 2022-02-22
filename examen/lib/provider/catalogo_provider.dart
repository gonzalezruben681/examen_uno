import 'package:examen_uno/models/catalogo_model.dart';
import 'package:flutter/material.dart';

import 'package:examen_uno/api/catalogo_api.dart';
import 'package:examen_uno/services/notifications_service.dart';

class CatalogoProvider extends ChangeNotifier {
  List<Catalogo>? list;

  cotizar(String filtro, int idAplication, String nombreCatalogo) {
    final data = {
      'Filtro': filtro,
      'IdAplication': idAplication,
      'NombreCatalogo': nombreCatalogo
    };

    CatalogoApi.post('/catalogos', data).then((json) {
      print(json);
      list = catalogoFromJson(json);
      notifyListeners();
    }).catchError((e) {
      print('error en: $e');
      NotificationsService.showSnackbarError('Datos no válidos');
    });
  }
}
