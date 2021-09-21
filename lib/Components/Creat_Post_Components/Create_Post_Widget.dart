import 'package:flutter/material.dart';
import 'package:graduation/Custom_Config/Theme.dart';

import 'Post_Core_Content.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 160),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 13),
            child: IconButton(
                icon: Icon(
                  MyIcons.account,
                  color: Colors.white,
                  size: 35,
                ),
                onPressed: () {}),
          ),
          SizedBox(width: 15),
          Container(
            width: 400,
            decoration: BoxDecoration(
              color: Color(MyColors.grey),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white, width: 0.7),
            ),
            alignment: Alignment.topCenter,
            child: PostCore(),
          ),
        ],
      ),
    );
  }
}
