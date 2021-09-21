import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:dio/dio.dart';
import 'Left_Side_Widget.dart';
import 'Messiging_Button_Widget.dart';
import 'center_side_widget.dart';
import 'right_side_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenBodyContent extends StatefulWidget {
  @override
  _HomeScreenBodyContentState createState() => _HomeScreenBodyContentState();
}

class _HomeScreenBodyContentState extends State<HomeScreenBodyContent> {
  String userName;
  String specialty;
  String branch;
  String department;
  String countryRegion;

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
        setState(() async {
          userName = response.data["fullname"];
          specialty = response.data['specialty'];
          branch = response.data['branch'];
          countryRegion = response.data['countryRegion'];
          department = response.data['department'];
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString('userName', userName);
          pref.setString('specialty', specialty);
          pref.setString('branch', branch);
          pref.setString('countryRegion', countryRegion);
          pref.setString('department', department);
        });
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    getuserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      // ignore: non_constant_identifier_names
      builder: (context, SizingInformation) {
        return Container(
          padding: EdgeInsets.only(top: 30, left: 30, right: 30),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Positioned(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SingleChildScrollView(
                        child: LeftSideWidget(
                          height: 620,
                          sizingInformation: SizingInformation,
                          user: userName,
                          specialty: specialty,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    left: 0.0,
                    child: SingleChildScrollView(
                      child: CenterSideWidget(
                        employeeSpecialty: specialty,
                        sizingInformation: SizingInformation,
                      ),
                    ),
                  ),
                  Positioned(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SingleChildScrollView(
                        child: RightSideWidget(
                          height: 610,
                          sizingInformation: SizingInformation,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: MessagingButtonWidget(),
              ),
            ],
          ),
        );
      },
    );
  }
}
