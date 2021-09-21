import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduation/Components/Custom_Loading_Button_Widget.dart';
import 'package:graduation/Components/Joining/Login_Screens.Components/At_The_Top.dart';
import 'package:graduation/Components/Joining/Login_Screens.Components/TextField_1_Widget.dart';
import 'package:graduation/Screens/Home_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondJoiningScreen extends StatefulWidget {
  static String routeName = '/SecondJoining_Screen';

  @override
  _SecondJoiningScreenState createState() => _SecondJoiningScreenState();
}

class _SecondJoiningScreenState extends State<SecondJoiningScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final specialtyController = TextEditingController();
  final countryRegionController = TextEditingController();
  final branchWorkController = TextEditingController();
  final departmentWorkController = TextEditingController();
  var emailArg = "";
  var password = "";

  String value;

  var _selectedType;
  List<String> userTypes = ['employee', 'expert'];

  void _navigation() {
    Navigator.of(context).pushNamed(HomeScreen.routeName);
  }

  bool loading = false;
  bool emptyFileds = false;

  void fetchHandler(start) async {
    print(_selectedType);
    var typesPermssions = "";

    if (_selectedType == 'employee') {
      typesPermssions = "0";
      print(typesPermssions);
    } else {
      typesPermssions = "1";
      print(typesPermssions);
    }
    if (firstNameController.text.isEmpty && lastNameController.text.isEmpty) {
      print("Please Make sure Entered values");
    } else if (emailArg == "" || password == "") {
      print("put alert here");
    } else {
      try {
        dynamic requestoptions = {
          'fullname': firstNameController.text + lastNameController.text,
          'email': emailArg,
          'password': password,
          'specialty' : specialtyController.text,
          'branchWork': branchWorkController.text ,
          'countryRegion': countryRegionController.text ,
          'departmentWork': departmentWorkController.text , 
          'type': typesPermssions,
        };
        var response = await Dio().post("http://localhost:8080/Create",
            data: requestoptions,
            options: Options(
              headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            ));
        var res = response.data;
        String uid = res['uid'].toString();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var premission = "";
        if (res["type"] == "1") {
          premission = res["type"].toString();
          prefs.setString("premission", premission);
          prefs.setString("EXid", uid);
          _navigation();
        } else {
          premission = res["type"].toString();
          prefs.setString("premission", premission);
          prefs.setString("uid", uid);
          _navigation();
        }
        if (uid != null || uid != '') {
          setState(() {
            loading = true;
          });
        }
      } catch (err) {
        print(err);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    try {
      emailArg = args['Email'];
      password = args['Pass'];
    } catch (err) {
      print(err);
    }

    return Scaffold(
      body: ListView(
        children: [
          AtTheTop(title: 'Tell us more about your self ', fontSize: 30),
          Center(
            child: Container(
              padding: EdgeInsets.only(left: 50, right: 50, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              width: 620,
              height: 635,
              child: Column(
                children: [
                  TextField1(
                      controllerF: firstNameController, text: 'First name'),
                  SizedBox(height: 30),
                  TextField1(
                      controllerF: lastNameController, text: 'Last name'),
                  SizedBox(height: 30),
                  TextField1(
                      controllerF: specialtyController,
                      text: ' your specialty '),
                  SizedBox(height: 30),
                  TextField1(
                      controllerF: countryRegionController,
                      text: 'Country/Region'),
                  SizedBox(height: 30),
                  TextField1(
                      controllerF: branchWorkController, text: 'Branch name '),
                  SizedBox(height: 30),
                  TextField1(
                      controllerF: departmentWorkController,
                      text: 'department name '),

                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Container(
                      width: double.infinity,
                      child: DropdownButton(
                        hint: Text('you are ? '),
                        isExpanded: true,
                        isDense: true,
                        underline: Container(
                          color: Colors.black,
                          height: 0.6,
                        ),
                        elevation: 100,
                        icon: Icon(Icons.arrow_drop_down),
                        value: _selectedType,
                        onChanged: (value) {
                          setState(() {
                            _selectedType = value;
                          });
                        },
                        items: userTypes.map((e) {
                          return DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  SizedBox(height: 40),

                  emptyFileds
                      ? Container(
                          child: Text(
                            'pls fill out the required fields',
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      : Container(),
                  SizedBox(height: 15),
                  Container(
                    height: 50,
                    child: CustomLoadingButton(
                      laodingIcon: loading,
                      onPressed: () {
                        var start = false;
                        if (firstNameController.text == "" ||
                            lastNameController.text == "") {
                          setState(() {
                            emptyFileds = true;
                          });
                        } else {
                          return fetchHandler(start);
                        }
                      },
                      title: 'Get Started',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// Container(
                  //   child: LoginButton(
                  //     title: 'what are you interested in ?',
                  //     onPressed: () {
                  //       return showDialog(
                  //         context: context,
                  //         builder: (_) {
                  //           return Dialog(
                  //             child: Container(
                  //               decoration: BoxDecoration(),
                  //               width: 600,
                  //               height: 500,
                  //               child: GridView(
                  //                 gridDelegate:
                  //                     SliverGridDelegateWithMaxCrossAxisExtent(
                  //                         maxCrossAxisExtent: 300,
                  //                         childAspectRatio: 2 / 2,
                  //                         crossAxisSpacing: 15,
                  //                         mainAxisSpacing: 15),
                  //               ),
                  //             ),
                  //           );
                  //         },
                  //       );
                  //     },
                  //   ),
                  // ),