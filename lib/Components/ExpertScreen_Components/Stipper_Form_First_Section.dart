import 'package:flutter/material.dart';
import 'package:graduation/Custom_Config/Theme.dart';
import 'package:graduation/Dummy_Data/Fake_Respositery.dart';

class FirstFormSection extends StatefulWidget {
  @override
  _FirstFormSectionState createState() => _FirstFormSectionState();
}

class _FirstFormSectionState extends State<FirstFormSection> {
  final qusetionariesData = FakeRepository.qusetionariesData;

  final List<String> questionaries = ['yes', 'no '];
  final List<String> numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
  final List<String> QQQ = [
    'Even if this idea had a positive outcome elsewhere, will it work at your',
    'Is there a clear value proposition that will make it unique in the marketplace  ?',
    'Is there a downside to just skipping this innovative idea  ?',
    'Is there a downside to just skipping this innovative idea  ?',
    'Can this idea become a sellable asset ?',
    'is this idea applicable  ? ',
    'Can this idea become a sellable asset ?',
    'is this idea worthwile compare to other ideas  ?',
    'is it significant enough ? '
  ];

  @override
  Widget build(BuildContext context) {
    String choosenValue;
    String choosenValue1;
    String choosenValue2;
    String choosenValue3;
    String choosenValue4;
    String choosenValue5;
    String choosenValue6;
    String choosenValue7;
    String choosenValue8;
    List<dynamic> g = [];
    g.add(choosenValue);
    g.add(choosenValue1);
    g.add(choosenValue2);
    g.add(choosenValue3);
    g.add(choosenValue4);
    g.add(choosenValue5);
    g.add(choosenValue6);
    g.add(choosenValue7);
    g.add(choosenValue8);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(MyColors.color6),
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: Colors.blue, width: 0.7),
          ),
          height: 600,
          width: 1200,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: 800,
                    height: 500,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(15),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  numbers[index],
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(width: 15),
                                Text(
                                  QQQ[index],
                                  style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 10),
                                dropQuestion(choosenValue: g[index]),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: numbers.length,
                    ),
                  ),
                  Container(
                    height: 0.7,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.only(right: 50, bottom: 20),
                  child: SizedBox(
                    width: 200,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.blue,
                      child: Text(
                        'Submit ',
                        style: TextStyle(color: Colors.black),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 17),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }

  Widget dropQuestion({String choosenValue}) {
    return Container(
      child: DropdownButton(
        icon: Icon(
          MyIcons.dropDown3,
          size: 10,
          color: Colors.white,
        ),
        hint: Container(
          width: 80,
          child: Text(
            'Choose ',
            style: TextStyle(color: Colors.white60),
          ),
        ),
        underline: Container(
          color: Colors.transparent,
        ),
        value: choosenValue,
        onChanged: (newValue) {
          setState(() {
            choosenValue = newValue;
            print(choosenValue);
          });
        },
        items: questionaries.map(
          (e) {
            return DropdownMenuItem(
              value: e,
              child: Text(
                e,
                style: TextStyle(color: Colors.black),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
