import 'package:flutter/material.dart';
import 'package:graduation/Custom_Config/Theme.dart';

class LoginWith extends StatefulWidget {
  final Icon icons;
  final isActive;
  LoginWith({this.icons, this.isActive = false});

  @override
  _LoginWithState createState() => _LoginWithState();
}

class _LoginWithState extends State<LoginWith> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Container(
        height: 50,
        width: 475,
        child: Align(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Join With '),
              SizedBox(
                width: 10,
              ),
              Icon(
                MyIcons.Google,
                size: 20,
              ),
            ],
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: () {},
    );
  }
}
