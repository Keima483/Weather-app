import 'package:flutter/material.dart';

class CardLayout extends StatelessWidget {

  final String title ;
  final String value ;
  final IconData iconToUse ;

  CardLayout({@required this.title,@required this.value,@required this.iconToUse});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Text(title),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconToUse),
              SizedBox(width: 10,),
              Text(
                value,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ]
    );
  }
}