import 'package:flutter/material.dart';
import 'package:graduation/Custom_Config/Theme.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RightSideWidget extends StatefulWidget {
  final SizingInformation sizingInformation;
  final double height;

  RightSideWidget({this.sizingInformation, this.height});

  @override
  _RightSideWidgetState createState() => _RightSideWidgetState();
}

class _RightSideWidgetState extends State<RightSideWidget> {
  bool _isHover;

  Color _textHoverColor() {
    if (_isHover == true) {
      return Colors.blue;
    } else {
      return Colors.white60;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 250),
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
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: ExpansionTile(
                          //tilePadding: EdgeInsets.only(left: 10),
                          title: Text(
                            "Latest shared ",
                            style: MyTextStyles.DefaultHeaderTextStyle2,
                          ),
                          children: [
                            Container(
                              height: 200,
                              color: Colors.red,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0.0),
                        child: ExpansionTile(
                          //tilePadding: EdgeInsets.only(left: 10),
                          title: Text(
                            "Business Services",
                            style: MyTextStyles.DefaultHeaderTextStyle2,
                          ),
                          children: [
                            Container(
                              color: Colors.green,
                              height: 200,
                              child: Column(
                                children: [
                                  Row(
                                    children: [],
                                  ),
                                  Container(
                                    child: Text(
                                      'See more ',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Color(MyColors.black),
                borderRadius: BorderRadius.all(Radius.circular(30)),
                border: Border.all(color: Colors.blue, width: 0.7),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text("Top rated near you",
                      style: MyTextStyles.DefaultHeaderTextStyle2),
                  SizedBox(height: 10),
                  Divider(
                    thickness: 0.3,
                    color: Colors.white60,
                  ),
                  SizedBox(height: 200),
                  InkWell(
                    onTap: () {},
                    onHover: (value) {
                      setState(() {
                        _isHover = value;
                      });
                    },
                    child: Container(
                      child: Text(
                        'See more ',
                        style: TextStyle(
                          fontSize: 14,
                          color: _textHoverColor(),
                        ),
                      ),
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
}
