import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduation/Custom_Config/Theme.dart';
import 'package:graduation/Dummy_Data/Fake_Respositery.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormSecondSection extends StatefulWidget {
  final userId;
  FormSecondSection({this.userId});
  @override
  _FormSecondSectionState createState() => _FormSecondSectionState();
}

class _FormSecondSectionState extends State<FormSecondSection> {
  User selectedUser;
  List<User> users;
  String rate;
  void approvePost() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var expertid = prefs.getString("EXid");
    try {
      dynamic requestoptions = {
        "uid": widget.userId,
        "rate": rate,
        "expertid": expertid
      };
      var response = await Dio().post("http://localhost:8080/Approved",
          data: requestoptions,
          options: Options(
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          ));
      var res = response.data;
      print(res);
    } catch (err) {
      print(err);
    }
  }

  insertReject() async {
    String expid;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    expid = prefs.getString("EXid");
    dynamic requestoptions = {"exid": expid, "value": choosenValue9};
    var response = await Dio().post("http://localhost:8080/Createrejected",
        data: requestoptions,
        options: Options(
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        ));
    var res = response.data;
  }

  @override
  void initState() {
    super.initState();
    insertReject();
    users = User.getUser();
  }

  setSelectedUser(User user) {
    setState(() {
      selectedUser = user;
    });
  }

  List<Widget> getRadioListUsers() {
    List<Widget> widgets = [];
    for (User user in users) {
      widgets.add(
        Container(
          width: 88,
          height: 90,
          child: RadioListTile(
            autofocus: true,
            value: user,
            groupValue: selectedUser,
            title: Text(
              user.title,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onChanged: (currentUser) {
              print('current User ${currentUser.title}');
              setState(() {
                rate = currentUser.title;
              });
              setSelectedUser(currentUser);
            },
            selected: selectedUser == user,
          ),
        ),
      );
    }
    return widgets;
  }

  final List<String> filter = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10"
  ];
  String value;
  String title = "";

  void handelchange(newValue) {
    setState(() {
      value = newValue;
      title = newValue;
    });

    print(title);
  }

  final qusetionariesData = FakeRepository.qusetionariesData;

  String choosenValue9;

  int index = 0;
  final List<String> questionaries = ['yes', 'no '];
  final List<String> numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

  List<String> rejectedItems = [
    'It does not fall within the Aims and Scope.',
    "It's incomplete",
    "It's incomprehensible",
    "Writing is incomprehensible",
    ' Unclear hypothesis',
    'Lack of supporting evidence',
    ' Poor Analysis',
    'Wrong research methodology',
    'Unclear target audience',
    'Problems with language and style',
    'Incomplete introductions',
    ' weak or unreliable method',
    'Inappropriate or suboptimal instrumentation',
    'Failure to place the study in a broad context',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(MyColors.color6),
        borderRadius: BorderRadius.circular(7),
      ),
      height: 500,
      width: 1200,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: ExpansionTile(
                    childrenPadding: EdgeInsets.only(left: 70),
                    title: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Container(
                        height: 50,
                        child: Text(
                          'Approve the idea',
                          style: TextStyle(
                              color: Colors.white60,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    children: [
                      Container(
                        height: 300,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              children: getRadioListUsers(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 50),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'not too bad',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'neither strong nor week',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Strongly convenient',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 15, top: 100),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  child: SizedBox(
                                    width: 200,
                                    child: RaisedButton(
                                      onPressed: () {
                                        approvePost();
                                      },
                                      color: Colors.blue,
                                      child: Text(
                                        'Publish immedietly ',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 17),
                                    ),
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
                SizedBox(height: 100),
                ExpansionTile(
                  title: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Container(
                      height: 50,
                      child: Text(
                        'Reject the idea ',
                        style: TextStyle(
                            color: Colors.white60,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 650),
                            child: DropdownButton(
                              icon: Icon(
                                MyIcons.dropDown3,
                                size: 10,
                                color: Colors.white,
                              ),
                              hint: Container(
                                width: 80,
                                child: Text(
                                  'why ',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              underline: Container(
                                color: Colors.transparent,
                              ),
                              value: choosenValue9,
                              style: TextStyle(color: Colors.white),
                              onChanged: (newValue) {
                                setState(() {
                                  choosenValue9 = newValue;
                                  print(choosenValue9);
                                });
                              },
                              items: rejectedItems.map(
                                (e) {
                                  return DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        e,
                                        style: TextStyle(color: Colors.black),
                                      ));
                                },
                              ).toList(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15, top: 100),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                child: SizedBox(
                                  width: 200,
                                  child: RaisedButton(
                                    onPressed: () {
                                      insertReject();
                                    },
                                    color: Colors.blue,
                                    child: Text(
                                      'Reject ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 17),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class User {
  int id;
  String title;
  String subTitle;
  User({this.subTitle, this.id, this.title});

  static List<User> getUser() {
    return <User>[
      User(id: 1, title: '1', subTitle: 'Strongly Recommended'),
      User(id: 2, title: '2', subTitle: ''),
      User(id: 3, title: '3', subTitle: ''),
      User(id: 4, title: '4 ', subTitle: ''),
      User(id: 4, title: '5', subTitle: ''),
      User(id: 4, title: '6', subTitle: ''),
      User(id: 4, title: '7', subTitle: ''),
      User(id: 4, title: '8', subTitle: ''),
      User(id: 4, title: '9', subTitle: ''),
      User(id: 4, title: '10', subTitle: ''),
    ];
  }
}
