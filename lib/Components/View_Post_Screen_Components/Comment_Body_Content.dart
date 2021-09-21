// import 'package:flutter/material.dart';
// import 'package:graduation/Custom_Config/Theme.dart';

// import '../common.dart';

// class CommentBodyContent extends StatefulWidget {
//   @override
//   _CommentBodyContentState createState() => _CommentBodyContentState();
// }

// class _CommentBodyContentState extends State<CommentBodyContent> {
//   List<bool> _isHover = [
//     false,
//     false,
//     false,
//     false,
//     false,
//     false,
//     false,
//     false,
//   ];
//   List<bool> _isHover2 = [
//     false,
//     false,
//     false,
//     false,
//     false,
//     false,
//     false,
//     false,
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 800,
//       height: 900,
//       child: ListView.builder(
//         itemBuilder: (context, index) {
//           return Stack(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(left: 10, top: 20),
//                 child: Container(
//                   height: 300,
//                   width: 0.7,
//                   color: Colors.grey,
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Icon(
//                             MyIcons.account,
//                             size: 20,
//                             color: Colors.white,
//                           ),
//                           SizedBox(width: 20),
//                           Text(
//                             'Basel Qarqa',
//                             style: TextStyle(color: Colors.white60),
//                           ),
//                           SizedBox(width: 30),
//                           Text(
//                             '5 hours ',
//                             style: TextStyle(
//                               color: Colors.white60,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 30),
//                       Padding(
//                         padding: EdgeInsets.only(left: 40),
//                         child: Text(
//                           'This work is incredible and it may end up saving our planet and humanity. \nLet us all realign ourselves to this great enterprise from where we are. My group last week during Earthday said they have been subjected to 20 years of environmental education and only a handful of them make decisions based on those 20 years of ',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                       SizedBox(height: 100),
//                       Padding(
//                         padding: EdgeInsets.only(left: 30),
//                         child: Row(
//                           children: [
//                             InkWell(
//                               onTap: () {},
//                               onHover: (value) {
//                                 setState(() {
//                                   _isHover[index] = value;
//                                 });
//                               },
//                               child: Column(
//                                 children: [
//                                   Text(
//                                     'like ',
//                                     style: TextStyle(
//                                         color: Colors.blue, fontSize: 14),
//                                   ),
//                                   SizedBox(height: 4),
//                                   Container(
//                                     width: 50,
//                                     height: 0.8,
//                                     color: textHoverColor(
//                                         color: Colors.blue,
//                                         color2: Colors.transparent,
//                                         isHover: _isHover2[index]),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             SizedBox(width: 7),
//                             InkWell(
//                                 onTap: () {},
//                                 onHover: (value) {
//                                   setState(() {
//                                     _isHover[index] = value;
//                                   });
//                                 },
//                                 child: Column(
//                                   children: [
//                                     Text(
//                                       'reply ',
//                                       style: TextStyle(
//                                           color: Colors.blue, fontSize: 14),
//                                     ),
//                                     SizedBox(height: 4),
//                                     Container(
//                                       width: 50,
//                                       height: 0.8,
//                                       color: textHoverColor(
//                                           color: Colors.blue,
//                                           color2: Colors.transparent,
//                                           isHover: _isHover2[index]),
//                                     )
//                                   ],
//                                 ),
//                                 )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(height: 25),
//                   Padding(
//                     padding: EdgeInsets.only(left: 10),
//                     child: Container(
//                       width: double.infinity,
//                       height: 0.7,
//                       color: Colors.white60,
//                     ),
//                   ),
//                   SizedBox(height: 45),
//                 ],
//               ),
//             ],
//           );
//         },
//         itemCount: 7,
//       ),
//     );
//   }
// }
