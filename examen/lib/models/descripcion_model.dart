import 'dart:convert';

List<Descripcion> descripcionFromJson(String str) =>
    List<Descripcion>.from(json.decode(str).map((x) => Descripcion.fromMap(x)));

String descripcionToJson(List<Descripcion> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

// class Descripciones {
//   List<Descripcion> items = [];

//   Descripciones();

// //aqui va recibir el mapa de todas  las respuestas
//   Descripciones.fromJsonList(List<dynamic> jsonList) {
//     for (var item in jsonList) {
//       final modelo = Descripcion.fromMap(item);
//       items.add(modelo);
//     }
//   }
// }

class Descripcion {
  Descripcion({
    required this.iIdDescripcionModelo,
    required this.iIdModeloSubmarca,
    required this.iIdMostrar,
    required this.sDescripcion,
  });

  int iIdDescripcionModelo;
  int iIdModeloSubmarca;
  int iIdMostrar;
  String sDescripcion;

  factory Descripcion.fromMap(Map<String, dynamic> json) => Descripcion(
        iIdDescripcionModelo: json["iIdDescripcionModelo"],
        iIdModeloSubmarca: json["iIdModeloSubmarca"],
        iIdMostrar: json["iIdMostrar"],
        sDescripcion: json["sDescripcion"],
      );

  Map<String, dynamic> toMap() => {
        "iIdDescripcionModelo": iIdDescripcionModelo,
        "iIdModeloSubmarca": iIdModeloSubmarca,
        "iIdMostrar": iIdMostrar,
        "sDescripcion": sDescripcion,
      };
}
