import 'package:WeatherApp/services/networking.dart';
import 'location.dart';
const String apiKey =  ; // enter your api key here
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather' ;

class Weather{

  Future<dynamic> getCityWeather(String cityName) async {

    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric') ;
    var weatherData = await networkHelper.getData() ;

    return weatherData ;
  }

  Future<dynamic> getLocationWeather() async {

    Location location = Location() ;
    await location.getCurrentLocation() ;

    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric') ;
    var weatherData = await networkHelper.getData() ;

    return weatherData ;
  }
}
