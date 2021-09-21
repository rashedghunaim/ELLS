import 'package:flutter/material.dart';

class RecivedPostFooter extends StatefulWidget {
  final Function acceptOnnPressed;
  final Function rejectOnPressed;
  RecivedPostFooter({@required this.acceptOnnPressed, this.rejectOnPressed});

  @override
  _RecivedPostFooterState createState() => _RecivedPostFooterState();
}

class _RecivedPostFooterState extends State<RecivedPostFooter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 255),
      child: Container(
        child: Row(
          children: [
            SizedBox(
              width: 100,
              child: RaisedButton(
                onPressed: widget.acceptOnnPressed,
                color: Colors.blue,
                child: Text(
                  'Accept',
                  style: TextStyle(color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 17),
              ),
            ),
            SizedBox(width: 20),
            SizedBox(
              width: 100,
              child: RaisedButton(
                onPressed: widget.rejectOnPressed,
                color: Colors.blue,
                child: Text(
                  'Reject',
                  style: TextStyle(color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
