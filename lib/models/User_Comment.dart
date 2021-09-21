import 'package:flutter/foundation.dart';

class UserCommentModel {
  String userName;
  String comment;
  String time;
  String reply;
  // ignore: non_constant_identifier_names
  String Like;

  UserCommentModel(
      {@required this.comment,
      @required this.time,
      @required this.userName,
      this.Like,
      this.reply});
}
