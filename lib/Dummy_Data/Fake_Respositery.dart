import 'package:flutter/material.dart';
import 'package:graduation/Custom_Config/Theme.dart';
import 'package:graduation/models/Account_Model.dart';
import 'package:graduation/models/Company_Model.dart';
import 'package:graduation/models/Expert_Model.dart';
import 'package:graduation/models/Group_Model.dart';
import 'package:graduation/models/Icons.dart';
import 'package:graduation/models/Messeged_Person_Model.dart';
import 'package:graduation/models/Questionaries_Model.dart';
import 'package:graduation/models/RecivedPostModel.dart';
import 'package:graduation/models/User_Comment.dart';
import 'package:graduation/models/User_Model.dart';
import 'package:graduation/models/User_Post_Model.dart';
import 'package:graduation/models/User_Profile_Model.dart';
import 'package:graduation/models/more.dart';

class FakeRepository {
  static final List<UserPostModel> postList = [
    UserPostModel(
        time: DateTime(3),
        name: "Bill Gates",
        profileUrl: "lib/assets/pics/Bill Gates.jfif",
        headline: "Co-chair, Bill & Melinda Gates Foundation",
        tags:
            "#positivity #motivation #learning #progress #development #networking",
        description:
            "To get to net-zero emissions globally by 2050, leaders from around the world must work together. "
            "It’s encouraging to see governments, business leaders, and financial institutions committing to a "
            "successful United Nations Climate Change Conference in Glasgow later this year.",
        isVideoPost: false,
        comments: "100",
        video: "",
        isOnline: false,
        image: "lib/assets/pics/climate change.jfif",
        likes: "800",
        rate: 7),
    UserPostModel(
        time: DateTime(3),
        name: "Rashed Ghunaim",
        profileUrl: "lib/assets/pics/RashedGhunaim.jpg",
        headline: "Co-chair, Bill & Melinda Gates Foundation",
        tags:
            "#positivity #motivation #learning #progress #development #networking",
        description:
            "To get to net-zero emissions globally by 2050, leaders from around the world must work together. "
            "It’s encouraging to see governments, business leaders, and financial institutions committing to a "
            "successful United Nations Climate Change Conference in Glasgow later this year.",
        isVideoPost: false,
        comments: "100",
        video: "",
        isOnline: false,
        image: "lib/assets/pics/climate change.jfif",
        likes: "800",
        rate: 7),
    UserPostModel(
      time: DateTime(3),
      name: "Bill Gates",
      profileUrl: "lib/assets/pics/Bill Gates.jfif",
      headline: "Co-chair, Bill & Melinda Gates Foundation",
      tags:
          "#positivity #motivation #learning #progress #development #networking",
      description:
          "To get to net-zero emissions globally by 2050, leaders from around the world must work together. "
          "It’s encouraging to see governments, business leaders, and financial institutions committing to a "
          "successful United Nations Climate Change Conference in Glasgow later this year.",
      isVideoPost: false,
      comments: "100",
      video: "",
      isOnline: false,
      image: "lib/assets/pics/climate change.jfif",
      likes: "800",
      rate: 7,
    ),
    UserPostModel(
        time: DateTime(3),
        name: "Bill Gates",
        profileUrl: "lib/assets/pics/Bill Gates.jfif",
        headline: "Co-chair, Bill & Melinda Gates Foundation",
        tags:
            "#positivity #motivation #learning #progress #development #networking",
        description:
            "To get to net-zero emissions globally by 2050, leaders from around the world must work together. "
            "It’s encouraging to see governments, business leaders, and financial institutions committing to a "
            "successful United Nations Climate Change Conference in Glasgow later this year.",
        isVideoPost: false,
        comments: "100",
        video: "",
        isOnline: false,
        image: "lib/assets/pics/climate change.jfif",
        likes: "800",
        rate: 7),
  ];

  static final userProfile = UserModel(
      headline: "flutter developer | Freelancer",
      profileUrl: "assets/profile.jpg",
      name: "Rashed Ghunaim",
      connections: "1,837",
      viewProfile: "300");

