import 'package:flutter/material.dart';
import 'package:graduation/Components/Home_Screen_Components/Messiging_Button_Widget.dart';
import 'package:graduation/Components/Profile_Screen_Components/Center_Widget.dart';
import 'package:graduation/Components/Profile_Screen_Components/Left_Widget.dart';
import 'package:dio/dio.dart';

class ProfileScreenBodyContent extends StatefulWidget {
  @override
  _ProfileScreenBodyContentState createState() =>
      _ProfileScreenBodyContentState();
}

class _ProfileScreenBodyContentState extends State<ProfileScreenBodyContent> {
  String expertName;
  String expertRejectFeedback;

  void userData() async {
    try {
      var response = await Dio().get("http://localhost:8080/UserProfile",
          options: Options(
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          ));
      var res = response.data;
      setState(() {
        expertRejectFeedback = res['speciality'];
        expertName = res['fullname'];
      });
      print(expertName);
      print(expertRejectFeedback);

      print(res);
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    userData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 30),
      child: Stack(
        children: [
          Row(
            children: [
              SingleChildScrollView(
                child: ProfileLeftSideWidget(height: 540, height2: 550),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 40, bottom: 0.0, top: 0.0, right: 0.0),
                child: SingleChildScrollView(
                  child: ProfileCenterSideWidget(
                    expertName: expertName,
                    expertRejectFeedBack: expertRejectFeedback,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: MessagingButtonWidget(),
          ),
        ],
      ),
    );
  }
}
