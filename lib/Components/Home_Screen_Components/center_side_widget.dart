import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graduation/Components/Home_Screen_Components/Single_Post_Item_Widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../Creat_Post_Components/Create_Post_Widget.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Sort_By_Widget.dart';

class CenterSideWidget extends StatefulWidget {
  final SizingInformation sizingInformation;
  final String employeeSpecialty;

  CenterSideWidget({this.sizingInformation, this.employeeSpecialty});

  @override
  _CenterSideWidgetState createState() => _CenterSideWidgetState();
}

class _CenterSideWidgetState extends State<CenterSideWidget> {
  var postId;
  List<dynamic> postsData = [];
  List<dynamic> postsData2 = [];
  void getPostAprroved() async {
    try {
      var response = await Dio().get("http://localhost:8080/ApprovedPost",
          options: Options(
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          ));

      postsData = response.data;
      postId = response.data['id'];
    } catch (err) {
      print(err);
    }
  }

  void checkData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("check data functions");
    try {
      postsData2 = preferences.getStringList('postdata');
      print(
        preferences.getStringList('postdata'),
      );
    } catch (error) {
      print("Data Not Saved $error");
    }
  }

  @override
  void initState() {
    super.initState();
    getPostAprroved();
    checkData();
  }

  int index = 10;
  bool isLoadMore = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      child: Column(
        children: [
          isLoadMore
              ? Container(
                  width: 100,
                  height: 100,
                  color: Colors.transparent,
                  child: Image.asset(
                    'lib/assets/pics/Loading Gif.gif',
                  ),
                )
              : Column(
                  children: [
                    SizedBox(height: 50),
                    CreatePost(),
                    SizedBox(height: 100),
                    sortBy(),
                    SizedBox(height: 55),
                    listOfPostWidget(),
                    SizedBox(height: 60),
                    _loadMoreBottomWidget(),
                    SizedBox(height: 30),
                  ],
                ),
        ],
      ),
    );
  }

  Widget listOfPostWidget() {
    return postsData.isEmpty
        ? Center(
            child: Container(
              height: 700,
              width: double.infinity,
              child: Text(
                'no recent posts yet ',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        : ListView.builder(
            reverse: true,
            itemBuilder: (context, index) {
              return SinglePostItem(
                index: index,
                userData: postsData,
              );
            },
            itemCount: postsData.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
          );
  }

  Widget _loadMoreBottomWidget() {
    return SizedBox(
      width: 200,
      child: RaisedButton(
        onPressed: () {
          setState(() {
            isLoadMore = true;
          });

          Future.delayed(Duration(seconds: 3), () {
            setState(() {
              isLoadMore = false;
            });
          });
        },
        color: Colors.blue,
        child: Text(
          'load more',
          style: TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 17),
      ),
    );
  }
}
