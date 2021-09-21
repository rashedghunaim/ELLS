import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graduation/Components/ExpertScreen_Components/atThe_End_expertpage2.dart';
import 'package:graduation/Components/ExpertScreen_Components/atThe_top_ExpertPage2.dart';
import 'package:graduation/Components/Left_Side_Custom_Drawer/collapsing_navigation_drawer.dart';
import 'package:graduation/Components/Search_Bar_Components/SearchBar.dart';
import 'package:graduation/Custom_Config/Theme.dart';
import '../Top_Navigation_Bar.dart';

class ExpertPage2 extends StatefulWidget {
  static String routeName = '/expertScreen2 ';

  @override
  _ExpertPage2State createState() => _ExpertPage2State();
}

class _ExpertPage2State extends State<ExpertPage2> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    print("Arrgument parmas form routers");
    print(args['descreption']);
    print(args['username']);
    print(args['plan']);
    List title = args['title'];
    int indexx = args['index'];
    return Scaffold(
      backgroundColor: Color(MyColors.SoftBeach),
      drawer: Drawer(child: CollapsingNavigationDrawer()),
      body: Stack(
        children: [
          Column(
            children: [
              TopNavigationBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AtTheTop2Widget(
                        userName: '${args['username']}',
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: 800,
                        height: 630,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white60,
                          border: Border.all(color: Colors.black),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      'title  : ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Text('${title[indexx]["title"]}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 15),
                              Divider(
                                color: Colors.black,
                                thickness: 0.7,
                                endIndent: 14,
                                height: 10,
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: double.infinity,
                                height: 200,
                                child: Text(
                                  '${args['descreption']}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 50),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: double.infinity,
                                  child: Image.asset(
                                    'lib/assets/pics/climate change.jfif',
                                    height: 250,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      args['plan'] != null
                          ? Container(
                              width: 800,
                              height: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white60,
                                border: Border.all(color: Colors.black),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Implementation plan',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Divider(
                                      color: Colors.black,
                                      thickness: 0.7,
                                      endIndent: 14,
                                      height: 10,
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      '${args['plan']}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                      SizedBox(height: 50),
                      AtheEndExpertPage2(
                        userId: args['uid'],
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SearchBarUI(),
        ],
      ),
    );
  }
}
