import 'package:flutter/material.dart';
import 'package:graduation/Custom_Config/Theme.dart';
import 'package:graduation/Screens/Home_Screen.dart';
import 'package:graduation/Screens/User_Profile_Screen.dart';
import 'package:graduation/Screens/testImage_screen.dart';
import 'Filter_Chip.dart';

// ignore: must_be_immutable
class TopNavigationBar extends StatelessWidget {
  bool isDropDown = false;

  String value;

  final List<String> filter = [
    'All',
    'Im In',
    'Financial',
    'Marketing',
  ];

  // ignore: non_constant_identifier_names
  void _ProfileScreenNavigation({context}) {
    Navigator.of(context).pushNamed(ProfileScreen.routeName);
  }

// ignore: non_constant_identifier_names
  void _HomeScreenNavigation({context}) {
    Navigator.of(context).pushNamed(HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 60,
          child: AppBar(
            title: Text(
              'ELLS',
              textAlign: TextAlign.right,
              
            ),
            backgroundColor: Color(MyColors.black),
            actions: [
              Row(
                children: [
                  IconButton(
                      icon: Icon(MyIcons.chating, size: 20), onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.notifications, size: 20),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return TestImageScreen();
                        }));
                      }),
                  IconButton(
                      icon: Icon(MyIcons.account, size: 20),
                      onPressed: () {
                        return _ProfileScreenNavigation(context: context);
                      }),
                  SizedBox(width: 20),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: 290,
          child: Container(
            padding: EdgeInsets.only(top: 6),
            child: IconButton(
              icon: Icon(MyIcons.home, size: 32, color: Colors.white),
              onPressed: () {
                return _HomeScreenNavigation(context: context);
              },
            ),
          ),
        ),
        Positioned(
          left: 1150,
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: _TragetedSections(),
          ),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget _TragetedSections() {
    return DropdownButton(
      iconEnabledColor: Colors.white,
      underline: Container(
        child: Icon(
          MyIcons.chartpie,
          color: Colors.white,
          size: 40,
        ),
      ),
      value: value,
      onChanged: (newValue) {
        return value = newValue;
      },
      items: filter.map((e) {
        return DropdownMenuItem(
          value: e,
          child: FilterChipWidget(shipName: e),
          onTap: () {},
        );
      }).toList(),
    );
  }
}
