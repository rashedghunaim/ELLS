import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_image_picker/flutter_web_image_picker.dart';
import 'package:graduation/Components/Creat_Post_Components/Form_Widget.dart';
import 'package:graduation/Custom_Config/Theme.dart';
import 'package:graduation/Screens/Home_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Custom_Animated_Button_Widget.dart';
import '../common.dart';

class PostCore extends StatefulWidget {
  @override
  _PostCoreState createState() => _PostCoreState();
}

class _PostCoreState extends State<PostCore> {
  Image image;
  void imagePicker() async {
    print("check image path");
    final _image = await FlutterWebImagePicker.getImage;
    print(_image);
    setState(
      () {
        image = _image;
      },
    );
  }

  String value1;
  String value2;
  String value3;
  String value;
  int index = 0;
  List<String> concat = [];
  String concat2;
  String concat3;
  String title = 'who can benefit from your idea ';
  String title2 = 'Your idea type';
  String title3 = 'Your job title ';

  final List<String> filter = [
    'Technology sector',
    'Marketing sector',
    'Finance sector',
  ];
  final List<String> filter2 = [
    'scientific nature ',
    'technological nature ',
    'marketing nature',
    'E_Commerce',
    'Another',
  ];
  final List<String> filter3 = [
    'Marketing Coordinator',
    'Web Designer',
    'President of Sales',
    'Project Manager',
    'Account Executive',
    'Business Analyst',
    'Risk Manager',
    'Data Entry',
    'Human Resources',
    'Chief Executive Officer',
    'Another',
  ];
  final fisrtQController = TextEditingController();
  final secondQController = TextEditingController();
  final thirdQController = TextEditingController();
  final fourthQController = TextEditingController();
  final titleController = TextEditingController();
  final textController = TextEditingController();
  final dropDownFiledController = TextEditingController();
  bool _startPostHover = false;
  bool check = false;
  bool activrQerror = false;
  // ignore: non_constant_identifier_names
  Widget _PostsubmittedData() {
    final enteredTitle = titleController.text;
    final enteredText = textController.text;
    if (enteredTitle.isEmpty && enteredText.isEmpty) {
      // return closeDialog();
      return null;
    } else {
      postAlertDialog(
          'You haven’t finished your post yet . Are you sure you want to leave and discard your draft  ?');
    }
  }

  // ignore: non_constant_identifier_names
  void HandleChangeQ1(newValue) {
    setState(() {
      value1 = newValue;
      title = newValue;
      if (concat.length < 3) {
        concat.add(newValue);
      }
    });
    closeDialog();
    _formPopUp();
  }

  // ignore: non_constant_identifier_names
  void HandleChangeQ2(newValue) {
    setState(() {
      value2 = newValue;
      title2 = newValue;
      concat2 = newValue;
    });
    closeDialog();
    _formPopUp();
  }

  // ignore: non_constant_identifier_names
  void HandleChangeQ3(newValue) {
    setState(() {
      value3 = newValue;
      title3 = newValue;
      concat3 = newValue;
    });
    closeDialog();
    _formPopUp();
  }

  @override
  void initState() {
    super.initState();
    getuserInfo();
  }

