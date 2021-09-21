import 'package:flutter/material.dart';
import 'package:graduation/Custom_Config/Theme.dart';
import 'package:graduation/Dummy_Data/Fake_Respositery.dart';
import 'package:intl/intl.dart';

class RecievdedPostHeader extends StatelessWidget {
  final _more = FakeRepository.MoreItemsRecivedPost;

  final int index = 0;

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    return Container(
      padding: EdgeInsets.only(left: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  child: Icon(
                    MyIcons.account,
                    color: Colors.white60,
                  ),
                ),
                SizedBox(width: 40),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'new request ',
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  DateFormat.yMMMd().format(now),
                  style: TextStyle(
                    color: Colors.white60,
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  child: PopupMenuButton(
                    icon: Icon(
                      MyIcons.threetopdots,
                      size: 20,
                      color: Colors.white,
                    ),
                    itemBuilder: (context) {
                      return _more.map((e) {
                        return PopupMenuItem(
                          child: ListTile(
                            onTap: () {},
                            leading: Icon(e.Icon),
                            title: Text(e.title),
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
