import 'package:flutter/material.dart';

class MyColors {
  static int color = 0xff451e3e;
  static int TodayMostViwed = 0xff323232;
  static int LatestSharedNearYou = 0xff4c4c4c;
  static int black = 0xff030200;
  static int DarkKramer = 0xff010004;
  static int almond = 0xfff5f0e1;
  static int blue = 0xff0000FF;
  static int navy = 0xffecc19c;
  static int color6 = 0xff1e1e1e;
  static int greyShade = 0xffFAFAFA;
  static int color8 = 0xff851e3e;
  static int messangerBody = 0xfffffafa;
  static int grey = 0xffC7C7C7;
  static int SeashellColor = 0xfffff5ee;
  static int QuillGrey = 0xffB5B5B5;
  static int SoftBeach = 0xfff6f1f4;
  static int asmar = 0xfffB1B1B1;
  static int drakBlue = 0xff152238;

  static int drawerBackgroundColor = 0xFF272D34;
  static int bluePurple = 0xFF361999;
  static int selectedColor = 0xFF4AC8EA;
  static int black2 = 0xffBBBBBB;

  static int royalblue1 = 0xff4876FF;
  static int deepBlue = 0xff3131ce;
}

class MyTextStyles {
  static TextStyle listTitleDefaultTextStyle = TextStyle(
      color: Colors.white70, fontSize: 15.0, fontWeight: FontWeight.w600);
  static TextStyle listTitleSelectedTextStyle = TextStyle(
      color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w600);

  // ignore: non_constant_identifier_names
  static TextStyle DefaultHeaderTextStyle = TextStyle(
      color: Colors.white60, fontSize: 12.0, fontWeight: FontWeight.bold);
  static TextStyle postInputField = TextStyle(
      color: Colors.black45, fontSize: 12.0, fontWeight: FontWeight.bold);

  static TextStyle DefaultProfileTextStyle = TextStyle(
    color: Colors.white60,
    fontSize: 15.0,
  );
  static TextStyle DefaultHeaderTextStyle2 = TextStyle(
      color: Colors.white60, fontSize: 13.7, fontWeight: FontWeight.bold);
  static TextStyle writeCommentTextStyle = TextStyle(
      color: Colors.white60, fontSize: 13.7, fontWeight: FontWeight.w600);

  // ignore: non_constant_identifier_names
  static TextStyle DefaultHeadLineTextStyle = TextStyle(
      color: Colors.white60, fontSize: 15.0, fontWeight: FontWeight.w600);
  // ignore: non_constant_identifier_names
  static TextStyle DefaultHeadLineTextStyle2 = TextStyle(
      color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w600);
  // ignore: non_constant_identifier_names
  static TextStyle DefaultHeadLineTextStyle3 = TextStyle(
      color: Colors.black, fontSize: 13.2, fontWeight: FontWeight.w600);
  // ignore: non_constant_identifier_names
  static TextStyle DefaultHeadLineTextStyle4 = TextStyle(
    color: Colors.white,
    fontSize: 13.2,
    fontWeight: FontWeight.w600,
    wordSpacing: 3,
  );
  static TextStyle DefaultHeadLineTextStyle5 = TextStyle(
    color: Colors.white60,
    fontSize: 13.7,
    fontWeight: FontWeight.w600,
    wordSpacing: 3,
  );
  static final Color primaryColor = Color.fromRGBO(33, 62, 75, 1);
  static final Color textColor = Color.fromRGBO(185, 134, 86, 1);
  static final Color blueColor = Color.fromRGBO(18, 121, 185, 1);
}

class MyPadding {
  static final EdgeInsets paddingH10 = EdgeInsets.symmetric(horizontal: 10);
  static final EdgeInsets paddingH15 = EdgeInsets.symmetric(horizontal: 15);
  static final EdgeInsets paddingH20 = EdgeInsets.symmetric(horizontal: 20);
  static final EdgeInsets paddingHV10 =
      EdgeInsets.symmetric(horizontal: 10, vertical: 10);
  static final EdgeInsets paddingHV15 =
      EdgeInsets.symmetric(horizontal: 15, vertical: 15);
  static final EdgeInsets paddingHV20 = EdgeInsets.symmetric(horizontal: 2);
}

class MyIcons {
  MyIcons._();

  static const _kFontFam = 'MyFlutterApp';
  static const String _kFontPkg = null;

  static const _kFontFamm = 'Home';

  static const IconData home = IconData(0xe810, fontFamily: _kFontFamm);

  static const _kFontFam1 = 'ChartPie';
  static const String _kFontPkgg = null;

  static const IconData chartpie =
      IconData(0xe801, fontFamily: _kFontFam1, fontPackage: _kFontPkgg);

  static const _kFontFam2 = 'Account';

  static const IconData account = IconData(0xe807, fontFamily: _kFontFam2);

  static const _kFontFam3 = 'Chatting';

  static const IconData chating = IconData(0xe803, fontFamily: _kFontFam3);

  static const _kFontFam4 = 'Google';

  static const IconData Google = IconData(0xe800, fontFamily: _kFontFam4);

  static const _kFontFam5 = 'Sent';

  static const IconData sent = IconData(0xe809, fontFamily: _kFontFam5);

  static const _kFontFam6 = 'Like';

  static const IconData like = IconData(0xe80b, fontFamily: _kFontFam6);

  static const _kFontFam7 = 'Comment';

