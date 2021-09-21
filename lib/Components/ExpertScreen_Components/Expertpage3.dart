import 'package:flutter/material.dart';
import 'package:graduation/Components/ExpertScreen_Components/ExpertPage3_Body_Content.dart';
import 'package:graduation/Components/Left_Side_Custom_Drawer/collapsing_navigation_drawer.dart';
import 'package:graduation/Components/Search_Bar_Components/SearchBar.dart';
import '../Top_Navigation_Bar.dart';

class ExpertPage3 extends StatelessWidget {
  static String rouneName = '/ExpertPage3';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    return Scaffold(
      drawer: Drawer(child: CollapsingNavigationDrawer()),
      body: Stack(
        children: [
          Column(
            children: [
              TopNavigationBar(),
              ExpertPage3BodyContent(
                userId: args['userId'],
              ),
            ],
          ),
          SearchBarUI(),
        ],
      ),
    );
  }
}