  String userName;
  void getuserInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var uid = "";
    var Permissson = preferences.getString("premission");
    if (Permissson == "1")
      uid = preferences.getString("EXid");
    else
      uid = preferences.getString("uid");
    try {
      dynamic requestoptions = {
        'uid': uid,
      };
      var response = await Dio().post("http://localhost:8080/GetData",
          data: requestoptions,
          options: Options(
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          ));
      if (response.data["fullname"] != "") {
        setState(() {
          userName = response.data["fullname"];
        });
      }
    } catch (err) {
      print(err);
    }
  }

  void sendpost() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var uid = "";
    var Permissson = preferences.getString("premission");
    if (Permissson == "1")
      uid = preferences.getString("EXid");
    else
      uid = preferences.getString("uid");

    // var uid = preferences.getString("uid");
    print(concat);
    try {
      dynamic requestoptions = {
        'uid': uid,
        'category': concat,
        'title': titleController.text,
        "plan": fourthQController.text,
        "type_idea": concat2,
        "rank": concat3,
        "descrptions": textController.text
      };
      var response = await Dio().post("http://localhost:8080/CreatePosts",
          data: requestoptions,
          options: Options(
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          ));
      print("Created");
      print(response.data);
      closeDialog();
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: textHoverColor(
                color: Colors.white,
                color2: Colors.transparent,
                isHover: _startPostHover)),
        child: Center(
          child: Text(
            'Create a post',
            style: TextStyle(
              color: Colors.black,
              fontSize: 13.7,
              fontWeight: FontWeight.w600,
              wordSpacing: 3,
            ),
          ),
        ),
      ),
      onTap: () {
        return _formPopUp();
      },
      onHover: (value) {
        setState(() {
          _startPostHover = value;
        });
      },
    );
  }

  void _postPopUp() {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color(MyColors.SoftBeach),
              borderRadius: BorderRadius.circular(30),
            ),
            width: 700,
            height: 630,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(MyIcons.account, size: 20),
                          SizedBox(width: 15),
                          Text(
                            userName,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      InkWell(
                        child: Icon(
                          MyIcons.cancel,
                          color: Colors.black,
                        ),
                        onTap: () {
                          _PostsubmittedData();
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 40,
                  child: TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      hintText: 'title',
                      fillColor: Colors.blueGrey[20],
                      filled: true,
                      labelStyle: TextStyle(fontSize: 12),
                      contentPadding: EdgeInsets.only(left: 30),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Scrollbar(
                    child: TextField(
                      controller: textController,
                      maxLines: 8,
                      decoration: InputDecoration(
                        hintText: "Feel free to exspress your thoughts",
                        hintStyle: MyTextStyles.postInputField,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 241,
                  width: double.infinity,
                  child: image != null
                      ? Container(
                          child: image,
                        )
                      : Container(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(MyColors.QuillGrey),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(27),
                        bottomRight: Radius.circular(27),
                      ),
                    ),
                    height: 61,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Container(
                            width: 252,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  icon: Icon(MyIcons.image),
                                  onPressed: () {
                                    imagePicker();
                                  },
                                ),
                                IconButton(
                                    autofocus: true,
                                    icon: Icon(
                                      MyIcons.google_docs,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {}),
                                IconButton(
                                    icon: Icon(
                                      MyIcons.addlink,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {}),
                                IconButton(
                                    icon: Icon(
                                      MyIcons.google_drive,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {}),
                                IconButton(
                                    icon: Icon(
                                      Icons.emoji_emotions,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {}),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Container(
                            child: Row(
                              children: [
                                IconButton(
                                    icon: Icon(MyIcons.threetopdots),
                                    onPressed: () {}),
                                SizedBox(width: 10),
                                SizedBox(
                                  height: 40,
                                  width: 130,
                                  child: RaisedButton(
                                    onPressed: () {
                                      return closeDialog();
                                    },
                                    color: Colors.black,
                                    child: Text(
                                      'Back',
                                      style: TextStyle(color: Colors.white60),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30),
                                CustomAnimatedButton(
                                  onPressed: () {
                                    sendpost();
                                  },
                                  concat: concat,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _formPopUp() {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color(MyColors.SoftBeach),
              borderRadius: BorderRadius.circular(30),
            ),
            width: 700,
            height: 630,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'a few questions to describe  you’re thoughts',
                          style: TextStyle(
                              color: Color(MyColors.black),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        IconButton(
                            onPressed: () {
                              // return _FormSubmittedData();
                            },
                            icon: Icon(
                              MyIcons.cancel,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Divider(color: Colors.black, thickness: 0.7),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.only(right: 170, top: 3),
                  child: Text(
                    'pls note , your answers will be delivered to all experts within your department',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 460,
                        child: FormWidget(
                          title: title,
                          leftPadding: 15,
                          suffixText: 'required',
                        ),
                      ),
                      Container(
                        height: 50,
                        padding: EdgeInsets.only(left: 0.0, right: 0.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButton(
                          icon: Icon(
                            MyIcons.dropDown3,
                            size: 10,
                          ),
                          hint: Container(
                            padding: EdgeInsets.only(right: 50),
                            child: Text(
                              'select a category',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                          ),
                          iconEnabledColor: Colors.black,
                          underline: Container(color: Colors.transparent),
                          value: value1,
                          onChanged: (newValue) {
                            return HandleChangeQ1(newValue);
                          },
                          items: filter.map(
                            (e) {
                              return DropdownMenuItem(
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 13),
                                ),
                                value: e,
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 460,
                        child: FormWidget(
                          title: title2,
                          leftPadding: 15,
                          suffixText: 'optional',
                        ),
                      ),
                      Container(
                        height: 50,
                        padding: EdgeInsets.only(left: 0.0, right: 0.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButton(
                          icon: Icon(
                            MyIcons.dropDown3,
                            size: 10,
                          ),
                          hint: Container(
                            padding: EdgeInsets.only(right: 50),
                            child: Text(
                              'select a category',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                          ),
                          iconEnabledColor: Colors.black,
                          underline: Container(color: Colors.transparent),
                          value: value2,
                          onChanged: (newValue) {
                            return HandleChangeQ2(newValue);
                          },
                          items: filter2.map(
                            (e) {
                              return DropdownMenuItem(
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 13),
                                ),
                                value: e,
                              );
                            },
                          ).toList(),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 460,
                        child: FormWidget(
                          title: title3,
                          formController: thirdQController,
                          leftPadding: 15,
                          suffixText: 'optional',
                          helperText:
                              'job title is simply a name that describes your job or position at work',
                        ),
                      ),
                      Container(
                        width: 200,
                        padding:
                            EdgeInsets.only(left: 25, right: 0.0, bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButton(
                          icon: Icon(
                            MyIcons.dropDown3,
                            size: 10,
                          ),
                          hint: Container(
                            child: Text(
                              'select a category',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                          ),
                          iconEnabledColor: Colors.black,
                          underline: Container(color: Colors.transparent),
                          value: value3,
                          onChanged: (newValue) {
                            return HandleChangeQ3(newValue);
                          },
                          items: filter3.map(
                            (e) {
                              return DropdownMenuItem(
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 13),
                                ),
                                value: e,
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: fourthQController,
                    maxLength: 300,
                    maxLines: 4,
                    decoration: InputDecoration(
                      enabled: true,
                      helperText: '25 character minimum',
                      suffixText: 'optional field',
                      hintText:
                          'In shortly . tell us how do you plan to achieve  it ',
                      hintStyle: TextStyle(fontSize: 14),
                      suffixStyle: TextStyle(fontSize: 12),
                      filled: true,
                      labelStyle: TextStyle(fontSize: 10),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: 200,
                  child: RaisedButton(
                    onPressed: () {
                      if (value1 == null) {
                        formAlertDialog(
                            'pls fill out atleast the first question ');
                        setState(() {
                          activrQerror = true;
                        });
                      } else {
                        return _postPopUp();
                      }
                    },
                    color: Colors.blue,
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 17),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void postAlertDialog(String textBody) {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(17)),
            height: 210,
            width: 400,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discard draft',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.cancel),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey[400],
                  thickness: 0.7,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Container(
                    child: Text(
                      textBody,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 145, top: 20),
                    child: Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () {
                            closeDialog();
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.blue),
                            ),
                            child: Center(
                              child: Text(
                                'Go back',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, HomeScreen.routeName);
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                'Discard',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void formAlertDialog(String textBody) {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(17)),
            height: 100,
            width: 300,
            child: Text(
              textBody,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
        );
      },
    );
  }

  Widget closeDialog() {
    Navigator.pop(context);
  }
}
