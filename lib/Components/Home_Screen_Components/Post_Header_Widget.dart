import 'package:flutter/material.dart';
import 'package:graduation/Custom_Config/Theme.dart';
import 'package:graduation/Dummy_Data/Fake_Respositery.dart';

class PostHeader extends StatelessWidget {
  final int index;
  String empty = "";
  final List<dynamic> userData;

  PostHeader({this.index, this.userData});

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    final _postData = FakeRepository.postList;
    final _more = FakeRepository.MoreItems;
    return Container(
      child: Row(
        children: [
          SizedBox(width: 10),
          InkWell(
            onTap: () {},
            child: Container(
              height: 55,
              width: 55,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  _postData[index].profileUrl,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: 520,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    userData[index]['fullname'],
                    style: TextStyle(
                      color: Color(MyColors.SoftBeach),
                      fontSize: 13.7,
                      fontWeight: FontWeight.w600,
                      wordSpacing: 3,
                    ),
                  ),
                ),
                SizedBox(height: 3),
                Container(
                  // child: Text(
                  //   'Flutter Developer',
                  //   style: TextStyle(
                  //     color: Color(MyColors.SoftBeach),
                  //     fontSize: 13.7,
                  //     fontWeight: FontWeight.w600,
                  //     wordSpacing: 3,
                  //   ),
                  // ),
                ),
                SizedBox(height: 3),
                Container(
                  child: Text(
                    '${now.hour} : ${now.minute}   AM',
                    style: TextStyle(
                      color: Color(MyColors.SoftBeach),
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      wordSpacing: 3,
                    ),
                  ),
                ),
                SizedBox(height: 3),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Text('Experts Rate',
                      style: MyTextStyles.DefaultHeadLineTextStyle2),
                  SizedBox(width: 4),
                  Text(userData[index]['rated'],
                      style: MyTextStyles.DefaultHeadLineTextStyle2),
                  Text('/ 10', style: MyTextStyles.DefaultHeadLineTextStyle2)
                ],
              ),
            ],
          ),
          SizedBox(width: 20),
          PopupMenuButton(
            icon: Icon(
              Icons.more_horiz,
              size: 30,
              color: Colors.white,
            ),
            itemBuilder: (context) {
              return _more.map((e) {
                return PopupMenuItem(
                  child: ListTile(
                    onTap: () {},
                    leading: Icon(e.Icon),
                    title: Text(e.title),
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
    );
  }
}
 // Row(
                //   children: [
                //     Text(
                //       'idea type : ',
                //       style: TextStyle(color: Colors.white),
                //     ),
                //     SizedBox(width: 39),
                //     Text(
                //       userData[index]['type_idea'],
                //       style: TextStyle(color: Colors.white),
                //     ),
                //   ],
                // ),
                // Container(
                //   child: Row(
                //     children: [
                //       Text(
                //         'beneficiaries  : ',
                //         style: TextStyle(color: Colors.white),
                //       ),
                //       SizedBox(width: 7),
                //       Text(
                //         userData[index]['category_Finacial'] == ""
                //             ? ""
                //             : userData[index]['category_Finacial'],
                //         style: TextStyle(color: Colors.white),
                //       ),
                //       SizedBox(width: 5),
                //       Text(
                //         userData[index]['category_Markting'] == ""
                //             ? ""
                //             : userData[index]['category_Markting'],
                //         style: TextStyle(color: Colors.white),
                //       ),
                //       SizedBox(width: 5),
                //       Text(
                //         userData[index]['category_IT'] == ""
                //             ? ""
                //             : userData[index]['category_IT'],
                //         style: TextStyle(color: Colors.white),
                //       ),
                //     ],
                //   ),
                // ),