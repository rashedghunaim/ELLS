import 'package:flutter/material.dart';

class CustomRaisedButtonButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final double width;
  final Color color;
  final double height;
  final double textSize;

  CustomRaisedButtonButton(
      {this.width,
      this.text,
      this.onPressed,
      this.height,
      this.color,
      this.textSize});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        onPressed;
      },
      color: color,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: textSize),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 17),
    );
  }
}

Widget rowDivider({double thikness, double width}) {
  return Container(
    width: width,
    height: thikness,
    decoration: BoxDecoration(color: Colors.grey),
  );
}

Widget CustomDivider(
    {double thikness = 0.3,
    Color color = Colors.white60,
    double height = 0.0}) {
  return Divider(
    thickness: thikness,
    color: color,
    height: height,
  );
}

Color textHoverColor({Color color, Color color2, bool isHover}) {
  if (isHover == true) {
    return color;
  } else {
    return color2;
  }
}

