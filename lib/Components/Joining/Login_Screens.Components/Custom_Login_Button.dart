import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final double width;
  final Function onPressed;
  final Color primarycolor;
  final Color onPrimarcolor;
  LoginButton(
      {this.onPressed,
      this.onPrimarcolor,
      this.primarycolor,
      this.width,
      @required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Container(
        height: 50,
        width: width,
        child: Center(
          child: Text(title),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
