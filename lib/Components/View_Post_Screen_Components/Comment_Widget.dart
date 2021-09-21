// class CommentWidget extends StatefulWidget {
//   @override
//   _CommentWidgetState createState() => _CommentWidgetState();
// }

// class _CommentWidgetState extends State<CommentWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Color(MyColors.LatestSharedNearYou),
//           border: Border.all(color: Color(MyColors.grey), width: 0.4)),
//       child: Stack(
//         children: [
//           Align(
//             alignment: Alignment.center,
//             child: Container(
//               width: 670,
//               child: TextField(
//                 onSubmitted: (String query) {
//                   print(query);
//                 },
//                 textAlign: TextAlign.center,
//                 decoration: InputDecoration(
//                   hintText: 'Write a Comment ',
//                   hintStyle: MyTextStyles.writeCommentTextStyle,
//                   filled: true,
//                   labelStyle: TextStyle(fontSize: 12),
//                   contentPadding: EdgeInsets.only(left: 30),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(0.0),
//                     borderSide: BorderSide.none,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(0.0),
//                       borderSide: BorderSide.none),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 9, horizontal: 12),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Icon(
//                   MyIcons.account,
//                   color: Color(MyColors.grey),
//                   size: 30,
//                 ),
//                 Row(
//                   children: [
//                     Icon(
//                       MyIcons.image,
//                       color: Color(MyColors.grey),
//                     ),
//                     Icon(
//                       Icons.emoji_emotions,
//                       color: Color(MyColors.grey),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