  static const IconData comment = IconData(0xe80c, fontFamily: _kFontFam7);

  static const _kFontFam8 = 'Share';
  static const IconData share = IconData(0xe80a, fontFamily: _kFontFam8);

  static const _kFontFam9 = 'Laghing';

  static const IconData laughing = IconData(0xe80e, fontFamily: _kFontFam9);

  static const _kFontFam10 = 'Love';

  static const IconData love = IconData(0xe80d, fontFamily: _kFontFam10);

  static const _kFontFam11 = 'UserDashboard';
  static const IconData userdashboard2 =
      IconData(0xe805, fontFamily: _kFontFam11);

  static const _kFontFam12 = 'Network';

  static const IconData network = IconData(0xe801, fontFamily: _kFontFam12);

  static const _kFontFam13 = 'Request';

  static const IconData request = IconData(0xe804, fontFamily: _kFontFam13);

  static const _kFontFam14 = 'Edit';

  static const IconData edit = IconData(0xe805, fontFamily: _kFontFam14);

  static const _kFontFam15 = 'More';

  static const IconData threedots = IconData(0xe807, fontFamily: _kFontFam15);

  static const _kFontFam16 = 'UpArrow';

  static const IconData uparrow = IconData(0xe808, fontFamily: _kFontFam16);
  static const _kFontFam17 = 'BookMark';

  static const IconData bookmark = IconData(0xe809, fontFamily: _kFontFam17);

  static const _kFontFam18 = 'Report';

  static const IconData report_1 = IconData(0xe80a, fontFamily: _kFontFam18);
  static const _kFontFam19 = 'Unfollow';

  static const IconData unfollow2 = IconData(0xe80c, fontFamily: _kFontFam19);
  static const _kFontFam20 = 'Group';

  static const IconData group = IconData(0xe80d, fontFamily: _kFontFam20);

  static const _kFontFam21 = 'Add';

  static const IconData add = IconData(0xe800, fontFamily: _kFontFam21);
  static const _kFontFam22 = 'Image';

  static const IconData image = IconData(0xe801, fontFamily: _kFontFam22);

  static const _kFontFam23 = 'Edit2';

  static const IconData edit2 = IconData(0xe802, fontFamily: _kFontFam23);

  static const _kFontFam24 = 'Experts';

  static const IconData rating = IconData(0xe800, fontFamily: _kFontFam24);
  static const _kFontFam25 = 'Related';

  static const IconData related = IconData(0xe802, fontFamily: _kFontFam25);

  static const _kFontFam26 = 'AddImage';

  static const IconData addimage = IconData(0xe806, fontFamily: _kFontFam26);

  static const _kFontFam27 = 'AddLink';

  static const IconData addlink = IconData(0xe805, fontFamily: _kFontFam27);

  static const _kFontFam28 = 'GoogleDoc';

  static const IconData google_docs = IconData(0xe804, fontFamily: _kFontFam28);

  static const _kFontFam29 = 'Drive';
  static const IconData google_drive =
      IconData(0xe803, fontFamily: _kFontFam29);

  static const _kFontFam30 = 'Cancel';

  static const IconData cancel = IconData(0xe801, fontFamily: _kFontFam30);

  static const _kFontFam31 = 'Delete';

  static const IconData delete = IconData(0xe800, fontFamily: _kFontFam31);

  static const _kFontFam32 = 'ThreeTopDots';

  static const IconData threetopdots =
      IconData(0xe80a, fontFamily: _kFontFam32);

  static const _kFontFam33 = 'AddImage2';

  static const IconData addimage2 = IconData(0xe80b, fontFamily: _kFontFam33);

  static const _kFontFam34 = 'Snooze';

  static const IconData Snooze = IconData(0xe800, fontFamily: _kFontFam34);

  static const _kFontFam35 = 'Questionaries';

  static const IconData interview = IconData(0xe800, fontFamily: _kFontFam35);

  static const _kFontFam36 = 'FeedBack';

  static const IconData businessman = IconData(0xe803, fontFamily: _kFontFam36);

  static const _kFontFam37 = 'Questionaries2';

  static const IconData feedback = IconData(0xe801, fontFamily: _kFontFam37);

  static const _kFontFam38 = 'Manage';

  static const IconData team = IconData(0xe805, fontFamily: _kFontFam38);

  static const _kFontFam39 = 'Presentation';

  static const IconData presentation =
      IconData(0xe806, fontFamily: _kFontFam39);

  static const _kFontFam40 = 'HandsShake';

  static const IconData collaboration =
      IconData(0xe807, fontFamily: _kFontFam40);

  static const _kFontFam41 = 'HandsShake2';

  static const IconData handshake = IconData(0xe808, fontFamily: _kFontFam41);

  static const _kFontFam42 = 'RAR';

  static const IconData question__1_ =
      IconData(0xe809, fontFamily: _kFontFam42);

  static const _kFontFam44 = 'DropDown1';

  static const IconData dropDown1 = IconData(0xe80a, fontFamily: _kFontFam44);

  static const _kFontFam45 = 'DropDown2';

  static const IconData dropDown2 = IconData(0xe80b, fontFamily: _kFontFam45);

  static const _kFontFam46 = 'DropDown3';





  static const IconData dropDown3 = IconData(0xe80d, fontFamily: _kFontFam46);
  static const _kFontFam47 = 'PostDetails';

  static const IconData PostDetails = IconData(0xe800, fontFamily: _kFontFam47);
}
