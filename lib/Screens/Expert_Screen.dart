import 'package:flutter/material.dart';
import 'package:graduation/Components/ExpertScreen_Components/Expertpage1.dart';
import 'package:graduation/Components/ExpertScreen_Components/atThe_top_ExpertPage1.dart';
import 'package:graduation/Components/Left_Side_Custom_Drawer/collapsing_navigation_drawer.dart';
import 'package:graduation/Components/Search_Bar_Components/SearchBar.dart';
import 'package:graduation/Components/Top_Navigation_Bar.dart';

class ExpertScreen extends StatelessWidget {
  static String routeName = '/expert_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: CollapsingNavigationDrawer()),
      body: Stack(
        children: [
          Column(
            children: [
              TopNavigationBar(),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.topCenter,
                child: AtTheTop1(),
              ),
              Expanded(
                child: ExpertPage1(),
              ),
            ],
          ),
          SearchBarUI(),
        ],
      ),
    );
  }
}
