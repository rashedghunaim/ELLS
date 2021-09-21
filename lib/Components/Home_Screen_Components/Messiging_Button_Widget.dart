import 'package:flutter/material.dart';
import 'package:graduation/Custom_Config/Theme.dart';
import 'package:graduation/Dummy_Data/Fake_Respositery.dart';

class MessagingButtonWidget extends StatefulWidget {
  @override
  _MessagingButtonState createState() => _MessagingButtonState();
}

class _MessagingButtonState extends State<MessagingButtonWidget> {
  final _messagingData = FakeRepository.peronMessagingData;
  final _more = FakeRepository.MoreItemsMessanger;
  int index = 0;
  List<bool> isHoverr = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  Color _borderColor() {
    if (isHoverr[index] == true) {
      return Color(MyColors.grey);
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      child: ExpansionTile(
        childrenPadding: EdgeInsets.only(left: 16, right: 51),
        //initiallyExpanded: true,
        title: _MessangerHeader(),

        children: [
          Container(
            height: 500, // domination
            color: Color(MyColors.messangerBody),
            child: Column(
              children: [
                _searchMessegesTextField(),
                SizedBox(height: 8),
                _MessangerBody(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _MessangerHeader() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(MyIcons.account, size: 30),
          Text(
            'Messaging',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () {},
            child: Icon(MyIcons.edit, size: 15),
          ),
          PopupMenuButton(
            icon: Icon(
              MyIcons.threedots,
              size: 15,
            ),
            itemBuilder: (context) {
              return _more.map((e) {
                return PopupMenuItem(
                  child: Column(
                    children: [
                      Text(e.title),
                    ],
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _MessangerBody() {
    return Container(
      height: 434,
      //color: Colors.blue,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            child: InkWell(
              onTap: () {},
              onHover: (value) {
                return setState(() {
                  isHoverr[index] = value;
                });
              },
              child: Container(
                decoration: BoxDecoration(color: _borderColor()),
                width: 200,
                height: 70,
                child: Row(
                  children: [
                    Container(
                      height: 70,
                      width: 50,
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.white),
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
                        child: Image.asset('lib/assets/pics/RashedGhunaim.jpg'),
                      ),
                    ),
                    SizedBox(width: 7),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(_messagingData[index].name,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        Text(_messagingData[index].personHeadLine,
                            style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    SizedBox(width: 40),
                    Padding(
                      padding: EdgeInsets.only(bottom: 11),
                      child: Text(
                        'Mar 17 ',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: _messagingData.length,
      ),
    );
  }

  Widget _searchMessegesTextField() {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search messages',
          hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
          fillColor: Colors.grey[20],
          filled: true,
          contentPadding: EdgeInsets.only(left: 50),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.blueGrey[50],
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blueGrey[50]),
          ),
        ),
      ),
    );
  }
}
