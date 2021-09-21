import 'package:flutter/material.dart';
import 'package:graduation/Custom_Config/Theme.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormThirdSection extends StatelessWidget {
  final expertController = TextEditingController();
  var expertFeedBack;
  void feedback() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var id = prefs.getString("EXid");
      dynamic requestoptions = {
        "feedback": expertController.text,
        "expertid": id
      };
      var response = await Dio().post("http://localhost:8080/FeedBackACS",
          data: requestoptions,
          options: Options(
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          ));
      var res = response.data;
      print(res);
    } catch (err) {
      print(err);
    }
  }

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
                  controller: expertController,
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
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.only(right: 50, bottom: 20),
              child: SizedBox(
                width: 200,
                child: RaisedButton(
                  onPressed: () {
                    return feedback();
                  },
                  color: Colors.blue,
                  child: Text(
                    'Send ',
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 17),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
