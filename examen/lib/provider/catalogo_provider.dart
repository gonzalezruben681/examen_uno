import 'package:examen/models/marca_model.dart';
import 'package:examen/models/modelo_model.dart';
import 'package:flutter/material.dart';
import 'package:examen/api/catalogo_api.dart';
import 'package:examen/models/models.dart';
import 'package:examen/services/notifications_service.dart';

import '../models/descripcion_model.dart';

class CatalogoProvider extends ChangeNotifier {
  List<Marca> onDisplayMarca = [];
  List<SubMarca> onDisplayCatalogo = [];
  List<Modelo> onDisplayModelo = [];
  List<Descripcion> onDisplayDescripcion = [];

  String? mySelection;

  cotizar(String filtro, int idAplication, String nombreCatalogo) {
    final data = {
      'Filtro': filtro,
      'IdAplication': idAplication,
      'NombreCatalogo': nombreCatalogo
    };

    CatalogoApi.post('/catalogos', data).then((json) {
      if (json.toString().contains('sMarca')) {
        final marca = marcaFromJson(json);
        onDisplayMarca = marca;
      } else if (json.toString().contains('sSubMarca')) {
        final subMarca = subMarcaFromJson(json);
        onDisplayCatalogo = subMarca;
      } else if (json.toString().contains('sModelo')) {
        final modelo = modeloFromMap(json);
        onDisplayModelo = modelo;
      } else if (json.toString().contains('sDescripcion')) {
        final descripcion = descripcionFromJson(json);
        onDisplayDescripcion = descripcion;
      }
      notifyListeners();
    }).catchError((e) {
      print('error en: $e');
      NotificationsService.showSnackbarError('Datos no válidos');
    });
  }
}
