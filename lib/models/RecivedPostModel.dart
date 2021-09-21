import 'package:flutter/cupertino.dart';

class RecivedPostModel {
  String fullName;
  String headline;
  String time;
  String benfitsFrom;
  String ideaType;
  String organizationalRank;
  String job;

  RecivedPostModel(
      {@required this.benfitsFrom,
      @required this.job,
      @required this.fullName,
      @required this.headline,
      @required this.ideaType,
      @required this.organizationalRank,
      @required this.time});
}
