import 'package:flutter/material.dart';

class newTo extends StatefulWidget {
  final String title;
  final String title2;
  final bool isActive;
  final Function press;

  newTo({this.press, this.isActive, this.title, this.title2});

  @override
  _newToState createState() => _newToState();
}

class _newToState extends State<newTo> {
  bool _isHover = false;

  Color _borderColor() {
    if (widget.isActive) {
      return Colors.red;
    } else if (!widget.isActive & _isHover) {
      return Colors.black;
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.title,
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        SizedBox(width: 6),
        InkWell(
          onTap: widget.press,
          onHover: (value) {
            setState(() {
              _isHover = value;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 250),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.symmetric(vertical: 20.0 / 2),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: _borderColor(), width: 2),
              ),
            ),
            child: Text(
              widget.title2,
              style: TextStyle(
                color: Colors.black,
                fontWeight:
                    widget.isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
