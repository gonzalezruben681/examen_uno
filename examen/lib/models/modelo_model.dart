// To parse this JSON data, do
//
//     final modelo = modeloFromMap(jsonString);

import 'dart:convert';

List<Modelo> modeloFromMap(String str) =>
    List<Modelo>.from(json.decode(str).map((x) => Modelo.fromMap(x)));

String marcaToJson(List<Modelo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
// class Modelos {
//   List<Modelo> items = [];

//   Modelos();

// //aqui va recibir el mapa de todas  las respuestas
//   Modelos.fromJsonList(List<dynamic> jsonList) {
//     for (var item in jsonList) {
//       final modelo = Modelo.fromMap(
//           item); 
//       items.add(modelo);
//     }
//   }
// }

class Modelo {
  Modelo({
    required this.iIdModelo,
    required this.sModelo,
  });

  int iIdModelo;
  String sModelo;

  factory Modelo.fromJson(String str) => Modelo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Modelo.fromMap(Map<String, dynamic> json) => Modelo(
        iIdModelo: json["iIdModelo"],
        sModelo: json["sModelo"],
      );

  Map<String, dynamic> toMap() => {
        "iIdModelo": iIdModelo,
        "sModelo": sModelo,
      };
}
