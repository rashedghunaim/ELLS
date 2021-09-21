import 'package:flutter/material.dart';
import 'package:graduation/Components/Joining/Login_Screens.Components/At_The_Top.dart';
import 'package:graduation/Components/Joining/Login_Screens.Components/Custom_Login_Button.dart';
import 'package:graduation/Components/Joining/Login_Screens.Components/Login_with.dart';
import 'package:graduation/Components/Joining/Login_Screens.Components/TextField_1_Widget.dart';
import 'package:graduation/Components/Joining/Login_Screens.Components/TextField_2_Widget.dart';
import 'package:graduation/Components/New_To.dart';
import 'package:graduation/Screens/Second_Joining_Screen.dart';
import 'Login_Screen.dart';

class FirstJoiningScreen extends StatefulWidget {
  static String routeName = '/FirstJoining_Screen';

  @override
  _FirstJoiningScreenState createState() => _FirstJoiningScreenState();
}

class _FirstJoiningScreenState extends State<FirstJoiningScreen> {
  bool emptyFileds = false;
  final emailTextController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 30),
          AtTheTop(
            title: 'Join your professional community ',
            fontSize: 30,
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(left: 50, right: 50, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              width: 600,
              height: 550,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  TextField1(
                      controllerF: emailTextController, text: 'Enter Email'),
                  SizedBox(height: 30),
                  TextField2(
                      hintText: 'Create a password',
                      controllerf: passwordController,
                      counterText: null,
                      onPressed: () {}),
                  SizedBox(height: 30),
                  Container(
                    width: 370,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'By clicking Agree & Join, you agree to the ELLS ',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'User Agreement , ',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 12),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Privacy Policy , ',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 12),
                              ),
                            ),
                            Text(
                              'and  ',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Cookie Policy ',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.0),
                  SizedBox(height: 20),
                  Container(
                    child: LoginButton(
                      title: 'Agree & Join ',
                      onPressed: () {
                        if (emailTextController.text != "" &&
                            passwordController.text != "") {
                          Navigator.of(context).pushNamed(
                              SecondJoiningScreen.routeName,
                              arguments: {
                                "Email": emailTextController.text,
                                "Pass": passwordController.text
                              });
                        } else {
                          setState(() {
                            emptyFileds = true;
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 7),
                  emptyFileds
                      ? Padding(
                          padding: EdgeInsets.only(top: 5, left: 150),
                          child: Container(
                            child: Row(
                              children: [
                                Text(
                                  'Pls enter an email and password',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  SizedBox(height: 0.0),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          height: 40,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text('or'),
                      ),
                      Expanded(
                        child: Divider(
                          height: 50,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoginWith(
                        icons: null,
                        isActive: false,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  newTo(
                    title: 'Already on ELLS ?',
                    title2: 'Sign In',
                    press: () {
                      return Navigator.of(context)
                          .pushNamed(LoginScreen.routeNmae);
                    },
                    isActive: false,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// showDialog(
//                             context: context,
//                             builder: (_) {
//                               return Dialog(
//                                 child: Container(
//                                   width: 100,
//                                   height: 130,
//                                   child: Center(
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           'Pls enter an email and password',
//                                           style: TextStyle(
//                                               color: Colors.black,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                         SizedBox(height: 20),
//                                         Container(
//                                           height: 40,
//                                           width: 40,
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(30),
//                                               color: Colors.grey[300]),
//                                           child: IconButton(
//                                             icon: Icon(Icons.close),
//                                             onPressed: () {
//                                               Navigator.pop(context);
//                                             },
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           );