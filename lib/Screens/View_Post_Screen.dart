import 'package:flutter/material.dart';
import 'package:graduation/Components/Home_Screen_Components/Messiging_Button_Widget.dart';
import 'package:graduation/Components/Home_Screen_Components/Post_Header_Widget.dart';
import 'package:graduation/Components/Left_Side_Custom_Drawer/collapsing_navigation_drawer.dart';
import 'package:graduation/Components/Search_Bar_Components/SearchBar.dart';
import 'package:graduation/Components/Top_Navigation_Bar.dart';
import 'package:graduation/Components/View_Post_Screen_Components/ViewPostBody.dart';
import 'package:graduation/Components/View_Post_Screen_Components/ViewPostLeftSide.dart';
import 'package:graduation/Components/View_Post_Screen_Components/ViewPostRightSide.dart';
import 'package:graduation/Custom_Config/Theme.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewPostScreen extends StatefulWidget {
  static String routeName = '/ViewPostScreen';

  @override
  _ViewPostScreenState createState() => _ViewPostScreenState();
}

class _ViewPostScreenState extends State<ViewPostScreen> {
  List<dynamic> expertName = [];
  String expertFeedBack;

  void getPositiveFeedBack() async {
    SharedPreferences prefss = await SharedPreferences.getInstance();
    expertFeedBack = prefss.getString('positiveFeedback');
  }

  void getApiViewPost() async {
    try {
      var response = await Dio().get("http://localhost:8080/getExpertWithUser",
          options: Options(
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          ));
      var res = response.data;
      setState(() {
        expertName.add(res['expertname']['fullname']);
      });
      print(res);
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    getApiViewPost();
    getPositiveFeedBack();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    var index = args['index'];
    var userData = args['userData'];
    List comments = args['commentsList'];

    return Scaffold(
      backgroundColor: Color(MyColors.black),
      drawer: Drawer(child: CollapsingNavigationDrawer()),
      body: Stack(
        children: [
          Column(
            children: [
              TopNavigationBar(),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Positioned(
                            top: 0.0,
                            right: 0.0,
                            left: 0.0,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: SingleChildScrollView(
                                child: ViewPostLeftSide(
                                    index: index,
                                        userData: userData,
                                  expertName: expertName,
                                  height: 900,
                                  height2: 300,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0.0,
                            right: 0.0,
                            left: 0.0,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: SingleChildScrollView(
                                child: Container(
                                  width: 800,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 30),
                                      PostHeader(
                                        index: index,
                                        userData: userData,
                                      ),
                                      ViewPostBody(
                                        comments: comments,
                                        index: index,
                                        userData: userData,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0.0,
                            right: 0.0,
                            left: 0.0,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: SingleChildScrollView(
                                child: ViewPostRightSide(
                                    
                                  expertName: expertName,
                                    height: 600, height2: 70),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: MessagingButtonWidget(),
                      ),
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
