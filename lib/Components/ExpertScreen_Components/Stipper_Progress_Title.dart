import 'package:flutter/material.dart';

class StipperTitle extends StatelessWidget {
  String title, subtitle;
  Color activeColor;
  Color subtitleActiveColor;
  Widget widg;
  StipperTitle(
      {this.activeColor,
      this.subtitle,
      this.title,
      this.widg,
      this.subtitleActiveColor});
  @override
  Widget build(BuildContext context) {
    if (activeColor == null) activeColor = Colors.black;
    return Container(
      height: 50,
      width: 100,
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: activeColor),
          ),
          SizedBox(height: 30),
          Text(subtitle),
        ],
      ),
    );
  }

  copyWith({
    String title,
    subtitle,
    Color activeColor,
  }) {
    return Container(
      width: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Text(
            title ?? this.title,
            style: TextStyle(color: activeColor ?? this.activeColor),
          ),
          SizedBox(height: 5),
          Text(
            subtitle ?? this.subtitle ?? '',
            style: TextStyle(color: activeColor),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
