import 'package:http/http.dart' as http;
import 'package:siq/model/kehadiran.dart';
import 'package:siq/model/santri.dart';

class SantriProvider {
  // API post kehadiran
  // API dapatkan santri berdasarkan status kehadiran

  static const String theUrl = 'http://192.168.43.228/api_santri/select.php';
  static const String postUrl =
      'http://192.168.43.228/api_santri/tambah.php'; //ubah url
  static const String gettUrl =
      'http://192.168.43.228/api_santri/getkehadiran.php';

  static Future<List<Santri>> getSantri() async {
    try {
      final result = await http.get(Uri.parse(theUrl));
      if (200 == result.statusCode) {
        final List<Santri> santris = santrisFromJson(result.body);
        return santris;
      } else {
        return <Santri>[];
      }
    } catch (e) {
      return <Santri>[];
    }
  }

  static Future<bool> postSantri(Map<String, dynamic> body) async {
    try {
      final result = await http.post(Uri.parse(postUrl), body: body);
      if (200 == result.statusCode) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<List<Kehadiran>> getKehadiran() async {
    try {
      final result = await http.get(Uri.parse(gettUrl));
      if (200 == result.statusCode) {
        final List<Kehadiran> kehadirans = kehadiranFromJson(result.body);
        return kehadirans;
      } else {
        return <Kehadiran>[];
      }
    } catch (e) {
      return <Kehadiran>[];
    }
  }
}
