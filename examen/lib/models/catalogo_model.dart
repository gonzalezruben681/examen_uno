import 'dart:convert';

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

  factory Catalogo.fromJson(String str) =>
      Catalogo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Catalogo.fromMap(Map<String, dynamic> json) =>
      Catalogo(
        iIdSubMarca: json["iIdSubMarca"],
        iIdMarcaSubramo: json["iIdMarcaSubramo"],
        iIdMostrar: json["iIdMostrar"],
        sSubMarca: json["sSubMarca"],
      );

  Map<String, dynamic> toMap() => {
        "iIdSubMarca": iIdSubMarca,
        "iIdMarcaSubramo": iIdMarcaSubramo,
        "iIdMostrar": iIdMostrar,
        "sSubMarca": sSubMarca,
      };
}
