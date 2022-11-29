import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    Uri uri = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=d1f069b68410dd1d7766313cc058fcdc&units=metric");
    NetworkHelper networkHelper = NetworkHelper(uri: uri);
    var decodeData = await networkHelper.getData();
    return decodeData;
  }

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getLocation();
    var longitude = location.longitude;
    var latitude = location.latitude;
    Uri uri = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=d1f069b68410dd1d7766313cc058fcdc&units=metric");
    NetworkHelper networkHelper = NetworkHelper(uri: uri);
    var decodeData = await networkHelper.getData();
    return decodeData;
}

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
