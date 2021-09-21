class LessonModel {
  int id, uid;
  String type_idea,
      rank,
      plan,
      category_IT,
      category_Markting,
      category_Finacial,
      title,
      descrptions,
      image,
      vid,
      aproved,
      rated;

  LessonModel(
      {this.aproved,
      this.category_Finacial,
      this.category_IT,
      this.category_Markting,
      this.descrptions,
      this.id,
      this.image,
      this.plan,
      this.rank,
      this.rated,
      this.title,
      this.type_idea,
      this.uid,
      this.vid});

  LessonModel.fromJson(Map<String, dynamic> map) {
    this.id = map['id'];
    this.type_idea = map['rank'];
    this.rank = map['plan'];
    this.plan = map['descriptions'];
    this.category_IT = map['category_IT'];
    this.category_Markting = map['category_Markting'];
    this.category_Finacial = map['category_Finacial'];
    this.title = map['title'];
    this.descrptions = map['descrptions'];
    this.image = map['image'];
    this.image = map['image'];
    this.vid = map['vid'];
    this.aproved = map['aproved'];
    this.rated = map['rated'];
  }
}
