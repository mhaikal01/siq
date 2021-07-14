// ignore: unused_import
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:siq/model/save.dart';

class SaveProvider extends ChangeNotifier {
  getNamaSantri() async {
    String theUrl = 'http://192.168.43.228/api_santri/api/santri/nama.php';
    var result = await http.get(Uri.parse(theUrl));

    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      final List<Save> save = saveFromJson(result.body);
      return save;
    } else {
      return <Save>[];
    }
  }
}
