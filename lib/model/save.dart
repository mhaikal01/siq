// To parse this JSON data, do
//
//     final save = saveFromJson(jsonString);

import 'dart:convert';

List<Save> saveFromJson(String str) =>
    List<Save>.from(json.decode(str).map((x) => Save.fromJson(x)));

String saveToJson(List<Save> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Save {
  Save({
    this.id,
    this.name,
    // this.dorm,
    this.imageUrl,
    this.isLocked,
  });

  String? id;
  String? name;
  // String? dorm;
  String? imageUrl;
  bool? isLocked;

  factory Save.fromJson(Map<String, dynamic> json) => Save(
        id: json["id_santri"],
        name: json["name_santri"],
        // dorm: json["dorm"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id_santri": id,
        "name_santri": name,
        // "dorm": dorm,
        "image_url": imageUrl,
      };
}

// class Save {
//   late int? id;
//   late String? name;
//   late String? imageurl;
//   late bool? isLocked;

//   Save({
//     this.id,
//     this.name,
//     this.imageurl,
//     this.isLocked,
//   });

//   Save.fromJson(json) {
//     id = json['id_santri'];
//     name = json['name_santri'];
//     imageurl = json['image_url'];
//   }
// }
