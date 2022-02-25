// To parse this JSON data, do
//
//     final SubMarcas = SubMarcasFromMap(jsonString);

import 'dart:convert';

import 'package:examen/models/SubMarca_model.dart';

// class SubMarcas {
//   SubMarcas({
//     required this.SubMarcaJsonString,
//     this.error,
//   });

//   List<SubMarca> SubMarcaJsonString;
//   dynamic error;

//   factory SubMarcas.fromJson(String str) => SubMarcas.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory SubMarcas.fromMap(Map<String, dynamic> json) => SubMarcas(
//         SubMarcaJsonString: List<SubMarca>.from(json["SubMarcaJsonString"]
//             .map<SubMarca>((x) => SubMarca.fromMap(x))),
//         error: json["Error"],
//       );

//   Map<String, dynamic> toMap() => {
//         "SubMarcaJsonString":
//             List<dynamic>.from(SubMarcaJsonString.map((x) => x.toMap())),
//         "Error": error,
//       };
// }

// import 'dart:convert';

List<SubMarca> subMarcaFromJson(String str) =>
    List<SubMarca>.from(json.decode(str).map((x) => SubMarca.fromJson(x)));

String subMarcaToJson(List<SubMarca> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubMarca {
  SubMarca({
    required this.iIdSubMarca,
    required this.iIdMarcaSubramo,
    required this.iIdMostrar,
    required this.sSubMarca,
  });

  int iIdSubMarca;
  int iIdMarcaSubramo;
  int iIdMostrar;
  String sSubMarca;

  factory SubMarca.fromJson(Map<String, dynamic> json) => SubMarca(
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
