// To parse this JSON data, do
//
//     final marca = marcaFromMap(jsonString);

import 'dart:convert';

List<Marca> marcaFromJson(String str) =>
    List<Marca>.from(json.decode(str).map((x) => Marca.fromMap(x)));

String marcaToJson(List<Marca> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Marcas {
//   List<Marca> items = [];

//   Marcas();

// //aqui va recibir el mapa de todas  las respuestas
//   Marcas.fromJsonList(List<dynamic> jsonList) {
//     for (var item in jsonList) {
//       final modelo = Marca.fromMap(item);
//       items.add(modelo);
//     }
//   }
// }

class Marca {
  Marca({
    required this.iIdMarca,
    required this.sMarca,
  });

  int iIdMarca;
  String sMarca;

  String toJson() => json.encode(toMap());

  factory Marca.fromMap(Map<String, dynamic> json) => Marca(
        iIdMarca: json["iIdMarca"],
        sMarca: json["sMarca"],
      );

  Map<String, dynamic> toMap() => {
        "iIdMarca": iIdMarca,
        "sMarca": sMarca,
      };
}
