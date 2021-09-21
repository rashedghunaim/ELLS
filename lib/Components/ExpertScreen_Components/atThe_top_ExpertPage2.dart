import 'package:flutter/material.dart';
import 'package:graduation/Custom_Config/Theme.dart';
import 'package:graduation/Dummy_Data/Fake_Respositery.dart';
import 'package:intl/intl.dart';

class AtTheTop2Widget extends StatelessWidget {
  final String userName;
  AtTheTop2Widget({this.userName});
  final postData = FakeRepository.postList;
  final int index = 0;

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    return Container(
      width: 700,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Icon(
                      MyIcons.account,
                      color: Colors.black,
                    ),
                    SizedBox(width: 20),
                    Text(
                      userName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        wordSpacing: 3,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      DateFormat.yMMMd().format(now).toString(),
                      style: TextStyle(
                       color: Colors.black,
                         fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '(  ${now.hour} : ${now.minute}   AM )',
                      style: TextStyle(
                        color: Colors.black,
                         fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(width: 15),
                    IconButton(
                      icon: Icon(
                        MyIcons.threetopdots,
                         color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          // Divider(
          //   endIndent: 10,
          //   height: 0.8,
          //   color: Colors.black,
          //   thickness: 0.7,
          // )
        ],
      ),
    );
  }
}
