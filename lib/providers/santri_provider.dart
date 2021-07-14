import 'package:http/http.dart' as http;
import 'package:siq/model/santri.dart';

class SantriProvider {
  static const String theUrl = 'http://192.168.43.228/api_santri/select.php';

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
}
