import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduation/Custom_Config/Theme.dart';
import 'package:graduation/Dummy_Data/Fake_Respositery.dart';

class ViewPostRightSide extends StatefulWidget {
  final double height;
  final double height2;
  String feedback;
  final List<dynamic> expertName;

  ViewPostRightSide({this.height, this.height2, this.expertName});

  @override
  _ViewPostRightSideState createState() => _ViewPostRightSideState();
}

class _ViewPostRightSideState extends State<ViewPostRightSide> {
  String expertFeedback;
  void getFeedback() async {
    var response = await Dio().get("http://localhost:8080/getExpertWithUser",
        options: Options(
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        ));
    if (response.statusCode == 200)
      setState(() {
        expertFeedback = response.data["feedback"]["feedback"];
      });
    print(expertFeedback);
  }

  @override
  void initState() {
    getFeedback();
    super.initState();
  }

  final _expertsData = FakeRepository.expertsData;
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: widget.height,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Color(MyColors.color6),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 100),
                      Container(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return ExpansionTile(
                              title: Container(
                                child: Row(
                                  children: [
                                    Text(_expertsData[index].iD),
                                    SizedBox(width: 1),
                                    Text('.'),
                                    SizedBox(width: 15),
                                    Text(
                                      widget.expertName[index].toString(),
                                    ),
                                  ],
                                ),
                              ),
                              children: [
                                SizedBox(height: 20),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    expertFeedback.toString(),
                                    style: TextStyle(color: Colors.white60),
                                  ),
                                ),
                              ],
                            );
                          },
                          itemCount: widget.expertName.length,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                        ),
                      ),
                    ],
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
                  Radius.circular(15),
                ),
                // border: Border.all(color: Colors.blue, width: 0.6),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 55),
                child: Container(
                  child: Row(
                    children: [
                      Icon(MyIcons.rating, color: Colors.white, size: 32),
                      SizedBox(width: 30),
                      Text(
                        'Experts point of view',
                        style: MyTextStyles.DefaultHeadLineTextStyle2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
