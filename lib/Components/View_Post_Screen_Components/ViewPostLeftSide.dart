import 'package:flutter/material.dart';
import 'package:graduation/Custom_Config/Theme.dart';

class ViewPostLeftSide extends StatefulWidget {
  final int index;
  final List<dynamic> userData;
  final List<dynamic> expertName;
  final double height;
  final double height2;
  ViewPostLeftSide(
      {this.height, this.height2, this.expertName, this.index, this.userData});

  @override
  _ViewPostLeftSideState createState() => _ViewPostLeftSideState();
}

class _ViewPostLeftSideState extends State<ViewPostLeftSide> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.blue, width: 0.7),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: widget.height,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    color: Color(MyColors.color6),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 120),
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 115),
                            child: Container(
                              height: 300,
                              width: 0.7,
                              color: Colors.black,
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10, right: 30),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'composer',
                                            style: TextStyle(
                                                color: Colors.white60),
                                          ),
                                          SizedBox(width: 65),
                                          Text(
                                            widget.userData[widget.index]
                                                ['fullname'],
                                            style: TextStyle(
                                                color: Colors.white60),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Container(
                                        width: double.infinity,
                                        color: Colors.black,
                                        height: 0.7,
                                      ),
                                      SizedBox(height: 25),
                                      Row(
                                        children: [
                                          Text(
                                            'idea type',
                                            style: TextStyle(
                                                color: Colors.white60),
                                          ),
                                          SizedBox(width: 65),
                                          Text(
                                            widget.userData[widget.index]
                                                ['type_idea'],
                                            style: TextStyle(
                                                color: Colors.white60),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Container(
                                        width: double.infinity,
                                        color: Colors.black,
                                        height: 0.7,
                                      ),
                                      SizedBox(height: 25),
                                      Row(
                                        children: [
                                          Text(
                                            'Experts Rate',
                                            style: TextStyle(
                                                color: Colors.white60),
                                          ),
                                          SizedBox(width: 45),
                                          Container(
                                            child: Row(
                                              children: [
                                                SizedBox(width: 4),
                                                Text(
                                                  widget.userData[widget.index]
                                                      ['rated'],
                                                  style: TextStyle(
                                                      color: Colors.white60),
                                                ),
                                                Text(
                                                  '/ 10',
                                                  style: TextStyle(
                                                      color: Colors.white60),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Container(
                                        width: double.infinity,
                                        color: Colors.black,
                                        height: 0.7,
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Text(
                                            'speciality',
                                            style: TextStyle(
                                                color: Colors.white60),
                                          ),
                                          SizedBox(width: 65),
                                          Text(
                                            widget.userData[widget.index]
                                                ['rank'],
                                            style: TextStyle(
                                                color: Colors.white60),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: double.infinity,
                                color: Colors.black,
                                height: 0.7,
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: EdgeInsets.only(left: 10, right: 30),
                                child: Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        'beneficiaries',
                                        style: TextStyle(color: Colors.white60),
                                      ),
                                      SizedBox(width: 43),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.userData[widget.index][
                                                          'category_Finacial'] ==
                                                      ""
                                                  ? ""
                                                  : widget.userData[
                                                          widget.index]
                                                      ['category_Finacial'],
                                              style: TextStyle(
                                                  color: Colors.white60),
                                            ),
                                            SizedBox(height: 6),
                                            Text(
                                              widget.userData[widget.index][
                                                          'category_Markting'] ==
                                                      ""
                                                  ? ""
                                                  : widget.userData[
                                                          widget.index]
                                                      ['category_Markting'],
                                              style: TextStyle(
                                                  color: Colors.white60),
                                            ),
                                            SizedBox(height: 7),
                                            Text(
                                              widget.userData[widget.index]
                                                          ['category_IT'] ==
                                                      ""
                                                  ? ""
                                                  : widget.userData[widget
                                                      .index]['category_IT'],
                                              style: TextStyle(
                                                  color: Colors.white60),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 23),
                      SizedBox(height: 100),
                      Container(
                        height: 70,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Color(MyColors.black),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          // border: Border.all(color: Colors.blue, width: 0.7),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 15, left: 50),
                              child: Row(
                                children: [
                                  Icon(MyIcons.related,
                                      color: Colors.white, size: 32),
                                  SizedBox(width: 30),
                                  Text(
                                    'Related Feed',
                                    style:
                                        MyTextStyles.DefaultHeadLineTextStyle2,
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
              height: 70,
              width: 300,
              decoration: BoxDecoration(
                color: Color(MyColors.black),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                // border: Border.all(color: Colors.blue, width: 0.7),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 15, left: 50),
                    child: Row(
                      children: [
                        Icon(MyIcons.PostDetails,
                            color: Colors.white, size: 32),
                        SizedBox(width: 30),
                        Text(
                          'Idea specifics',
                          style: MyTextStyles.DefaultHeadLineTextStyle2,
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
    );
  }
}
