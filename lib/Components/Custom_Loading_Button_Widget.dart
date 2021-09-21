import 'dart:async';
import 'package:flutter/material.dart';

class CustomLoadingButton extends StatefulWidget {
  final laodingIcon;
  final Function onPressed;
  final String title;
  final Function navigation;
  CustomLoadingButton(
      {this.onPressed, this.title, this.navigation, this.laodingIcon});
  @override
  _CustomLoadingButtonState createState() => _CustomLoadingButtonState();
}

class _CustomLoadingButtonState extends State<CustomLoadingButton>
    with SingleTickerProviderStateMixin {
  bool ispressed = false;
  int state = 0;
  Animation _animation;
  double width = double.infinity;
  GlobalKey _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      key: _globalKey,
      width: width,
      decoration: BoxDecoration(),
      child: RaisedButton(
        hoverColor: Colors.white12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.all(0.8),
        color: state == 2 ? Colors.blue : Colors.black,
        child: buildChildWidget(),
        onPressed: widget.onPressed,
        onHighlightChanged: (pressed) {
          setState(
            () {
              ispressed = pressed;
              if (state == 0) {
                return _animatedButton();
              }
            },
          );
        },
      ),
    );
  }

  void _animatedButton() {
    double initialWidth = _globalKey.currentContext.size.width;

    var animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(animationController)
      ..addListener(() {
        setState(() {
          width = initialWidth - ((initialWidth - 48.0) * _animation.value);
        });
      });
    animationController.forward();
    setState(() {
      state = 1;
    });
    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        state = 2;
      });
    });
  }

  Widget buildChildWidget() {
    if (state == 0) {
      return Text(widget.title, style: TextStyle(color: Colors.white));
    } else if (state == 1) {
      return SizedBox(
        height: 36.0,
        width: 36.0,
        child: CircularProgressIndicator(
          value: null,
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return widget.laodingIcon
          ? Icon(
              Icons.cancel,
              color: Colors.white,
              size: 30,
            )
          : Icon(Icons.check, color: Colors.white);
    }
  }
}
