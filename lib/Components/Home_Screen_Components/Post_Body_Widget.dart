import 'package:flutter/material.dart';
import 'package:graduation/Components/Home_Screen_Components/Likes_Comments_Shared_Widget.dart';
import 'package:graduation/Custom_Config/Theme.dart';
import 'package:graduation/Dummy_Data/Fake_Respositery.dart';
import 'package:graduation/Screens/View_Post_Screen.dart';

class PostBody extends StatelessWidget {
  final List<dynamic> userData;
  final String userName;
  final int index;
  PostBody({this.index, this.userData, this.userName});

  @override
  Widget build(BuildContext context) {
    List<dynamic> comments = [];

    final _postData = FakeRepository.postList;

    void navigation() {
      Navigator.of(context).pushNamed(
        ViewPostScreen.routeName,
        arguments: {
          "index": index,
          "userData": userData,
          'commentsList': comments,
        },
      );
    }

    return InkWell(
      onTap: () {
        return navigation();
      },
      child: Container(
        width: 800,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.blue, width: 0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              color: Colors.transparent,
              height: 1,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(userData[index]['descrptions'],
                  style: MyTextStyles.DefaultHeadLineTextStyle4),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Text(
                  _postData[index].tags,
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 15),
            
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  offset: Offset(1.0, 1.0),
                                  spreadRadius: 1,
                                  blurRadius: 1),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            child: Icon(
                              MyIcons.like,
                              size: 11,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  offset: Offset(1.0, 1.0),
                                  spreadRadius: 1,
                                  blurRadius: 1),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            child: Icon(
                              MyIcons.love,
                              size: 11,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  SizedBox(width: 5),
                  // Row(
                  //   children: [
                  //     Text(
                  //       textt.toString(),
                  //       style: TextStyle(fontSize: 12, color: Colors.grey),
                  //     ),
                  //     Text(
                  //       '  .',
                  //       style: TextStyle(
                  //         fontSize: 10,
                  //         color: Colors.blueGrey,
                  //         fontWeight: FontWeight.w300,
                  //       ),
                  //     ),
                  //     SizedBox(width: 5),
                  //     Text(comments.length.toString(),
                  //         style: TextStyle(fontSize: 12, color: Colors.grey)),
                  //     SizedBox(width: 3),
                  //     Text(
                  //       'Comment',
                  //       style: TextStyle(
                  //         fontSize: 12,
                  //         color: Colors.grey,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(color: Colors.blue, height: 0.3),
            SizedBox(height: 20),
            LikesCommentsShared(),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
