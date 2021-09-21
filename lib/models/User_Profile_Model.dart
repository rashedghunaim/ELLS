import 'package:flutter/cupertino.dart';

class UserProfileModel {
  String fullName;
  
  String jobName;
  String departmentName;
  String branchName;
  String livingInfo;
  String contactInfo;

  UserProfileModel(
      {@required this.branchName,
      @required this.contactInfo,
      @required this.departmentName,
      @required this.jobName,
      @required this.livingInfo,
     @required this.fullName});
}
