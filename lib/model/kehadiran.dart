// To parse this JSON data, do
//
//     final kehadiran = kehadiranFromJson(jsonString);

import 'dart:convert';

List<Kehadiran> kehadiranFromJson(String str) =>
    List<Kehadiran>.from(json.decode(str).map((x) => Kehadiran.fromJson(x)));

String kehadiranToJson(List<Kehadiran> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kehadiran {
  Kehadiran({
    this.idKehadiran,
    this.idName,
    this.nameSantri,
    this.information,
  });

  String? idKehadiran;
  String? idName;
  String? nameSantri;
  String? information;

  factory Kehadiran.fromJson(Map<String, dynamic> json) => Kehadiran(
        idKehadiran: json["id_kehadiran"],
        idName: json["id_name"],
        nameSantri: json["name_santri"],
        information: json["information"],
      );

  Map<String, dynamic> toJson() => {
        "id_kehadiran": idKehadiran,
        "id_name": idName,
        "name_santri": nameSantri,
        "information": information,
      };
}
