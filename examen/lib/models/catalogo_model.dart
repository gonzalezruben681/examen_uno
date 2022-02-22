// To parse this JSON data, do
//
//     final catalogo = catalogoFromJson(jsonString);

import 'dart:convert';

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
