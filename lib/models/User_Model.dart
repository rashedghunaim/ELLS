class UserModel {
  String name;
  String connections;
  String viewProfile;
  String headline;
  String profileUrl;
  int iD;
  String type;

  static List<UserModel> getUserType() {
    return <UserModel>[
      UserModel(type: 'Expert', iD: 0),
      UserModel(type: 'Employee', iD: 1),
    ];
  }

  // UserModel.fromJson(Map<String, dynamic> json) {
  //   this.name = json["fullname"];
  //   this.iD = json["uid"];
  // }

  UserModel(
      {this.name,
      this.connections,
      this.viewProfile,
      this.headline,
      this.profileUrl,
      this.iD,
      this.type});
}
