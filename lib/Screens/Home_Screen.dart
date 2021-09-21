import 'package:flutter/material.dart';
import 'package:graduation/Components/Home_Screen_Components/HomeScreen_Body_content.dart';
import 'package:graduation/Components/Left_Side_Custom_Drawer/collapsing_navigation_drawer.dart';
import 'package:graduation/Components/Search_Bar_Components/SearchBar.dart';
import 'package:graduation/Components/Top_Navigation_Bar.dart';
import 'package:graduation/Custom_Config/Theme.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(MyColors.black),
      drawer: Drawer(
        child: CollapsingNavigationDrawer(),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              TopNavigationBar(),
              Expanded(
                child: HomeScreenBodyContent(),
              ),
            ],
          ),
          SearchBarUI(),
        ],
      ),
    );
  }
}
