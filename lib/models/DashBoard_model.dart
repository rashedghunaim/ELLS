import 'package:flutter/foundation.dart';

class DashBoardModel {
  int prfileViwes;
  int postsViwes;
  int follwersNumber;
  int savedItems;
  String text;
  List<DashBoardModel> dashBoardDataList;
  DashBoardModel(
      {@required this.follwersNumber,
      @required this.postsViwes,
      @required this.prfileViwes,
      @required this.savedItems,
      @required this.text , this.dashBoardDataList});
}
