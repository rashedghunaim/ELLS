import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduation/Components/ExpertScreen_Components/Expertpage2.dart';
import 'package:graduation/Custom_Config/Theme.dart';
import 'Recived_post_footer.dart';
import 'recived_post_header.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingleRecivedPostItem extends StatefulWidget {
  @override
  _SingleRecivedPostItemState createState() => _SingleRecivedPostItemState();
}

class _SingleRecivedPostItemState extends State<SingleRecivedPostItem> {
  List<dynamic> tee = [];
  String userName;
  void getPost() async {
    try {
      var response = await Dio().get(
        "http://localhost:8080/Getpost",
        options: Options(
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        ),
      );
      print("postst");
      setState(() {
        tee = response.data;
      });

      tee.map((e) => {print(e.toString())});
    } catch (err) {
      print(err);
    }
  }

  void approved(id, index) async {
    try {
      dynamic requestoptions = {"uid": id};
      var response = await Dio().post("http://localhost:8080/GetPostById",
          data: requestoptions,
          options: Options(
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          ));
      var res = response.data;
      print(res['descrptions']);
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString(
        'userName',
        res['username']['fullname'],
      );
      Navigator.of(context).pushNamed(
        ExpertPage2.routeName,
        arguments: {
          'descreption': res['descrptions']['descrptions'],
          'username': res['username']['fullname'],
          'plan': res['descrptions']['plan'],
          'uid': id,
          'title': tee,
          'index': index,
        },
      );
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    getPost();
    super.initState();
  }

  String selected;
  List<String> items = ['Not within my expertise domain', 'Not interested'];
  void rejectPopup(BuildContext context, selected) {
    String selected;
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
            height: 200,
            width: 400,
            decoration: BoxDecoration(
              color: Color(MyColors.SoftBeach),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Container(
              child: Row(
                children: [
                  DropdownButton(
                    hint: Text('data'),
                    value: selected,
                    onChanged: (value) {
                      setState(
                        () {
                          print(value);
                          selected = value;
                        },
                      );
                    },
                    items: items.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                  ),
                  SizedBox(
                    width: 100,
                    child: RaisedButton(
                      onPressed: () {
                        return rejected(selected);
                      },
                      color: Colors.blue,
                      child: Text(
                        'reject',
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 17),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void rejected(selected) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString("EXid");
    try {
      dynamic requestoptions = {'speciality': selected, 'expertid': id};
      var response = await Dio().post("http://localhost:8080/Rejected",
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

  @override
  Widget build(BuildContext context) {
    if (tee.isEmpty) {
      return Text('fffff');
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                SizedBox(height: 30),
                Container(
                  child: ExpansionTile(
                    expandedAlignment: Alignment.center,
                    childrenPadding: EdgeInsets.only(left: 15, right: 50),
                    title: Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color(MyColors.DarkKramer),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: RecievdedPostHeader(),
                    ),
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          color: Colors.black,
                        ),
                        height: 300,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Container(
                                width: 500,
                                height: 150,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Title',
                                            style: TextStyle(
                                                color: Colors.white60,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(width: 50),
                                          Text(
                                            '${tee[index]["title"]}',
                                            style: TextStyle(
                                                color: Colors.white60,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Beneficiaries ',
                                            style: TextStyle(
                                                color: Colors.white60,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(width: 50),
                                          Container(
                                            child: Row(
                                              children: [
                                                Text(
                                                  '${tee[index]["category_IT"] == "" ? "" : tee[index]["category_IT"]} ',
                                                  style: TextStyle(
                                                      color: Colors.white60,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  '${tee[index]["category_Markting"] == "" ? "" : '/'}',
                                                  style: TextStyle(
                                                      color: Colors.white60,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  '${tee[index]["category_Markting"] == "" ? "" : tee[index]["category_Markting"]}',
                                                  style: TextStyle(
                                                      color: Colors.white60,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  '${tee[index]["category_Finacial"]}' ==
                                                          ''
                                                      ? ''
                                                      : '/',
                                                  style: TextStyle(
                                                      color: Colors.white60,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  '${tee[index]["category_Finacial"] == "" ? "" : tee[index]["category_Finacial"]} ',
                                                  style: TextStyle(
                                                      color: Colors.white60,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Idea Type :',
                                            style: TextStyle(
                                                color: Colors.white60,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(width: 50),
                                          Text(
                                            '${tee[index]["type_idea"]}',
                                            style: TextStyle(
                                                color: Colors.white60,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Job title',
                                            style: TextStyle(
                                                color: Colors.white60,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(width: 50),
                                          Text(
                                            '${tee[index]["rank"]}',
                                            style: TextStyle(
                                                color: Colors.white60,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                            RecivedPostFooter(
                              acceptOnnPressed: () {
                                approved(tee[index]["uid"], index);
                              },
                              rejectOnPressed: () {
                                rejectPopup(context, selected);
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          );
        },
        itemCount: tee.length,
      );
    }
  }
}
