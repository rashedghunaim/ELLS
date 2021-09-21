import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/Components/common.dart';
import 'package:graduation/Custom_Config/Theme.dart';
import 'package:graduation/Dummy_Data/Fake_Respositery.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileCenterSideWidget extends StatefulWidget {
  final String expertName;
  final String expertRejectFeedBack;
  ProfileCenterSideWidget({
    this.expertName,
    this.expertRejectFeedBack,
  });
  @override
  _ProfileCenterSideWidgetState createState() =>
      _ProfileCenterSideWidgetState();
}

class _ProfileCenterSideWidgetState extends State<ProfileCenterSideWidget> {
  String rejected;
  String specialty;
  String branch;
  String department;
  String countryRegion;
  String employeeUserName;
  void getuserName() async {
    var response = await Dio().get("http://localhost:8080/RejectedPrfoile",
        options: Options(
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        ));
    var res = response.data;
    print("rejected ffed$res");
    // your varaibles = reject_feedback
    setState(() {
      rejected = res['reject_feedback'];
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(
      () {
        employeeUserName = pref.getString('userName');
        specialty = pref.getString('specialty');
        branch = pref.getString('branch');
        countryRegion = pref.getString('countryRegion');
        department = pref.getString('department');
        print("Vailues from profie $department");
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getuserName();
  }

  Image image;
  int indexx = 0;
  final userProfileData = FakeRepository.userProfileData;
  int index = 0;
  bool _isHover = false;
  bool _isHover2 = false;
  bool _isHover3 = false;
  bool _isHover4 = false;
  bool _isHover5 = false;
  bool _isHover6 = false;
  String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 500,
              width: 800,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 50, right: 50),
                    decoration: BoxDecoration(
                        color: Color(MyColors.LatestSharedNearYou),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    height: 200,
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {},
                        onHover: (value) {
                          setState(() {
                            _isHover3 = value;
                          });
                        },
                        child: Icon(
                          MyIcons.add,
                          color: textHoverColor(
                            color: Colors.white,
                            color2: Colors.black,
                            isHover: _isHover3,
                          ),
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                        border: Border.all(color: Colors.blue, width: 0.7)),
                    height: 300,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              child: _ProfileInfo(),
                            ),
                            _ProfileOpensTo(),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            _ProfilePhoto(),
          ],
        ),
        SizedBox(height: 20),
        _SecondContainer(widget.expertName.toString(),
            widget.expertRejectFeedBack.toString()),
        SizedBox(height: 20),
        _thirdConainer(),
        SizedBox(height: 70),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget _ProfileInfo() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 35),
            Text(
              employeeUserName,
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 0.0,
                  letterSpacing: 2),
            ),
            SizedBox(height: 30),
            Text(
              specialty,
              style: MyTextStyles.DefaultProfileTextStyle,
            ),
            SizedBox(height: 7),
            Text(department, style: MyTextStyles.DefaultProfileTextStyle),
            SizedBox(height: 7),
            Text(branch, style: MyTextStyles.DefaultProfileTextStyle),
            SizedBox(height: 7),
            Text(countryRegion, style: MyTextStyles.DefaultProfileTextStyle),
            SizedBox(height: 40),
            InkWell(
              onTap: () {},
              onHover: (value) {
                setState(() {
                  _isHover = value;
                });
              },
              child: Container(
                child: Column(
                  children: [
                    Text(
                      'Contact Info',
                      style: TextStyle(color: Colors.blue),
                    ),
                    _isHover
                        ? Container(
                            width: 90,
                            height: 1,
                            color: Colors.blue,
                          )
                        : Container(
                            width: 100,
                            height: 1,
                            color: Colors.transparent,
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 40, bottom: 200),
          child: InkWell(
            child: Icon(
              MyIcons.edit,
              size: 20,
              color: textHoverColor(
                  color: Colors.white,
                  color2: Colors.white54,
                  isHover: _isHover4),
            ),
            onTap: () {},
            onHover: (value) {
              setState(() {
                _isHover4 = value;
              });
            },
          ),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget _ProfileOpensTo() {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.0),
      child: InkWell(
        onTap: () {},
        onHover: (value) {
          setState(() {
            _isHover2 = value;
          });
        },
        child: Container(
          width: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: textHoverColor(
                  color: Colors.blue,
                  color2: Colors.white60,
                  isHover: _isHover2),
            ),
          ),
          child: ExpansionTile(
            title: Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Your profile open to ',
                style: TextStyle(
                    color: textHoverColor(
                        color: Colors.blue,
                        color2: Colors.white60,
                        isHover: _isHover2),
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            children: [
              Container(
                height: 230,
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: Text(
                        'All sections ',
                        style: TextStyle(color: Colors.white60, fontSize: 12),
                      ),
                    ),
                    Divider(color: Colors.white60, thickness: 0.4),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: Text(
                        'Experts only',
                        style: TextStyle(color: Colors.white60, fontSize: 12),
                      ),
                    ),
                    Divider(
                      color: Colors.white60,
                      thickness: 0.4,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: Text(
                        'Only sections im in ',
                        style: TextStyle(color: Colors.white60, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _ProfilePhoto() {
    return Padding(
      padding: EdgeInsets.only(left: 340, top: 100),
      child: Container(
        height: 150,
        width: 150,
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: Offset(1.0, 1.0),
                spreadRadius: 1,
                blurRadius: 1),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
          child: Image.asset('lib/assets/pics/RashedGhunaim.jpg'),
        ),
      ),
    );
  }

  Widget _SecondContainer(String expertName, String expertRejectFeedBack) {
    return Container(
      height: 200,
      width: 800,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.transparent,
        border: Border.all(color: Colors.blue, width: 0.7),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 70),
            child: Container(
              child: Row(
                children: [
                  expertName != null
                      ? Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Your post idea has not been viewed or rated',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'by the expert',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  expertName,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Reason : ',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  expertRejectFeedBack,
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _thirdConainer() {
    return Container(
      height: 200,
      width: 800,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.transparent,
        border: Border.all(color: Colors.blue, width: 0.7),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, right: 600),
            child: Text(
              rejected.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 50),
          Text(
            'Posts you have created, shared, or commented on in the last  90 days are displayed here.',
            style: TextStyle(fontSize: 13, color: Colors.white60),
          ),
          Divider(color: Colors.white60, thickness: 0.7),
          SizedBox(height: 20),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                _isHover6 = value;
              });
            },
            child: Container(
              child: Column(
                children: [
                  Text('See All Activities',
                      style: TextStyle(color: Colors.blue)),
                  _isHover6
                      ? Container(width: 120, height: 1, color: Colors.blue)
                      : Container(
                          width: 100, height: 1, color: Colors.transparent),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
