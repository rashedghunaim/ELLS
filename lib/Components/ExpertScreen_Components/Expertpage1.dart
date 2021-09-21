import 'package:flutter/material.dart';
import 'package:graduation/Components/ExpertScreen_Components/single_recieved_post_item.dart';

class ExpertPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 800,
        child: SingleRecivedPostItem(),
      ),
    );
  }
}
