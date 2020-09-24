import 'package:http/http.dart' as http;
import './models/brand.dart';
class GetData {
  static const String url = 'http://prova-ltd.herokuapp.com/user_api/stores';
static Future<List<Brand>> getBrands() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Brand> brands = brandFromJson(response.body);
        return brands;
      } else {
        return List<Brand>();
      }
    } catch (e) {
      return List<Brand>();
    }
  }
}