import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Widget childWidget;

  ReusableCard({@required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: childWidget,
      ),
    );
  }
}
