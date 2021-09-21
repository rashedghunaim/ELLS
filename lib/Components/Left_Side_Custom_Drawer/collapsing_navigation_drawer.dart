import 'package:flutter/material.dart';
import 'package:graduation/Custom_Config/Theme.dart';
import 'package:graduation/Dummy_Data/Fake_Respositery.dart';
import 'package:graduation/Screens/Expert_Screen.dart';
import 'package:graduation/Screens/OnBoarding_Screen.dart';
import 'package:graduation/models/navigation_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Collapsing_List_Tile_Header.dart';
import 'collapsing_list_tile_body.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  CollapsingNavigationDrawerState createState() {
    return new CollapsingNavigationDrawerState();
  }
}

class CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 250;
  double minWidth = 70;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int currentSelectedIndex = 0;

  CollapsingNavigationDrawerState();

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget),
    );
  }

  void handleTypeRoute() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userType = prefs.getString('premission');
    print(userType);
    if (userType == "1") {
      Navigator.of(context).pushNamed(ExpertScreen.routeName);
    } else if (userType == "0") {
      showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            child: Container(
              child: Text('sorry , you are an employee '),
            ),
          );
        },
      );
    }
  }

  Widget getWidget(context, widget) {
    final _userData = FakeRepository.userProfile;
    return Padding(
      padding: EdgeInsets.only(top: 0.0),
      child: Material(
        elevation: 80.0,
        child: Container(
          width: widthAnimation.value,
          color: Color(MyColors.color6),
          child: Column(
            children: <Widget>[
              CollapsingListTileHeader(
                title: _userData.name,
                icon: MyIcons.account,
                animationController: _animationController,
                onTap: () {},
                isSelected: false,
              ),
              Divider(
                color: Colors.grey,
                height: 40.0,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, counter) {
                    return Divider(height: 12.0);
                  },
                  itemBuilder: (context, index) {
                    return CollapsingListTileBody(
                      onTap: () {
                        handleTypeRoute();
                        setState(() {
                          currentSelectedIndex = index;
                        });
                      },
                      isSelected: currentSelectedIndex == index,
                      title: navigationItems[index].title,
                      icon: navigationItems[index].icon,
                      animationController: _animationController,
                    );
                  },
                  itemCount: navigationItems.length,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.logout,
                      color: Colors.white60,
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(OnBoardingScreen.routeName);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
