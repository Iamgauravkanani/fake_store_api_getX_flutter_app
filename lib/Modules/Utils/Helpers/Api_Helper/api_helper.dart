import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../App/Home_Screen/Model/Api_Model/api_model.dart';

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  Future<List<FakeStoreData>?> fetchApiData() async {
    String api = "https://fakestoreapi.com/products";
    http.Response responce = await http.get(Uri.parse(api));

    if (responce.statusCode == 200) {
      List decodedData = jsonDecode(responce.body);

      List<FakeStoreData> allData =
          decodedData.map((e) => FakeStoreData.fromAPI(map_data: e)).toList();
      return allData;
    }
    return null;
  }
}
