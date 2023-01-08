import 'package:dio/dio.dart';
import 'package:simple_weather/domain/models/weather_model.dart';

class WeatherRemoteDataSource {
  Future<Map<String, dynamic>?> getWeatherData({
    required String city,
  }) async {
    try {
      final response = await Dio().get<Map<String, dynamic>>(
          'http://api.weatherapi.com/v1/current.json?key=abc44451aeb24696b42194405230401&q=$city&aqi=no');
      return response.data;
    } on DioError catch (error) {
      // if (error.response == null) {
      //   throw Exception('Unknown error');
      // } else {   <================================== To jest ten sam zapis co pod spodem
      //   throw Exception(error.response!.data);
      // }
      throw Exception(
          error.response?.data['error']['message'] ?? 'Błąd nieznany');
    }
  }
}
