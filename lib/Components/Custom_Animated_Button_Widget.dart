import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/Custom_Config/Theme.dart';

class CustomAnimatedButton extends StatefulWidget {
  final onPressed;
  final List<String> concat;
  CustomAnimatedButton({this.concat, this.onPressed});
  final Color darkBlue = Color.fromARGB(255, 18, 32, 47);
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<CustomAnimatedButton>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  double _containerPaddingLeft = 20.0;
  double _animationValue;
  double _translateX = 0;
  double _translateY = 0;
  double _rotate = 0;
  double _scale = 1;

  bool show;
  bool sent = false;
  //Color _color = Colors.lightBlue;
  Color _color = Colors.black;

  @override
  void initState() {
    super.initState();
    // sendData();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1300),
    );
    show = true;
    _animationController.addListener(() {
      setState(() {
        show = false;
        _animationValue = _animationController.value;
        if (_animationValue >= 0.2 && _animationValue < 0.4) {
          _containerPaddingLeft = 100.0;
          _containerPaddingLeft = 10.0;
          _color = Colors.blue;
        } else if (_animationValue >= 0.4 && _animationValue <= 0.5) {
          _translateX = 80.0;
          _rotate = -20.0;
          _scale = 0.1;
        } else if (_animationValue >= 0.5 && _animationValue <= 0.8) {
          _translateY = -20.0;
        } else if (_animationValue >= 0.81) {
          _containerPaddingLeft = 50;
          sent = true;
        }
      });
      print(_translateX);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 0.0, right: 20),
          child: Center(
            child: GestureDetector(
              onTap: () {
                _animationController.forward();
              },
              child: AnimatedContainer(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.circular(100.0),
                  boxShadow: [
                    BoxShadow(
                      color: _color,
                      blurRadius: 21,
                      spreadRadius: -15,
                      offset: Offset(
                        0.0,
                        20.0,
                      ),
                    )
                  ],
                ),
                padding: EdgeInsets.only(
                    left: 25, right: 26.0, top: 10.0, bottom: 10.0),
                duration: Duration(milliseconds: 400),
                curve: Curves.easeOutCubic,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    (!sent)
                        ? AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            child: Icon(
                              Icons.send,
                              color: Colors.white60,
                              size: 20,
                            ),
                            curve: Curves.fastOutSlowIn,
                            transform: Matrix4.translationValues(
                                _translateX, _translateY, 0)
                              ..rotateZ(_rotate)
                              ..scale(_scale),
                            onEnd: widget.onPressed,
                          )
                        : Container(),
                    AnimatedSize(
                      vsync: this,
                      duration: Duration(milliseconds: 600),
                      child: show ? SizedBox(width: 10.0) : Container(),
                    ),
                    AnimatedSize(
                      vsync: this,
                      duration: Duration(milliseconds: 200),
                      child: show
                          ? Text(
                              "Send",
                              style: TextStyle(color: Colors.white60),
                            )
                          : Container(),
                    ),
                    AnimatedSize(
                      vsync: this,
                      duration: Duration(milliseconds: 200),
                      child: sent
                          ? Icon(Icons.done, color: Colors.white60)
                          : Container(),
                    ),
                    AnimatedSize(
                      vsync: this,
                      alignment: Alignment.topLeft,
                      duration: Duration(milliseconds: 600),
                      child: sent ? SizedBox(width: 10.0) : Container(),
                    ),
                    AnimatedSize(
                      vsync: this,
                      duration: Duration(milliseconds: 200),
                      child: sent
                          ? Text(
                              "Sent",
                              style: TextStyle(color: Colors.white60),
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
