import 'package:flutter/material.dart';

class TextField2 extends StatefulWidget {
  final String hintText;
  final TextEditingController controllerf;
  final String counterText;
  final Function onPressed;
  TextField2(
      {@required this.hintText,
      @required this.controllerf,
      @required this.counterText,
      @required this.onPressed});

  @override
  _TextField2State createState() => _TextField2State();
}

class _TextField2State extends State<TextField2> {
  void _tooglePassword() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isHidden,
      controller: widget.controllerf,
      decoration: InputDecoration(
        hintText: widget.hintText,
        counterText: widget.counterText,
        suffixIcon: IconButton(
            icon: Icon(isHidden ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              _tooglePassword();
            }),
        fillColor: Colors.blueGrey[20],
        filled: true,
        labelStyle: TextStyle(fontSize: 12),
        contentPadding: EdgeInsets.only(left: 30),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.blueGrey[50]),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.blueGrey[50]),
        ),
      ),
    );
  }
}
