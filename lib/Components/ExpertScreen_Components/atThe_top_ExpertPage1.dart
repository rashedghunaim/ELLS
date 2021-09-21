import 'package:flutter/material.dart';
import 'package:graduation/Custom_Config/Theme.dart';

class AtTheTop1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(MyColors.QuillGrey), width: 0.7),
          color: Colors.transparent),
      width: 600,
      height: 55,
      child: ExpansionTile(
        title: Container(
          width: double.infinity,
          child: Text(
            'Select All',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
       
      ),
    );
  }
}
