class UserPostModel {
  String id;
  String profileUrl;
  String name;
  String headline;
  bool isVideoPost;
  String description;
  String video;
  String image;
  String comments;
  String likes;
  String tags;
  bool isOnline;
  int rate;
  DateTime time;

  UserPostModel({
    this.time,
    this.rate,
    this.profileUrl,
    this.name,
    this.headline,
    this.isVideoPost,
    this.description,
    this.video,
    this.image,
    this.comments,
    this.likes,
    this.tags,
    this.isOnline,
    this.id,
  });

  UserPostModel.fromJson(Map<String, dynamic> map) {
    this.id = map['id'];
    this.profileUrl = map['profileUrl'];
    this.name = map['name'];
    this.headline = map['headline'];
    this.description = map['description'];
    this.video = map['video'];
    this.image = map['image'];
  }
}
