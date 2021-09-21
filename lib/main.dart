import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:graduation/Components/ExpertScreen_Components/Expertpage2.dart';
import 'package:graduation/Components/ExpertScreen_Components/Expertpage3.dart';
import 'package:graduation/Screens/Expert_Screen.dart';
import 'package:graduation/Screens/First_Joining_Screen.dart';
import 'package:graduation/Screens/Login_Screen.dart';
import 'package:graduation/Screens/Second_Joining_Screen.dart';
import 'package:graduation/Screens/User_Profile_Screen.dart';
import 'package:graduation/Screens/View_Post_Screen.dart';
import 'Screens/Home_Screen.dart';
import 'Screens/OnBoarding_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Graduation',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
      routes: {
        ProfileScreen.routeName: (BuildContext context) =>
            ProfileScreen(), // Navigation from Top_Navigation_Bar(Account Icon)

        HomeScreen.routeName: (BuildContext context) =>
            HomeScreen(), // Navigation from Top_Navigation_Bar(Home Icon)

        ViewPostScreen.routeName: (context) =>
            ViewPostScreen(), // Navigation from HomeScreen(PostBody)

        LoginScreen.routeNmae: (context) => LoginScreen(),
        FirstJoiningScreen.routeName: (context) => FirstJoiningScreen(),
        SecondJoiningScreen.routeName: (context) => SecondJoiningScreen(),

        ExpertPage2.routeName: (context) {
          return ExpertPage2(); // navigation from expertPage1();
        },

        ExpertPage3.rouneName: (context) =>
            ExpertPage3(), //Navigation from expertPage2

        ExpertScreen.routeName: (context) {
          return ExpertScreen(); // Navigation From the drawer,
        },
        OnBoardingScreen.routeName: (context) {
          return OnBoardingScreen();
        }
      },
    );
  }
}
