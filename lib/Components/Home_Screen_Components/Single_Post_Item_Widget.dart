import 'package:flutter/material.dart';

import 'Post_Body_Widget.dart';
import 'Post_Header_Widget.dart';

class SinglePostItem extends StatelessWidget {
  final int index;
  final List<dynamic> userData;
  SinglePostItem({this.index, this.userData});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          PostHeader(
            index: index,
            userData: userData,
          ),
          PostBody(
            index: index,
            userData: userData,
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}
