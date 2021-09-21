import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graduation/Custom_Config/Theme.dart';

class FormFourthSection extends StatelessWidget {
  final managmentCotroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(MyColors.SoftBeach),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: Colors.blue, width: 0.7),
      ),
      height: 380,
      width: 1200,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                child: TextField(
                  controller: managmentCotroller,
                  maxLength: 100,
                  maxLines: 7,
                  decoration: InputDecoration(
                    hintText: 'what do you think ',
                    filled: true,
                    labelStyle: TextStyle(fontSize: 10),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
            ],
          ),
          Align(
            child: Container(
              padding: EdgeInsets.only(left:370, top: 200),
              child: Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.blue,
                      child: Text(
                        'Send ',
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 17),
                    ),
                  ),
                  SizedBox(width: 70),
                  SizedBox(
                    width: 300,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.blue,
                      child: Text(
                        'forward idea to manamgemt ',
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 17),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
