// To parse this JSON data, do
//
//     final santris = santrisFromJson(jsonString);

import 'dart:convert';

List<Santri> santrisFromJson(String str) =>
    List<Santri>.from(json.decode(str).map((x) => Santri.fromJson(x)));

String santrisToJson(List<Santri> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Santri {
  Santri({
    this.idSantri,
    this.nameSantri,
    this.dorm,
    this.imageUrl,
  });

  String? idSantri;
  String? nameSantri;
  String? dorm;
  String? imageUrl;

  factory Santri.fromJson(Map<String, dynamic> json) => Santri(
        idSantri: json["id_santri"],
        nameSantri: json["name_santri"],
        dorm: json["dorm"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id_santri": idSantri,
        "name_santri": nameSantri,
        "dorm": dorm,
        "image_url": imageUrl,
      };
}
