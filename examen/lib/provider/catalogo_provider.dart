import 'package:flutter/material.dart';
import 'package:examen/api/catalogo_api.dart';
import 'package:examen/models/models.dart';
import 'package:examen/services/notifications_service.dart';

class CatalogoProvider extends ChangeNotifier {
  List<Catalogo> onDisplayCatalogo = [];
  String? mySelection;
  cotizar(String filtro, int idAplication, String nombreCatalogo) {
    final data = {
      'Filtro': filtro,
      'IdAplication': idAplication,
      'NombreCatalogo': nombreCatalogo
    };

    CatalogoApi.post('/catalogos', data).then((json) {
      print(json);
      final catalogos = catalogoFromJson(json);
      onDisplayCatalogo = catalogos;
      notifyListeners();
    }).catchError((e) {
      print('error en: $e');
      NotificationsService.showSnackbarError('Datos no válidos');
    });
  }
}
