import 'package:flutter/material.dart';

class TextField1 extends StatelessWidget {
  final String text;
  final TextEditingController controllerF;
  TextField1({@required this.controllerF, @required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        onSubmitted: (_) {},
        controller: controllerF,
        decoration: InputDecoration(
          hintText: text,
          fillColor: Colors.blueGrey[20],
          filled: true,
          labelStyle: TextStyle(fontSize: 12),
          contentPadding: EdgeInsets.only(left: 30),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.blueGrey[50]),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.blueGrey[50]),
          ),
        ),
      ),
    );
  }
}
