import 'package:flutter/material.dart';
// import 'package:graduation/Components/Home_Screen_Components/Messiging_Button_Widget.dart';
// import 'package:graduation/Components/View_Post_Screen_Components/ViewPostCenterSide.dart';
// import 'package:graduation/Components/View_Post_Screen_Components/ViewPostLeftSide.dart';
// import 'package:graduation/Components/View_Post_Screen_Components/ViewPostRightSide.dart';

class ViewPostBodyContent extends StatelessWidget {
  final List<dynamic> userData;
  ViewPostBodyContent({this.userData});
  @override
  Widget build(BuildContext context) {
    return Container();
    // return Container(
    //   padding: EdgeInsets.only(top: 30, left: 30, right: 30),
    //   child: Stack(
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Positioned(
    //             top: 0.0,
    //             right: 0.0,
    //             left: 0.0,
    //             child: Align(
    //               alignment: Alignment.topLeft,
    //               child: SingleChildScrollView(
    //                 child: ViewPostLeftSide(height: 300, height2: 500),
    //               ),
    //             ),
    //           ),
    //           Positioned(
    //             top: 0.0,
    //             right: 0.0,
    //             left: 0.0,
    //             child: Align(
    //               alignment: Alignment.topCenter,
    //               child: SingleChildScrollView(
    //                 child: ViewPostCenterSide(),
    //               ),
    //             ),
    //           ),
    //           Positioned(
    //             top: 0.0,
    //             right: 0.0,
    //             left: 0.0,
    //             child: Align(
    //               alignment: Alignment.topRight,
    //               child: SingleChildScrollView(
    //                 child: ViewPostRightSide(height: 300, height2: 500),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //       Align(
    //         alignment: Alignment.bottomRight,
    //         child: MessagingButtonWidget(),
    //       ),
    //     ],
    //   ),
    // );
  }
}
