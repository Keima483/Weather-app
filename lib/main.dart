import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/services.dart';
import 'package:WeatherApp/services/weather.dart';
import 'package:WeatherApp/FirstScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]) ;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppBody(),
    );
  }
}

class AppBody extends StatefulWidget {
  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {

  @override
  void initState() {
    super.initState();
    getLocationData() ;
  }

  void getLocationData() async {

    Weather weatherModel = Weather() ;

    var weatherData = await weatherModel.getLocationWeather() ;

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return MainPage(locationWeather: weatherData,) ;
    }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.green,
          size: 100.0,
        ),
      ),
    );
  }
}

