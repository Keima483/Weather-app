import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  String cityName ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('Search Page'),
      ),
      body: GestureDetector(
        onTap: (){
        },
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                onChanged: (name) {
                  this.cityName = name ;
                },
                autofocus: true,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  icon: Icon(
                      Icons.location_city,
                    color: Colors.black,
                    size: 30,
                  ),
                  hintText: 'Enter city name',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            FlatButton(
              color: Colors.white,
              onPressed: (){
                FocusScope.of(context).unfocus() ;
                Navigator.pop(context, cityName.trim()) ;
              },
              child: Text(
                'Get Weather',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Spartan MB',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
