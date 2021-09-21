import 'package:flutter/material.dart';
import 'package:graduation/Custom_Config/Theme.dart';
import 'package:graduation/Screens/View_Post_Screen.dart';
import 'package:like_button/like_button.dart';

class LikesCommentsShared extends StatefulWidget {
  final List<dynamic> userData;
  final int index;
  LikesCommentsShared({this.index, this.userData});
  @override
  _LikesCommentsSharedState createState() => _LikesCommentsSharedState();
}

class _LikesCommentsSharedState extends State<LikesCommentsShared> {
  @override
  Widget build(BuildContext context) {
    void _navigation() {
      Navigator.of(context).pushNamed(ViewPostScreen.routeName);
    }

    return Container(
      margin: EdgeInsets.only(bottom: 2, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {},
            hoverColor: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(MyIcons.like,
                      // color: Colors.grey,
                      color: Colors.grey),
                ),
                SizedBox(width: 16),
                InkWell(
                  onTap: () {},
                  child: Text('Like',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              return _navigation();
            },
            hoverColor: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(MyIcons.comment, color: Colors.grey),
                SizedBox(width: 16),
                Text(
                  'Comment',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            hoverColor: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(MyIcons.share, color: Colors.grey),
                SizedBox(width: 16),
                Text(
                  'Share',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            hoverColor: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(MyIcons.sent, color: Colors.grey),
                SizedBox(width: 16),
                Text('Send',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
