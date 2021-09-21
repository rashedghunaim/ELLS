import 'package:flutter/material.dart';
import 'package:graduation/Custom_Config/Theme.dart';
import 'package:graduation/Dummy_Data/Fake_Respositery.dart';
import 'package:like_button/like_button.dart';

import '../common.dart';

class ViewPostBody extends StatefulWidget {
  final Function onPreesed;
  final List<dynamic> comments;
  final List userData;
  final index;
  ViewPostBody({this.index, this.userData, this.onPreesed, this.comments});

  @override
  _ViewPostBodyState createState() => _ViewPostBodyState();
}

class _ViewPostBodyState extends State<ViewPostBody> {
  DateTime now = new DateTime.now();
  List<bool> _isHover = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> _isHover2 = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    final _postData = FakeRepository.postList;
    return Column(
      children: [
        Container(
          width: double.infinity,
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
                child: Text(widget.userData[widget.index]['descrptions'],
                    style: MyTextStyles.DefaultHeadLineTextStyle4),
              ),
              Image.asset(_postData[widget.index].image),

              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    _postData[widget.index].tags,
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
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
                    Row(
                      children: [
                        Text(widget.comments.length.toString(),
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                        SizedBox(width: 3),
                        Text(
                          'Comment',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Divider(color: Colors.blue, height: 0.3),
              SizedBox(height: 20),
              ////////////////////////
              ///likesCommentWidget
              Container(
                margin: EdgeInsets.only(bottom: 2, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {},
                      hoverColor: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LikeButton(
                            circleColor: CircleColor(
                                start: Color(0xff00ddff),
                                end: Color(0xff0099cc)),
                            bubblesColor: BubblesColor(
                              // dotPrimaryColor: Color(0xff33b5e5),
                              // dotSecondaryColor: Color(0xff0099cc),
                              dotPrimaryColor: Colors.blue,
                              dotSecondaryColor: Colors.blue,
                            ),
                            likeBuilder: (bool isLiked) {
                              return Icon(
                                MyIcons.like,
                                color: isLiked ? Colors.blue : Colors.grey,
                                size: 25,
                              );
                            },
                            likeCount: 0,
                            countBuilder:
                                (int count, bool isLiked, String text) {
                              var color = isLiked ? Colors.blue : Colors.grey;
                              Widget result;
                              if (count == 0) {
                                result = Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Text(
                                    "Like",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                );
                              } else
                                result = Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Text(
                                    text,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue,
                                    ),
                                  ),
                                );
                              return result;
                            },
                            padding: EdgeInsets.only(left: 20),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      hoverColor: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(MyIcons.comment, color: Colors.grey),
                          SizedBox(width: 16),
                          Text(
                            'Comment',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      hoverColor: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(MyIcons.share, color: Colors.grey),
                          SizedBox(width: 16),
                          Text(
                            'Share',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      hoverColor: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(MyIcons.sent, color: Colors.grey),
                          SizedBox(width: 16),
                          Text('Send',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 70),
              /////////////////////////////////////
              /// comment widget
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white60,
                    border:
                        Border.all(color: Color(MyColors.grey), width: 0.4)),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 670,
                        child: TextField(
                          onSubmitted: (String query) {
                            setState(() {
                              widget.comments.add(query);
                            });
                            print(query);
                          },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'Write a Comment ',
                            hintStyle: TextStyle(color: Colors.black26),
                            filled: true,
                            labelStyle: TextStyle(fontSize: 12),
                            contentPadding: EdgeInsets.only(left: 30),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            MyIcons.account,
                            color: Color(MyColors.black),
                            size: 30,
                          ),
                          Row(
                            children: [
                              Icon(
                                MyIcons.image,
                                color: Color(MyColors.black),
                              ),
                              Icon(
                                Icons.emoji_emotions,
                                color: Color(MyColors.black),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 25),
        Divider(
          color: Color(MyColors.color8),
          thickness: 0.7,
        ),
        SizedBox(height: 50),

        ///commnt item body
        Container(
          width: 800,
          height: 900,
          child: ListView.builder(
            itemBuilder: (context, index) {
              if (index < widget.comments.length) {
                return Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 20),
                      child: Container(
                        height: 300,
                        width: 0.7,
                        color: Colors.grey,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  MyIcons.account,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 20),
                                Text(
                                  widget.userData[widget.index]['fullname'],
                                  style: TextStyle(color: Colors.white60),
                                ),
                                SizedBox(width: 30),
                                Text(
                                  '(  ${now.hour} : ${now.minute}   AM )',
                                  style: TextStyle(
                                    color: Colors.white60,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            Padding(
                              padding: EdgeInsets.only(left: 40),
                              child: Text(
                                widget.comments[index],
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(height: 100),
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    onHover: (value) {
                                      setState(() {
                                        _isHover[index] = value;
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          'like ',
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 14),
                                        ),
                                        SizedBox(height: 4),
                                        Container(
                                          width: 50,
                                          height: 0.8,
                                          color: textHoverColor(
                                              color: Colors.blue,
                                              color2: Colors.transparent,
                                              isHover: _isHover2[index]),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  InkWell(
                                    onTap: () {},
                                    onHover: (value) {
                                      setState(() {
                                        _isHover[index] = value;
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          'reply ',
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 14),
                                        ),
                                        SizedBox(height: 4),
                                        Container(
                                          width: 50,
                                          height: 0.8,
                                          color: textHoverColor(
                                              color: Colors.blue,
                                              color2: Colors.transparent,
                                              isHover: _isHover2[index]),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 25),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Container(
                            width: double.infinity,
                            height: 0.7,
                            color: Colors.white60,
                          ),
                        ),
                        SizedBox(height: 45),
                      ],
                    ),
                  ],
                );
              } else {
                return null;
              }
            },
            itemCount: widget.comments.length,
          ),
        ),
        SizedBox(height: 50),
      ],
    );
  }
}
