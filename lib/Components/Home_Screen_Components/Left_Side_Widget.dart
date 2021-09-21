import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation/Components/common.dart';
import 'package:graduation/Custom_Config/Theme.dart';
import 'package:graduation/Dummy_Data/Fake_Respositery.dart';
import 'package:graduation/Screens/User_Profile_Screen.dart';
import 'package:graduation/models/Group_Model.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LeftSideWidget extends StatefulWidget {
  final SizingInformation sizingInformation;
  final double height;
  final String user;
  final String specialty;

  LeftSideWidget(
      {this.sizingInformation, this.height, this.user, this.specialty});

  @override
  _LeftSideWidgetState createState() => _LeftSideWidgetState();
}

class _LeftSideWidgetState extends State<LeftSideWidget> {
  bool _isHover = false;
  @override
  void initState() {
    super.initState();
    print("Check");
    print(widget.user);
    print('specialty check ${widget.specialty}');
  }

  @override
  Widget build(BuildContext context) {
    final _postData = FakeRepository.userProfile;
    return Expanded(
      child: Container(
        // color: Colors.red,
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
                      SizedBox(height: 60),
                      Container(
                        //height: 400,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return _ExpandedListTile(
                                groupModel: FakeRepository.recentData[index]);
                          },
                          itemCount: FakeRepository.recentData.length,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 0.50, color: Colors.black),
                      Container(
                        width: 200,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Discover more'),
                        ),
                      ),
                      SizedBox(height: 15),
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
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
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
                          Radius.circular(50),
                        ),
                        child: Image.asset('lib/assets/pics/RashedGhunaim.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(widget.user != null ? "${widget.user}" : "",
                      style: MyTextStyles.DefaultHeaderTextStyle2),
                  Divider(thickness: 0.3, color: Colors.white60),
                  Text(
                    widget.specialty.toString(),
                    style: MyTextStyles.DefaultHeadLineTextStyle,
                  ),
                  SizedBox(height: 80),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(ProfileScreen.routeName);
                    },
                    onHover: (value) {
                      setState(() {
                        _isHover = value;
                      });
                    },
                    child: Container(
                      child: Text(
                        'View dashboard',
                        style: TextStyle(
                          fontSize: 14,
                          color: textHoverColor(
                              color: Colors.blue,
                              color2: Colors.white60,
                              isHover: _isHover),
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

class _ExpandedListTile extends StatelessWidget {
  final GroupModel groupModel;

  _ExpandedListTile({this.groupModel});

  @override
  Widget build(BuildContext context) {
    return _buildTiles(groupModel);
  }
}

Widget _buildTiles(GroupModel groupModel) {
  if (groupModel.children.isEmpty) {
    return ListTile(
      title: Text(groupModel.title,
          style: TextStyle(fontSize: 12, color: Colors.white60)),
      leading: Icon(
        FontAwesomeIcons.userFriends,
        color: Colors.blue,
      ),
    );
  } else {
    return Theme(
      data: ThemeData(dividerColor: Colors.transparent),
      child: ExpansionTile(
        initiallyExpanded: true,
        key: PageStorageKey<GroupModel>(groupModel),
        title: Text(groupModel.title,
            style: TextStyle(
                fontSize: 16,
                color: Colors.white60,
                fontWeight: FontWeight.bold)),
        children: groupModel.children.map<Widget>(_buildTiles).toList(),
      ),
    );
  }
}
