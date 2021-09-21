import 'package:flutter/material.dart';
import 'package:graduation/Components/Custom_Loading_Button_Widget.dart';
import 'package:graduation/Components/Joining/Login_Screens.Components/At_The_Top.dart';
import 'package:graduation/Components/Joining/Login_Screens.Components/TextField_1_Widget.dart';
import 'package:graduation/Components/Joining/Login_Screens.Components/TextField_2_Widget.dart';
import 'package:graduation/Components/New_To.dart';
import 'package:graduation/Screens/First_Joining_Screen.dart';
import 'package:dio/dio.dart';
import 'package:graduation/Screens/Home_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const String routeNmae = '/Login_Screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool laodingIcon = false;
  bool emptyFileds = false;
  bool badLogin = false;
  final emailTextController = TextEditingController();

  final passwordController = TextEditingController();

  bool isPassowrdHidden = true;
  void fetchHandler() async {
    try {
      dynamic requestoptions = {
        'email': emailTextController.text,
        'password': passwordController.text,
      };
      var response = await Dio().post("http://localhost:8080/Login",
          data: requestoptions,
          options: Options(
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          ));
      var res = response.data;
      print(res[0]['Messages']);
      if (res[0]['Messages'] == "Success") {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String uid = res[0]['value']['uid'].toString();
        prefs.setString("uid", uid);
        Navigator.of(context).pushNamed(HomeScreen.routeName);
        print(res[0]['value']['type']);
      } else {
        setState(() {
          laodingIcon = true;
          badLogin = true;
        });
        print(res[0]['Messages']);
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          AtTheTop(title: 'Sign In', fontSize: 40),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: 600,
              height: 600,
              child: Column(
                children: [
                  TextField1(
                      text: 'Enter Your Email',
                      controllerF: emailTextController),
                  SizedBox(height: 30),
                  TextField2(
                    controllerf: passwordController,
                    hintText: 'Enter Your Password',
                    counterText: 'forgot password ?',
                    onPressed: () {},
                  ),
                  SizedBox(height: 10),
                  emptyFileds
                      ? Container(
                          child: Text(
                            'Pls enter your email and password',
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      : badLogin
                          ? Container(
                              child: Text(
                                'Email and password incorrect',
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          : Container(),
                  SizedBox(height: 40),
                  Container(
                    height: 50,
                    child: CustomLoadingButton(
                      laodingIcon: laodingIcon,
                      onPressed: () {
                        if (emailTextController.text == "" ||
                            passwordController.text == "") {
                          setState(() {
                            emptyFileds = true;
                          });
                          Dialog(
                            child: Container(
                              color: Colors.red,
                              height: 200,
                              width: 200,
                            ),
                          );
                        } else {
                          fetchHandler();
                        }
                      },
                      title: 'Sign In',
                    ),
                  ),
                  SizedBox(height: 40),
                  newTo(
                    title: 'New to ELLS ?',
                    title2: 'Join Now',
                    isActive: false,
                    press: () {
                      Navigator.of(context)
                          .pushNamed(FirstJoiningScreen.routeName);
                    },
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