  static final List<GroupModel> recentData = [
    GroupModel("Recent", [
      GroupModel("World Wide Flutter"),
      GroupModel("Flutter Developer Community"),
      GroupModel("Flutter Open Projects"),
      GroupModel("Firebase flutter"),
    ]),
    GroupModel("Groups", [
      GroupModel("World Wide Flutter"),
      GroupModel("Flutter Developer Community"),
      GroupModel("Flutter Open Projects"),
      GroupModel("Firebase flutter"),
    ]),
  ];

  static final List<CompanyModel> companyListData = [
    CompanyModel(
      name: "AMAZON",
      description: "We help to Build Your Career",
      profileUrl: "",
    ),
    CompanyModel(
      name: "Ascadenia",
      description: "company * internet ",
      profileUrl: "assets/icons/upwork.png",
    ),
    CompanyModel(
      name: "Flutter + Dart",
      description: "Open projects Contribution",
      profileUrl: "assets/icons/flutter_logo.jpeg",
    ),
  ];

  static final List<UserCommentModel> commentDat = [
    UserCommentModel(
        userName: 'Mohammad Alasmar ',
        comment:
            'This work is incredible and it may end up saving our planet and humanity. \nLet us all realign ourselves to this great enterprise from where we are. My group last week during Earthday said they have been subjected to 20 years of environmental education and only a handful of them make decisions based on those 20 years of ',
        time: '5 hours ago '),
    UserCommentModel(
        userName: 'Basel Qarqa ',
        comment: 'Good Job I rly liked this one ',
        time: '5 hours ago '),
    UserCommentModel(
        userName: 'Hzem AbuOlim',
        comment:
            'Bill , I applaud your efforts. \nMy company has developed a small DC motor that is 40% more efficient for the conveyor industry. Funny how two guys from Mississippi, and Arkansas could have such a profound impact on a market that has been over looked for years. Now with the pandemic on a Plato plane, this industry has been pushed to its limits. Amazon, Walmart, Nike, and Target all depend on the distribution network. Hytrol , FMH , and Roachconveyors are manufacturers are working over time to keep up with the demand. ',
        time: '5 hours ago ')
  ];

  static List<ExpertModel> expertsData = [
    ExpertModel(name: 'Mohammad Alsharo', iD: '1'),
    ExpertModel(name: 'Mohammad Alsharo', iD: '2'),
    ExpertModel(name: 'Mohammad Alsharo', iD: '3'),
    ExpertModel(name: 'Mohammad Alsharo', iD: '4'),
  ];

