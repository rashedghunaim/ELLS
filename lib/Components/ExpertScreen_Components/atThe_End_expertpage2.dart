import 'package:flutter/material.dart';
import 'package:graduation/Components/ExpertScreen_Components/Expertpage3.dart';

class AtheEndExpertPage2 extends StatelessWidget {
  final userId;
  AtheEndExpertPage2({this.userId});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: 400,
        child: RaisedButton(
          onPressed: () {
            return Navigator.of(context).pushNamed(ExpertPage3.rouneName,
                arguments: {'userId': userId});
          },
          color: Colors.blue,
          child: Text(
            'proceed to rating application ',
            style: TextStyle(color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 17),
        ),
      ),
    );
  }
}
