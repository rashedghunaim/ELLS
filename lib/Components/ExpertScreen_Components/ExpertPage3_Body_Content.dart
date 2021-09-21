import 'package:flutter/material.dart';
import 'package:graduation/Components/ExpertScreen_Components/Form_Fifth_Section.dart';
import 'package:graduation/Components/ExpertScreen_Components/Stipper_Form_First_Section.dart';
import 'package:graduation/Custom_Config/Theme.dart';
import 'Stipper_Form_Fourth_Section.dart';
import 'Stipper_Form_Second_Section.dart';
import 'Stipper_Form_Third_Section.dart';
import 'Stipper_Progress_Form.dart';
import 'Stipper_Progress_Title.dart';

class ExpertPage3BodyContent extends StatefulWidget {
  final userId;
  ExpertPage3BodyContent({this.userId});
  @override
  _ExpertPage3BodyContentState createState() => _ExpertPage3BodyContentState();
}

class _ExpertPage3BodyContentState extends State<ExpertPage3BodyContent> {
  final controller = ScrollController();

  PFormController pFcontroller;

  @override
  void initState() {
    super.initState();
    pFcontroller = PFormController(3);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 100),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(MyColors.SoftBeach),
        ),
        child: SingleChildScrollView(
          controller: controller,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Container(
                    child: Text(
                      'Follow these simple 5 steps to complete your mapping',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Divider(
                  color: Colors.grey,
                  thickness: 0.7,
                  indent: 0.0,
                  endIndent: 150,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 253),
                  child: Container(
                    color: Colors.grey,
                    height: 50,
                    width: 0.7,
                  ),
                ),
                StipperForm(
                  controller: pFcontroller,
                  activeDividerColor: Colors.blue,
                  notActiveDivivderColor: Colors.grey,
                  activeIconColor: Colors.blue,
                  notActiveIconColor: Colors.black,
                  leftExpantionLefting: 300,
                  sections: [
                    FirstFormSection(),
                    FormSecondSection(
                      userId: widget.userId,
                    ),
                    FormThirdSection(),
                    FormFourthSection(),
                    FormFifthSection(),
                  ],
                  title: [
                    StipperTitle(
                      title: 'required step ',
                      subtitle:
                          'a few  questions to help you reach a convincing evaluation',
                    ),
                    StipperTitle(
                      title: 'required step ',
                      subtitle: 'rating are made using a 10 point rating scale',
                    ),
                    StipperTitle(
                      title: 'Optinoal step ',
                      subtitle:
                          'your feeddback will be turned back to the composer',
                    ),
                    StipperTitle(
                      title: 'optional step ',
                      subtitle:
                          'your feeddback will be turned back to the managment',
                    ),
                    StipperTitle(
                      title: 'optional step ',
                      subtitle:
                          'the required revisions need additional information',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