  static final List<MessagedPerson> peronMessagingData = [
    MessagedPerson(
      name: 'Richard Gillit',
      conversation:
          'My name’s Richard Gillett, and I’m an Educational Consultant here at Arden University Berlin.\n '
          'Having had a look at your LinkedIn profile, you seem like the type of motivated prospective student who would benefit from studying your degree abroad with us. We offer a range of postgraduate employability-focussed programmes to help prepare students to pursue their career ambitions.',
      imageUrl: 'lib/assets/pics/RashedGhunaim.jpg',
      personHeadLine: 'Sponsered',
    ),
    MessagedPerson(
      name: 'Richard Gillit',
      conversation:
          'My name’s Richard Gillett, and I’m an Educational Consultant here at Arden University Berlin.\n '
          'Having had a look at your LinkedIn profile, you seem like the type of motivated prospective student who would benefit from studying your degree abroad with us. We offer a range of postgraduate employability-focussed programmes to help prepare students to pursue their career ambitions.',
      imageUrl: 'lib/assets/pics/RashedGhunaim.jpg',
      personHeadLine: 'Sponsered',
    ),
    MessagedPerson(
      name: 'Richard Gillit',
      conversation:
          'My name’s Richard Gillett, and I’m an Educational Consultant here at Arden University Berlin.\n '
          'Having had a look at your LinkedIn profile, you seem like the type of motivated prospective student who would benefit from studying your degree abroad with us. We offer a range of postgraduate employability-focussed programmes to help prepare students to pursue their career ambitions.',
      imageUrl: 'lib/assets/pics/RashedGhunaim.jpg',
      personHeadLine: 'Sponsered',
    ),
    MessagedPerson(
      name: 'Richard Gillit',
      conversation:
          'My name’s Richard Gillett, and I’m an Educational Consultant here at Arden University Berlin.\n '
          'Having had a look at your LinkedIn profile, you seem like the type of motivated prospective student who would benefit from studying your degree abroad with us. We offer a range of postgraduate employability-focussed programmes to help prepare students to pursue their career ambitions.',
      imageUrl: 'lib/assets/pics/RashedGhunaim.jpg',
      personHeadLine: 'Sponsered',
    ),
    MessagedPerson(
      name: 'Richard Gillit',
      conversation:
          'My name’s Richard Gillett, and I’m an Educational Consultant here at Arden University Berlin.\n '
          'Having had a look at your LinkedIn profile, you seem like the type of motivated prospective student who would benefit from studying your degree abroad with us. We offer a range of postgraduate employability-focussed programmes to help prepare students to pursue their career ambitions.',
      imageUrl: 'lib/assets/pics/RashedGhunaim.jpg',
      personHeadLine: 'Sponsered',
    ),
    MessagedPerson(
      name: 'Richard Gillit',
      conversation:
          'My name’s Richard Gillett, and I’m an Educational Consultant here at Arden University Berlin.\n '
          'Having had a look at your LinkedIn profile, you seem like the type of motivated prospective student who would benefit from studying your degree abroad with us. We offer a range of postgraduate employability-focussed programmes to help prepare students to pursue their career ambitions.',
      imageUrl: 'lib/assets/pics/RashedGhunaim.jpg',
      personHeadLine: 'Sponsered',
    ),
    MessagedPerson(
      name: 'Richard Gillit',
      conversation:
          'My name’s Richard Gillett, and I’m an Educational Consultant here at Arden University Berlin.\n '
          'Having had a look at your LinkedIn profile, you seem like the type of motivated prospective student who would benefit from studying your degree abroad with us. We offer a range of postgraduate employability-focussed programmes to help prepare students to pursue their career ambitions.',
      imageUrl: 'lib/assets/pics/RashedGhunaim.jpg',
      personHeadLine: 'Sponsered',
    ),
    MessagedPerson(
      name: 'Richard Gillit',
      conversation:
          'My name’s Richard Gillett, and I’m an Educational Consultant here at Arden University Berlin.\n '
          'Having had a look at your LinkedIn profile, you seem like the type of motivated prospective student who would benefit from studying your degree abroad with us. We offer a range of postgraduate employability-focussed programmes to help prepare students to pursue their career ambitions.',
      imageUrl: 'lib/assets/pics/RashedGhunaim.jpg',
      personHeadLine: 'Sponsered',
    ),
    MessagedPerson(
      name: 'Richard Gillit',
      conversation:
          'My name’s Richard Gillett, and I’m an Educational Consultant here at Arden University Berlin.\n '
          'Having had a look at your LinkedIn profile, you seem like the type of motivated prospective student who would benefit from studying your degree abroad with us. We offer a range of postgraduate employability-focussed programmes to help prepare students to pursue their career ambitions.',
      imageUrl: 'lib/assets/pics/RashedGhunaim.jpg',
      personHeadLine: 'Sponsered',
    ),
    MessagedPerson(
      name: 'Richard Gillit',
      conversation:
          'My name’s Richard Gillett, and I’m an Educational Consultant here at Arden University Berlin.\n '
          'Having had a look at your LinkedIn profile, you seem like the type of motivated prospective student who would benefit from studying your degree abroad with us. We offer a range of postgraduate employability-focussed programmes to help prepare students to pursue their career ambitions.',
      imageUrl: 'lib/assets/pics/RashedGhunaim.jpg',
      personHeadLine: 'Sponsered',
    ),
  ];

  // ignore: non_constant_identifier_names
  static final List<More> MoreItems = [
    More(Icon: MyIcons.bookmark, title: 'Save'),
    More(Icon: MyIcons.report_1, title: 'Report'),
    More(Icon: Icons.link, title: 'Copy Link'),
    More(Icon: MyIcons.unfollow2, title: 'Unfollow '),
  ];

  // ignore: non_constant_identifier_names
  static final List<More> MoreItemsMessanger = [
    More(title: 'New group conversation'),
    More(title: 'Messaging settings '),
    More(title: 'Message request inbox'),
    More(title: 'Set away message'),
  ];

