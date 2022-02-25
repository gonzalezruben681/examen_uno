// To parse this JSON data, do
//
//     final catalogos = catalogosFromMap(jsonString);

import 'dart:convert';

import 'package:examen/models/catalogo_model.dart';

// class Catalogos {
//   Catalogos({
//     required this.catalogoJsonString,
//     this.error,
//   });

//   List<Catalogo> catalogoJsonString;
//   dynamic error;

//   factory Catalogos.fromJson(String str) => Catalogos.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Catalogos.fromMap(Map<String, dynamic> json) => Catalogos(
//         catalogoJsonString: List<Catalogo>.from(json["CatalogoJsonString"]
//             .map<Catalogo>((x) => Catalogo.fromMap(x))),
//         error: json["Error"],
//       );

//   Map<String, dynamic> toMap() => {
//         "CatalogoJsonString":
//             List<dynamic>.from(catalogoJsonString.map((x) => x.toMap())),
//         "Error": error,
//       };
// }

// import 'dart:convert';

List<Catalogo> catalogoFromJson(String str) =>
    List<Catalogo>.from(json.decode(str).map((x) => Catalogo.fromJson(x)));

String catalogoToJson(List<Catalogo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Catalogo {
  Catalogo({
    required this.iIdSubMarca,
    required this.iIdMarcaSubramo,
    required this.iIdMostrar,
    required this.sSubMarca,
  });

  int iIdSubMarca;
  int iIdMarcaSubramo;
  int iIdMostrar;
  String sSubMarca;

  factory Catalogo.fromJson(Map<String, dynamic> json) => Catalogo(
        iIdSubMarca: json["iIdSubMarca"],
        iIdMarcaSubramo: json["iIdMarcaSubramo"],
        iIdMostrar: json["iIdMostrar"],
        sSubMarca: json["sSubMarca"],
      );

  Map<String, dynamic> toJson() => {
        "iIdSubMarca": iIdSubMarca,
        "iIdMarcaSubramo": iIdMarcaSubramo,
        "iIdMostrar": iIdMostrar,
        "sSubMarca": sSubMarca,
      };
}
