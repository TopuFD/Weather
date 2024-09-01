import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/api_model/api_model.dart';

class ApiController extends GetxController {
  static const baseUrl =
      "http://api.weatherapi.com/v1/forecast.json?key=a08d088007c541cb8e9180634231609";



  Future<WeatherModel?> getWeatherData(String searchText) async {
    final url = "$baseUrl&q=$searchText&days=7";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        WeatherModel weathermodel = WeatherModel.fromJson(json);
        return weathermodel;
      } else {
        throw "Response is not found";
      }
    } catch (e) {
      Get.defaultDialog(
        title: "Api Exception",
      );
    }
    return null;
  }
}