  // ignore: non_constant_identifier_names
  static final List<More> MoreItemsRecivedPost = [
    More(Icon: MyIcons.bookmark, title: 'Save'),
    More(Icon: MyIcons.report_1, title: 'Report'),
    More(Icon: MyIcons.account, title: 'See profile'),
    More(Icon: MyIcons.Snooze, title: 'Snooze'),
  ];
  static final List<Questionaries> qusetionariesData = [
    Questionaries(
        question:
            'Even if this idea had a positive outcome elsewhere, will it work at your organization  ?'),
    Questionaries(
        question:
            'Is there a downside to just skipping this innovative idea  ?'),
    Questionaries(
        question:
            'Even if this idea had a positive outcome elsewhere, will it work at your organization?'),
    Questionaries(
        question:
            'Even if this idea had a positive outcome elsewhere, will it work at your organization?'),
    Questionaries(
        question:
            'Even if this idea had a positive outcome elsewhere, will it work at your organization?'),
    Questionaries(
        question:
            'Even if this idea had a positive outcome elsewhere, will it work at your organization?'),
  ];

  static final List<String> searchHistory = [
    'fuchsia',
    'flutter',
    'widgets',
    'resocoder',
  ];
  static final List<Account> accountData = [
    Account(
        headLine: 'Developer',
        iconImage: MyIcons.account,
        name: 'Rashed Ghunaim'),
  ];

  static final List<UserProfileModel> userProfileData = [
    UserProfileModel(
        branchName: 'Amman . Jabal Alhosein',
        contactInfo: '07882186206 \n rashedghunaim105@gmail.com',
        departmentName: 'IT Department',
        jobName: 'flutter developer',
        livingInfo: 'Alzarqa . Jordan',
        fullName: 'Rashed Ghunaim')
  ];

  static final List<IconsModel> iconsData = [
    IconsModel(icon: MyIcons.businessman),
    IconsModel(icon: MyIcons.rating),
    IconsModel(icon: MyIcons.feedback),
    IconsModel(icon: MyIcons.handshake),
    IconsModel(icon: MyIcons.question__1_),
  ];

  static final List<RecivedPostModel> recivedPostData = [
    RecivedPostModel(
        job: 'IT team Leader',
        fullName: 'Rashed Ghunaim',
        benfitsFrom: 'Tehnological sections',
        headline: 'Accountant',
        ideaType: 'Technological / scientific idea',
        organizationalRank: 'Managment',
        time: 'yeaterday  8:26 AM'),
    RecivedPostModel(
        job: 'IT team Leader',
        fullName: 'Rashed Ghunaim',
        benfitsFrom: 'Technolical sections ',
        headline: 'Accountant',
        ideaType: 'Technological idea',
        organizationalRank: 'Managment',
        time: 'yeaterday  8:26 AM'),
    RecivedPostModel(
        job: 'IT team Leader',
        fullName: 'Rashed Ghunaim',
        benfitsFrom: 'Technolical sections ',
        headline: 'Accountant',
        ideaType: 'Technological idea',
        organizationalRank: 'Managment',
        time: 'yeaterday  8:26 AM'),
    RecivedPostModel(
        job: 'IT team Leader',
        fullName: 'Rashed Ghunaim',
        benfitsFrom: 'Technolical sections ',
        headline: 'Accountant',
        ideaType: 'Technological idea',
        organizationalRank: 'Managment',
        time: 'yeaterday  8:26 AM'),
    RecivedPostModel(
        job: 'IT team Leader',
        fullName: 'Rashed Ghunaim',
        benfitsFrom: 'Technolical sections ',
        headline: 'Accountant',
        ideaType: 'Technological idea',
        organizationalRank: 'Managment',
        time: 'yeaterday  8:26 AM'),
    RecivedPostModel(
        job: 'IT team Leader',
        fullName: 'Rashed Ghunaim',
        benfitsFrom: 'Technolical sections ',
        headline: 'Accountant',
        ideaType: 'Technological idea',
        organizationalRank: 'Managment',
        time: 'yeaterday  8:26 AM'),
  ];
}
