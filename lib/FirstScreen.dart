import 'package:flutter/material.dart';
import 'search_page.dart';
import 'my_widgets/card_layout.dart';
import 'my_widgets/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'services/weather.dart';


class MainPage extends StatefulWidget {

  final locationWeather;
  MainPage({this.locationWeather});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  Weather weather= Weather() ;
  int temperature ;
  String description ;
  String climate ;
  var humidity ;
  var pressure ;
  String cityName ;
  var feelsLike ;
  var windSpeed ;
  var visibility ;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void startApp() async {
    Weather weatherModel = Weather() ;
    var weatherData = await weatherModel.getLocationWeather() ;
    updateUI(weatherData) ;
  }

  void updateUI(dynamic weatherData) async{
    setState(() {
      if(weatherData != null) {
        var temp = weatherData['main']['temp'] ;
        temperature = temp.round() ;
        description = weatherData['weather'][0]['description'] ;
        climate = weatherData['weather'][0]['main'] ;
        var feLike = weatherData['main']['feels_like'] ;
        feelsLike = feLike.round() ;
        humidity = weatherData['main']['humidity'] ;
        pressure = weatherData['main']['pressure'] ;
        windSpeed = weatherData['wind']['speed'] ;
        visibility = weatherData['visibility'] ;
        cityName = weatherData['name'] ;
      } else {
        temperature = humidity = pressure = feelsLike = windSpeed = visibility = 0 ;
        description = climate = cityName = 'Loading' ;
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return SearchPage() ;
        })) ;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () async{
            var weatherData = await weather.getLocationWeather() ;
            updateUI(weatherData) ;
          },
          icon: Icon(FontAwesomeIcons.locationArrow),
        ),
        title: Center(child: Text('Weather Report')),
        actions: [
          IconButton(
            onPressed: () async{
              var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));
              if(typedName != null) {
                var weatherData = await weather.getCityWeather(typedName) ;
                updateUI(weatherData);
              }
            },
            padding: EdgeInsets.only(right: 20),
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 35,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 7,
              child: Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Currently in $cityName',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      temperature.toString() + '\u00B0C',
                      style: TextStyle(
                        fontSize: 58.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ReusableCard(
                            childWidget: CardLayout(
                              title: 'Feels Like',
                              value: '$feelsLike\u00B0C',
                              iconToUse: FontAwesomeIcons.temperatureLow,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            childWidget: CardLayout(
                              title: 'Weather Type',
                              value: climate,
                              iconToUse: FontAwesomeIcons.cloudSun,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ReusableCard(
                            childWidget: CardLayout(
                              title: 'Wind Speed',
                              value: '$windSpeed m/s',
                              iconToUse: FontAwesomeIcons.wind,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            childWidget: CardLayout(
                              title: 'Humidity',
                              value: '$humidity%',
                              iconToUse: FontAwesomeIcons.water,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ReusableCard(
                            childWidget: CardLayout(
                              title: 'Pressure',
                              value: '${pressure}hPa',
                              iconToUse: FontAwesomeIcons.angleDoubleDown,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            childWidget:CardLayout(
                              title: 'Visibility',
                              value: '${visibility/1000}km',
                              iconToUse: FontAwesomeIcons.eye,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
