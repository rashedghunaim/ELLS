import 'package:flutter/material.dart';
import 'package:graduation/Components/Left_Side_Custom_Drawer/collapsing_navigation_drawer.dart';
import 'package:graduation/Components/Profile_Screen_Components/ProfileScreen_Body_Content.dart';
import 'package:graduation/Components/Search_Bar_Components/SearchBar.dart';
import 'package:graduation/Components/Top_Navigation_Bar.dart';
import 'package:graduation/Custom_Config/Theme.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/UserProfile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(MyColors.black),
      drawer: Drawer(child: CollapsingNavigationDrawer()),
      body: Stack(
        children: [
          Column(
            children: [
              TopNavigationBar(),
              Expanded(
                child: ProfileScreenBodyContent(),
              ),
            ],
          ),
          SearchBarUI(),
        ],
      ),
    );
  }
}
