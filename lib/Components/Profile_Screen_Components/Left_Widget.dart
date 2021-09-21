import 'package:flutter/material.dart';
import 'package:graduation/Components/common.dart';
import 'package:graduation/Custom_Config/Theme.dart';
import 'package:graduation/Dummy_Data/Fake_Respositery.dart';

class ProfileLeftSideWidget extends StatefulWidget {
  final double height;
  final double height2;
  ProfileLeftSideWidget({this.height, this.height2});

  @override
  _ProfileLeftSideWidgetState createState() => _ProfileLeftSideWidgetState();
}

class _ProfileLeftSideWidgetState extends State<ProfileLeftSideWidget> {
  bool isHover = false;
  bool isHover2 = false;
  bool isHover3 = false;
  bool isHover4 = false;
  bool isHover5 = false;
  bool _isHover6 = false;
  bool _isHover7 = false;
  @override
  Widget build(BuildContext context) {
    final _postData = FakeRepository.userProfile;
    return Expanded(
      child: Container(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 50),
                Container(
                  height: widget.height,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    color: Color(MyColors.TodayMostViwed),
                  ),
                  child: Column(
                    children: [],
                  ),
                ),
              ],
            ),
            Container(
              height: widget.height2,
              width: 300,
              decoration: BoxDecoration(
                color: Color(MyColors.black),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                border: Border.all(color: Colors.blue, width: 0.7),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Your Dashboard',
                    style: TextStyle(
                        color: Colors.white, fontSize: 20, letterSpacing: 1),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Private to you ',
                    style: TextStyle(
                        color: Color(MyColors.LatestSharedNearYou),
                        fontSize: 14),
                  ),
                  SizedBox(height: 30),
                  CustomDivider(thikness: 0.5, color: Colors.blue),
                  InkWell(
                    onTap: () {},
                    onHover: (value) {
                      setState(() {
                        isHover = value;
                      });
                    },
                    child: _DashBoardComponents(
                      sizedBoxHeight: 30,
                      leftPadding: 26,
                      text: 'Who viewed your profile',
                      number: 12,
                      textColor: textHoverColor(
                          color: Colors.blue,
                          color2: Colors.white60,
                          isHover: isHover),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    onHover: (value) {
                      setState(() {
                        isHover3 = value;
                      });
                    },
                    child: _DashBoardComponents(
                        sizedBoxHeight: 30,
                        text: 'Saved items',
                        number: 7,
                        textColor: textHoverColor(
                            color: Colors.blue,
                            color2: Colors.white60,
                            isHover: isHover3)),
                  ),
                  InkWell(
                    onTap: () {},
                    onHover: (value) {
                      setState(() {
                        isHover5 = value;
                      });
                    },
                    autofocus: true,
                    child: _DashBoardComponents(
                        sizedBoxHeight: 30,
                        text: 'Interests',
                        number: 22,
                        textColor: textHoverColor(
                            color: Colors.blue,
                            color2: Colors.white60,
                            isHover: isHover5)),
                  ),
                  InkWell(
                    onTap: () {},
                    onHover: (value) {
                      setState(() {
                        _isHover7 = value;
                      });
                    },
                    autofocus: true,
                    child: _DashBoardComponents(
                        sizedBoxHeight: 30,
                        text: 'Rated by',
                        number: 0,
                        textColor: textHoverColor(
                            color: Colors.blue,
                            color2: Colors.white60,
                            isHover: _isHover7)),
                  ),
                  SizedBox(height: 60),
                  InkWell(
                    onTap: () {},
                    onHover: (value) {
                      setState(() {
                        _isHover6 = value;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'See all ',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                        _isHover6
                            ? Container(
                                width: 90, height: 1, color: Colors.blue)
                            : Container(
                                width: 100,
                                height: 1,
                                color: Colors.transparent),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _DashBoardComponents(
      {double sizedBoxHeight,
      double leftPadding,
      double sizedBoxWidth,
      double rightPadding,
      String text,
      int number,
      Color textColor}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: sizedBoxHeight),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 0.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      wordSpacing: 3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: sizedBoxHeight),
                Padding(
                  padding: EdgeInsets.only(left: 0.0, right: 15),
                  child: Text(
                    number.toString(),
                    style: TextStyle(fontSize: 15, color: textColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
