import 'package:flutter/material.dart';
import 'package:graduation/Components/OnBoarding_Screen_Components/Web_Menu_OnBoardingScreen.dart';
import 'package:graduation/Custom_Config/Theme.dart';
import 'package:graduation/Screens/First_Joining_Screen.dart';
import 'package:graduation/Screens/Login_Screen.dart';

class OnBoardingScreen extends StatelessWidget {
  static String routeName = 'onBoarding';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  _Header(context),
                  Body1(),
                ],
              ),
              // Body2(),
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget _Header(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 800,
    color: Color(MyColors.color6),
    child: SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            constraints: BoxConstraints(maxWidth: 1232.0),
            child: Row(
              children: [
                Container(
                  // child: Image.asset(
                  //   'lib/assets/pics/ells_logo_4_1.png',
                  //   color: Colors.white,
                  // ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      'ELLS',
                      style: TextStyle(
                        letterSpacing: 3,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      
                    ),
                  ),
                  width: 100,
                  height: 100,
                ),
                Spacer(flex: 2),
                WebMenu(),
                Spacer(),
                Register_Button(title: 'Join Now ', context: context),
                SizedBox(width: 20),
                Login_Button(title: 'Sign In', context: context),
              ],
            ),
          ),
          SizedBox(height: 20.0 * 2),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Welcome to your professional enterprise community',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          SizedBox(height: 8),
          Container(color: Color(MyColors.color8), height: 2, width: 700),
        ],
      ),
    ),
  );
}

class Body1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 300),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 280,
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "our best people  ,",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "don't just ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      "fit",
                      style: TextStyle(
                        color: Color(MyColors.color8),
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "our culture",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "they ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      "further",
                      style: TextStyle(
                        color: Color(MyColors.color8),
                        fontSize: 35,
                      ),
                    ),
                    Text(
                      " it  .",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 450,
            width: 400,
            color: Color(MyColors.color6),
            child: Image.asset(
              'lib/assets/pics/People family.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class Body2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 100),
      width: double.infinity,
      height: 800,
      color: Color(MyColors.color6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _Body2_Sections(
              width: 500,
              height: 300,
              image: 'lib/assets/pics/gg.jfif',
              isRight: false,
              title: 'Share and help your enterprise',
              isRightTextPadding: false),
          _Body2_Sections(
              width: 600,
              height: 400,
              image: 'lib/assets/pics/illustrator - Copy.png',
              isRight: true,
              title: 'Connect with all over your enterprise',
              isRightTextPadding: true),
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget _Body2_Sections({
  @required String title,
  @required double width,
  @required double height,
  @required String image,
  @required bool isRight,
  @required bool isRightTextPadding,
}) {
  return Column(
    children: [
      Container(
        width: width,
        height: height,
        child: Padding(
          padding: isRight
              ? EdgeInsets.only(right: 150)
              : EdgeInsets.only(left: 150),
          child: Image.asset(image, fit: BoxFit.cover),
        ),
      ),
      SizedBox(height: 40),
      Padding(
        padding: isRightTextPadding
            ? EdgeInsets.only(right: 100)
            : EdgeInsets.only(left: 100),
        child: Text(
          title,
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
      )
    ],
  );
}

Widget Register_Button({String title, BuildContext context}) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pushNamed(FirstJoiningScreen.routeName);
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      height: 30,
      width: 100,
      child: Center(
          child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 17),
      )),
    ),
  );
}

Widget Login_Button({String title, BuildContext context}) {
  return RaisedButton(
    onPressed: () {
      Navigator.of(context).pushNamed(LoginScreen.routeNmae);
    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    color: Colors.white,
    child: Container(
      height: 40,
      width: 150,
      child: Center(
          child:
              Text(title, style: TextStyle(color: Colors.black, fontSize: 15))),
    ),
  );
}
